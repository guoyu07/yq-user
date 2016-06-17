package com.yq.app.user.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class ReLoginAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String luserName;
	
	public String execute(){
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		userService.relogin(luserName, sessionhttp.getId(), super.ip());
		return SUCCESS;
	}
	
	public String getLuserName() {
		return luserName;
	}

	public void setLuserName(String luserName) {
		this.luserName = luserName;
	}
}
