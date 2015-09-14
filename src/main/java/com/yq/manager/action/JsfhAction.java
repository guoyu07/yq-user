package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class JsfhAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.countYesterday();
		super.setErroCodeNum(2000);
		return SUCCESS;
	}

}
