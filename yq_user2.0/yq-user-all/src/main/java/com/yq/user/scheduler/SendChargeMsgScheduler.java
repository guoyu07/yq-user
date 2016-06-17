package com.yq.user.scheduler;

import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.yq.common.utils.UrlRequestUtils;
import com.yq.user.bean.CallBackMsgBean;
/**
 * 消息回调接口
 * @author ThinkPad User
 *
 */
public class SendChargeMsgScheduler extends SchedulerEntry {
	public static Map<Integer,CallBackMsgBean> callBackMsg = new java.util.concurrent.ConcurrentHashMap<Integer,CallBackMsgBean>();
	private static AtomicInteger sequence = new AtomicInteger(1);  
	 
	public static void addMsg(CallBackMsgBean callbackMsg){
		callBackMsg.put(sequence.getAndIncrement(), callbackMsg);
	}
	
	@Override
	public void executeJob(JobExecutionContext jobExecutionContext) throws JobExecutionException {
		LogSystem.info("开始执行异步消息回调,当前数量["+callBackMsg.size()+"]");
               for(Entry<Integer,CallBackMsgBean> entry:callBackMsg.entrySet()){
            	   if(callBackToServer(entry.getValue())){
            		   callBackMsg.remove(entry.getKey());
            	   }else{
            		   entry.getValue().increaseRetryTimes();
            		   if(entry.getValue().getRetryTimes()>10){
            			   LogSystem.log("重试超过十次，丢弃==>"+entry.getValue());
            			   callBackMsg.remove(entry.getKey());
            		   }
            	   }
               }
         LogSystem.info("异步消息回调结束,还剩数量["+callBackMsg.size()+"]");      
	}
	
	private boolean callBackToServer(CallBackMsgBean callBackMsg) {
		boolean methodResult = false;
		try {
			String result = UrlRequestUtils.execute(callBackMsg.getUrl(), callBackMsg.getParamMap(), callBackMsg.getMode());
			LogSystem.log("开始重试回调:" + callBackMsg.toString() + ",result=" + result);
			if (callBackMsg.getSuccessTag().equals(result)) {
				LogSystem.info("重试成功！"+result);
				methodResult = true; 
			}
		} catch (Exception e) {
			LogSystem.error(e, "重试回调失败！");
		}
		return methodResult;
	}

}
