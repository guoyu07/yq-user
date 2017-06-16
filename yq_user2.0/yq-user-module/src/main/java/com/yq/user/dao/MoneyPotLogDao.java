package com.yq.user.dao;

import java.util.Collection;
import java.util.Date;
import java.util.TimerTask;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.utils.UrlRequestUtils.Mode;
import com.yq.user.bean.CallBackMsgBean;
import com.yq.user.bo.MoneyPotLog;
import com.yq.user.constant.PasswordKey;
import com.yq.user.utils.EasySecureHttpService.EasySecureHttp;
import com.yq.user.utils.EasySecureHttpService.ResultObject;

public class MoneyPotLogDao extends TimerTask{
	
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "money_pot_log";
	
	
	public boolean addMoneyPotLog(MoneyPotLog moneyPotLog){
		return jdbc.insert(moneyPotLog)>0;
	}
	
	public int add(MoneyPotLog moneyPotLog){
		return jdbc.insertBackKeys(moneyPotLog);
	}
	
	
	public IPage<MoneyPotLog> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" where state = 0 order by id desc";
		return this.jdbc.getListPage(sql, MoneyPotLog.class, null, pageSize, pageIndex);
	}

	public IPage<MoneyPotLog> getUserPageList(String username,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where String = ? order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(username);
		return this.jdbc.getListPage(sql, MoneyPotLog.class, parameter, pageSize, pageIndex);
	}
	
	public boolean updateUser(int id,String username){
		String sql = "update "+table+" set state=1,update_time=? where id=? and username= ? and state<>1 ";
		SqlParameter parameter = new SqlParameter();
		parameter.setObject(new Date());
		parameter.setInt(id);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean update(String id){
		String sql = "update "+table+" set state=1,update_time=? where moneypotorderid=? ";
		SqlParameter parameter = new SqlParameter();
		parameter.setObject(new Date());
		parameter.setString(id);
		return this.jdbc.update(sql, parameter)>0;
	}

	private static final String SUCCESS_TAG = "SUCCESS";
	
	@Override
	public void run() {
				LogSystem.info("开始执行钱罐线程......");
				try{
					IPage<MoneyPotLog> page= getPageList(0, 5);
					LogSystem.info("看看记录条目数:"+page.getTotalSize());
			    	if(page!=null){
			    		Collection<MoneyPotLog> tempList = page.getData();
			    		if(tempList!=null&&tempList.size()>0){
			    			LogSystem.info("处理第一页，有数量 ="+tempList.size());
			    			long sigleStartTime = System.currentTimeMillis();
			    			for (final MoneyPotLog moneyPotLog : tempList) {
			    				LogSystem.log("开始构建：orderid:"+moneyPotLog.getMoneypotorderid());
			    				TreeMap<String,String> paramMap = new TreeMap<String,String>();
			    				paramMap.put("username", moneyPotLog.getUsername());
			    				paramMap.put("name", moneyPotLog.getName());
			    				paramMap.put("userid", moneyPotLog.getUserId());
			    				paramMap.put("amount", moneyPotLog.getMoneyCount()+"");
			    				paramMap.put("id", moneyPotLog.getMoneypotorderid());
			    				paramMap.put("appId", this.getConfigpropertise(PasswordKey.APPID_CALLBACK));
			    				String callBackUrl = this.getConfigpropertise(PasswordKey.APP_MONEYPOT_CALLBACK);
				    			CallBackMsgBean callbackMsg = new CallBackMsgBean(callBackUrl, paramMap, Mode.POST, SUCCESS_TAG) {
				    				@Override
				    				public void afterSuccess() {
				    					update(this.getParamMap().get("id"));
				    				}
				    				@Override
				    				public void afterLoseEffect() {
				    					
				    				}
				    				@Override
				    				public void afterFail() {
				    					
				    				}
				    			};
				    			EasySecureHttp server= new EasySecureHttp(paramMap.get("appId"), "", "", "MD5", this.getConfigpropertise(PasswordKey.APP_MONEYPOT_PASS));
								try {
									LogSystem.log("后台开始第三方请求回调：orderid:"+paramMap.get("id"));
									ResultObject result = server.sendRequest(callBackUrl, paramMap, true);
					    			LogSystem.log("后台开始第三方请求回调结果："+result+",orderid:"+paramMap.get("id"));
					    			if(result.getCode() < 0){
					    				LogSystem.log("后台第三方请求失败:" + result.getMsg()+",orderid:"+paramMap.get("id"));
					    				throw new ServiceException(300, result.getMsg());
					    			}
					    			String strjson = (String) result.getData();
					    			if (SUCCESS_TAG.equals(strjson)) {
					    				callbackMsg.afterSuccess();
					    				LogSystem.info("后台开始第三方请求回调成功！orderid:"+paramMap.get("id"));
					    			}
								} catch (Exception e) {
									e.printStackTrace();
								}
								
							}
			    			long sigleEndTime = System.currentTimeMillis();
			    			LogSystem.info("处理完毕，有数量 ="+tempList.size()+",时长="+(sigleEndTime-sigleStartTime)+"毫秒");
			    		
			    		}
			    	}
		}catch(Exception e){
			e.printStackTrace();
		}
}

	private String getConfigpropertise(String key) {
		return ConfigLoader.getStringValue(key, "");
	}
	
}
