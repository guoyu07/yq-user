package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class JfcfAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		return SUCCESS;
	}
	
	public String chaifeng(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.JygChaifen();
		 super.setErroCodeNum(2000);
		return SUCCESS;
	}

     public String cfdm(){
    	 AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
    	 adminService.jfdm();
    	 super.setErroCodeNum(2001);
		return SUCCESS;
	}
}
