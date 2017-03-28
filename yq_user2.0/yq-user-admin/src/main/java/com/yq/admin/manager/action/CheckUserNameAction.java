package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class CheckUserNameAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String user;
	private String name;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(user);
		if(gcuser!=null){
			name = gcuser.getName();
			return "success";
		}else{
			super.setCode(1);
			return "success";
		}
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
