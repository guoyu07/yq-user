package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Tduser;

public class GaiuserAction extends ALDAdminPageActionSupport<Tduser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String suser;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getTduserPage(suser, super.getToPage(), 50));
		return SUCCESS;
	}
	public String getSuser() {
		return suser;
	}
	public void setSuser(String suser) {
		this.suser = suser;
	}
}
