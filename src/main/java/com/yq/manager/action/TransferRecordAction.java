package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Txpay;

public class TransferRecordAction extends ALDAdminPageActionSupport<Txpay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getTranserRecordList(super.getToPage(), 50));
		return SUCCESS;
	}

}
