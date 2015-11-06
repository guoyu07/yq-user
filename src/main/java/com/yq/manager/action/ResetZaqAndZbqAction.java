package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class ResetZaqAndZbqAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		new Thread(new  Runnable() {
			public void run() {
				AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
				adminService.resetZaqAndZbq();
			}
		}).start();
		return SUCCESS;
	}

}
