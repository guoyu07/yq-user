package com.yq.app.user.action;


import java.util.HashMap;
import java.util.Map;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class SmsAction extends ALDAdminActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private String toUserName;
    private int op;
    private String inputCall;
    private int status;
	public String execute(){
		if(Strings.isNullOrEmpty(toUserName)){
			toUserName = super.getUserName();
		}
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(status==8){//验证手机号
			Map<String, String> param= new HashMap<>();
			param.put("call", inputCall);
			userService.checkUserInfo(toUserName,param);
			userService.sendSmsMsg(toUserName,op);
			return "success";
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
	
	
	
}
