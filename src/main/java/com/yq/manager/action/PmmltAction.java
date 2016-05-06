package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.bo.PmmltBean;
import com.yq.manager.service.AdminService;

public class PmmltAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PmmltBean pm;
	private String user;
	
	public String execute(){
	  AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
	  pm = adminService.pmmlt(user);
	  return SUCCESS;
	}

	public PmmltBean getPm() {
		return pm;
	}

	public void setPm(PmmltBean pm) {
		this.pm = pm;
	}

	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}

}
