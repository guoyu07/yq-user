package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.bo.PointsChangeLog;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;

public class FcxtAction extends ALDAdminPageActionSupport<PointsChangeLog> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Fcxt fcxt;
	
	private int ration;
	
	private int cc;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			fcxt = adminService.getFcxt(2);
		super.initPage(adminService.getPointChangeLogPage(super.getToPage(), 20));
		return SUCCESS;
	}
	
	public String updateRation(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.updateCz04(ration);
		
		return SUCCESS;
	}
	
	
	public String updateCurrentCharge(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.updateJy5wRation(cc);
		return SUCCESS;
	}

	public Fcxt getFcxt() {
		return fcxt;
	}

	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}

	public int getRation() {
		return ration;
	}

	public void setRation(int ration) {
		this.ration = ration;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}
}
