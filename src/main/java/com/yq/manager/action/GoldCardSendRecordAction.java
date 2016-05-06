package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Jbkzj;
import com.yq.user.service.LogService;

public class GoldCardSendRecordAction extends ALDAdminPageActionSupport<Jbkzj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		LogService logService = ServiceCacheFactory.getService(LogService.class);
		super.initPage(logService.getAllJbkjzPageList(super.getToPage(), 50));
		return SUCCESS;
	}

}
