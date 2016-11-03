package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.SysBiLog;
import com.yq.user.service.LogService;

public class BybdbLogAction extends ALDAdminPageActionSupport<SysBiLog> {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1196423120979337071L;

	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
        super.initPage(logService.getSysBiLogPageList(super.getUserName(), null, null, super.getToPage(), 20));
		return SUCCESS;
	}
	
}
