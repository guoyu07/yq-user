package com.yq.app.vip.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class LoginoutAction extends ALDAdminActionSupport {

	private static final long serialVersionUID = 1L;
	
	private int type;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		userService.delVipTokenSession(sessionhttp.getId());
		userService.delVipSession(sessionhttp.getId());
		super.setErroCodeNum(2000);
		return SUCCESS;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
