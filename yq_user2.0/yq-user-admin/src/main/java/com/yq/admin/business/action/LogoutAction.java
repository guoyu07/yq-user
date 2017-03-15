package com.yq.admin.business.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.business.service.BusinessService;
import com.yq.common.action.ALDAdminActionSupport;

public class LogoutAction extends ALDAdminActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	public String logout(){
		BusinessService businessService = ServiceCacheFactory.getServiceCache().getService(BusinessService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
		businessService.logout(sessionhttp.getId());
		return SUCCESS;
	}

}
