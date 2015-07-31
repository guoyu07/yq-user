package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Epkjdate;
import com.yq.user.service.ManagerService;

public class EpkjjlAction extends ALDAdminPageActionSupport<Epkjdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		super.initPage(managerService.getPageList(super.getToPage(), 15));
		return SUCCESS;
	}

}
