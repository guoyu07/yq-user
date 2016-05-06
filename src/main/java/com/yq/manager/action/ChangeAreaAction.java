package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class ChangeAreaAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String diyid;
	private int sjid;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.changeArea(diyid, sjid);
		super.setErroCodeNum(201);
		return SUCCESS;
	}

	public String getDiyid() {
		return diyid;
	}

	public void setDiyid(String diyid) {
		this.diyid = diyid;
	}

	public int getSjid() {
		return sjid;
	}

	public void setSjid(int sjid) {
		this.sjid = sjid;
	}
	
	
}
