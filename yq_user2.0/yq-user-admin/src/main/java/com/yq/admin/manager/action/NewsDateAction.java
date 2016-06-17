package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.bo.NewsDateBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Dateip;

public class NewsDateAction extends ALDAdminPageActionSupport<Dateip> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private NewsDateBean bean;
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		bean = adminService.getNewsDateBean();
		super.initPage(adminService.getAllDateIp(super.getToPage(), 30));
		return SUCCESS;
	}
	public NewsDateBean getBean() {
		return bean;
	}

	public void setBean(NewsDateBean bean) {
		this.bean = bean;
	}
}
