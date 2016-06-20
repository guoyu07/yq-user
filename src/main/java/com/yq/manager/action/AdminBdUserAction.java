package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class AdminBdUserAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	private String bdUser;
	private int sjb;
	
	public String execute(){
		if(!super.getUserName().equals("admin1")){
			return INPUT;
		}
		if(status==0){
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.adminBdUser(bdUser, sjb);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}

	public String getBdUser() {
		return bdUser;
	}

	public void setBdUser(String bdUser) {
		this.bdUser = bdUser;
	}

	public int getSjb() {
		return sjb;
	}

	public void setSjb(int sjb) {
		this.sjb = sjb;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
