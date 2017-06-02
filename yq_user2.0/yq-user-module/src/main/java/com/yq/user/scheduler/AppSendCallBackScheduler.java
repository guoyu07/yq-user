package com.yq.user.scheduler;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicInteger;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.user.bean.CallBackMsgBean;
import com.yq.user.utils.EasySecureHttpService.EasySecureHttp;
import com.yq.user.utils.EasySecureHttpService.ResultObject;

public  class AppSendCallBackScheduler extends SchedulerEntry{
	public static Map<Integer,CallBackMsgBean> appcallBackMsg = new java.util.concurrent.ConcurrentHashMap<Integer,CallBackMsgBean>();
	private static AtomicInteger sequence = new AtomicInteger(1);  
	 
	public static void addMsg(CallBackMsgBean callbackMsg){
		appcallBackMsg.put(sequence.getAndIncrement(), callbackMsg);
	}
	
	@Override
	public void executeJob(JobExecutionContext jobExecutionContext) throws JobExecutionException {
		LogSystem.info("开始执行钱罐异步回调app,当前数量["+appcallBackMsg.size()+"]");
        for(Entry<Integer,CallBackMsgBean> entry:appcallBackMsg.entrySet()){
     	   if(callBackToServer(entry.getValue())){
     		   entry.getValue().afterSuccess();
     		   appcallBackMsg.remove(entry.getKey());
     	   }else{
     		   entry.getValue().increaseRetryTimes();
     		   entry.getValue().afterFail();
     		   if(entry.getValue().getRetryTimes()>10){
     			   LogSystem.log("重试超过十次app，丢弃==>"+entry.getValue());
     			   entry.getValue().afterLoseEffect();
     			  appcallBackMsg.remove(entry.getKey());
     		   }
     	   }
        }
        	LogSystem.info("钱罐异步回调结束app,还剩数量["+appcallBackMsg.size()+"]");  
	}
	
	private boolean callBackToServer(CallBackMsgBean callBackMsg) {
		boolean methodResult = false;
		try {
			TreeMap<String,String> paramMap = new TreeMap<String,String>();
			paramMap.putAll(callBackMsg.getParamMap());
			EasySecureHttp server= new EasySecureHttp(paramMap.get("appId"), "", "", "MD5", "5lO52LF817msq824");
			ResultObject result = server.sendRequest(callBackMsg.getUrl(), paramMap, true);
			LogSystem.log("第三方请求结果:"+result);
			if(result.getCode() < 0){
				LogSystem.log("第三方请求失败:" + result.getMsg());
				throw new ServiceException(300, result.getMsg());
				
			}
			String strjson = (String) result.getData();
			
			/*String result = UrlRequestUtils.execute(callBackMsg.getUrl(), callBackMsg.getParamMap(), callBackMsg.getMode());
			TreeMap<String, String> resultMap = JSON.parseObject(result,new TypeReference<TreeMap<String, String>>() {});
			System.out.println("id="+resultMap.get("data"));
			String order=resultMap.get("data");
			String state = resultMap.get("code");*/
			LogSystem.log("开始重试回调app:" + callBackMsg.toString() + ",result=" + result);
			if (callBackMsg.getSuccessTag().equals(strjson)) {
				LogSystem.info("重试成功app！"+paramMap.get("id"));
				methodResult = true; 
			}
		} catch (Exception e) {
			LogSystem.error(e, "重试回调失败app！");
		}
		return methodResult;
	}



}
