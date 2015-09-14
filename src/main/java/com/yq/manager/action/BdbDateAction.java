package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Bdbdate;

public class BdbDateAction extends ALDAdminPageActionSupport<Bdbdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getBdbdatePageList(super.getToPage(), 30));
		return SUCCESS;
	}

	
}
