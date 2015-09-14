package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.bo.PmmltBean;
import com.yq.manager.service.AdminService;

public class MltAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PmmltBean pm;
	private String my;
	private String up;
	
	public String execute(){
	  AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
	  pm = adminService.mlt(my, up);
	  return SUCCESS;
	}
	
	public String bsReg(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		pm = adminService.bsReg(my);
		return SUCCESS;
	}

	public PmmltBean getPm() {
		return pm;
	}

	public void setPm(PmmltBean pm) {
		this.pm = pm;
	}

	public String getMy() {
		return my;
	}

	public void setMy(String my) {
		this.my = my;
	}

	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}


}
