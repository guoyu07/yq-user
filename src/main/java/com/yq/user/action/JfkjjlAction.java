package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Jfkjdate;
import com.yq.user.service.ManagerService;

public class JfkjjlAction extends ALDAdminPageActionSupport<Jfkjdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		
		super.initPage(managerService.getJfkjdatePage(super.getToPage(), 15));
		
		return SUCCESS;
	}

}
