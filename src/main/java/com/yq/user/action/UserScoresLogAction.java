package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.UserScoresLog;
import com.yq.user.service.UserService;

public class UserScoresLogAction extends ALDAdminPageActionSupport<UserScoresLog> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		super.initPage(userService.getUserScoresLogPage(super.getUserName(), super.getToPage(), 30));
		return SUCCESS;
	}

	
}
