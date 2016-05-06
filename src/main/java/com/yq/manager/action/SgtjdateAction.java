package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Sgtj;

public class SgtjdateAction extends ALDAdminPageActionSupport<Sgtj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getSgtjPageList(super.getToPage(), 30));
		return SUCCESS;
	}

}
