package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Sgxt;
import com.yq.user.service.UserService;

public class OutDayAction extends ALDAdminPageActionSupport<Sgxt> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		super.initPage(userService.getSgxtPageList(super.getToPage(), 30));
		return SUCCESS;
	}

}
