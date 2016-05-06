package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Ejbk;
import com.yq.user.service.UserService;

public class GmjhAction extends ALDAdminPageActionSupport<Ejbk> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getEjbkPageList(super.getUserName(), super.getToPage(), 50));
		return SUCCESS;
	}

}
