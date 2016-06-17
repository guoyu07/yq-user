package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.bo.DateBean;
import com.yq.manager.service.AdminService;

public class DateAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DateBean bean;
	
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		bean = adminService.getDateBean();
		return SUCCESS;
	}

	public DateBean getBean() {
		return bean;
	}
	public void setBean(DateBean bean) {
		this.bean = bean;
	}
}
