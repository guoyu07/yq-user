package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class SgRegAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String my;
	
	private String up;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.Sgreg(my, up);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public String getMy() {
		return my;
	}

	public void setMy(String my) {
		this.my = my;
	}

	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}
}
