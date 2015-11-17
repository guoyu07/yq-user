package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class TelPayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	private String call;
	private String pa3;
	private String smsCode;
	public String execute(){
		if(status==0){
			return SUCCESS;
		}
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.telCharge(super.getUserName(), call, pa3, smsCode, super.ip());
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getPa3() {
		return pa3;
	}
	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}
	public String getSmsCode() {
		return smsCode;
	}
	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}

}
