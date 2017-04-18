package com.yq.app.user.action;


import java.util.HashMap;
import java.util.Map;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class Sms3Action extends ALDAdminActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private String toUserName;
    private int op;
    private String inputCall;
    private int status;
    private int other;
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		if(other==1){
			Map<String, String> param= new HashMap<>();
			param.put("call", inputCall);
			userService.checkUserInfo(toUserName,param);
			userService.sendSmsMsgother(toUserName,op,super.getUserName());
			return "success";
		}
		
		if(Strings.isNullOrEmpty(toUserName)){
			toUserName = super.getUserName();
		}
		
		try {
			userService.sendSmsMsg(toUserName,op);
		} catch (Exception e) {
			 super.setErroCodeNum(3000);
		}
		return SUCCESS;
	}

	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public int getOp() {
		return op;
	}
	public void setOp(int op) {
		this.op = op;
	}

	public String getInputCall() {
		return inputCall;
	}

	public void setInputCall(String inputCall) {
		this.inputCall = inputCall;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getOther() {
		return other;
	}

	public void setOther(int other) {
		this.other = other;
	}
	
	
	
}
