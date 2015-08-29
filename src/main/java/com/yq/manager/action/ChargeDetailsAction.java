package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datecj;
import com.yq.user.service.LogService;

public class ChargeDetailsAction extends ALDAdminPageActionSupport<Datecj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getAllDateCjPageList(super.getToPage(), 30));
		return SUCCESS;
	}

}
