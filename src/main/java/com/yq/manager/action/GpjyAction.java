package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gpjy;

public class GpjyAction extends ALDAdminPageActionSupport<Gpjy> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String jylb;
	private String userid;
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.searchGpjyPageList(jylb, userid, super.getToPage(), 30));
		
		return SUCCESS;
	}

	public String getJylb() {
		return jylb;
	}

	public void setJylb(String jylb) {
		this.jylb = jylb;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
