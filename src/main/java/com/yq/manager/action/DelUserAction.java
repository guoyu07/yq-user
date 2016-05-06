package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class DelUserAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String del;
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.delUser(del);
		return SUCCESS;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}
}
