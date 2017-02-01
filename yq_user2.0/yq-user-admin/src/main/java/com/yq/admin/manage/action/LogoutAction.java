package com.yq.admin.manage.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class LogoutAction extends ALDAdminActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	public String logout(){
		AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		System.out.println("sessionhttpout1="+sessionhttp.getId());
		adminService.logout(sessionhttp.getId());
		return SUCCESS;
	}

}