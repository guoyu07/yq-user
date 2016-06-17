package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.bo.GcfhBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcfh;

public class LjsyAction extends ALDAdminPageActionSupport<Gcfh> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    public GcfhBean gcfhBean;
    
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		
		gcfhBean = adminService.getGcfhBean();
		
		super.initPage(adminService.getAllGcfhPage(super.getToPage(), 30));
		
		return SUCCESS;
	}

	public GcfhBean getGcfhBean() {
		return gcfhBean;
	}

	public void setGcfhBean(GcfhBean gcfhBean) {
		this.gcfhBean = gcfhBean;
	}
}
