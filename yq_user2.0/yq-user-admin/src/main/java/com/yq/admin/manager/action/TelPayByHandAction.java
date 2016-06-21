package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class TelPayByHandAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private int amount;
	private String call;
	private String user;
	private String oppa;
	public String execute(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }

		if(status==0){
			return SUCCESS;
		}
        if(!oppa.equals("kush56ax")){
			super.setErroCodeNum(1);
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.callRemoteCharge(call, amount, super.ip(), user);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getOppa() {
		return oppa;
	}

	public void setOppa(String oppa) {
		this.oppa = oppa;
	}

	public String getCall() {
		return call;
	}


	public void setCall(String call) {
		this.call = call;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}
	
}
