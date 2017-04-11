package com.yq.admin.manage.action;


import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.service.ManageService;

public class SmsAction extends ALDAdminActionSupport{

	private static final long serialVersionUID = 1L;
	
    private String adminUserName;
    private int op;
    private String inputCall;
    private int status;
	public String execute(){
		if(Strings.isNullOrEmpty(adminUserName)){
			adminUserName = super.getUserName();
		}
		ManageService manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
		if(manageService.checkAdmin(adminUserName)){
			manageService.sendSmsMsg(adminUserName,op);
			super.setErroCodeNum(200);
		}
		return SUCCESS;
	}

	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}


	public String getAdminUserName() {
		return adminUserName;
	}

	public void setAdminUserName(String adminUserName) {
		this.adminUserName = adminUserName;
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
