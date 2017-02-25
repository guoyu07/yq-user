package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.UserService;

public class GpgymcAction extends ALDAdminPageActionSupport<Gpjy> {

	private static final long serialVersionUID = 1L;
	private String userName;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		//super.initPage(userService.getMcPageList(super.getUserName(), super.getToPage(), 10));
		super.setDataList(userService.getMcPageList(10,super.getUserName()));
		return SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
