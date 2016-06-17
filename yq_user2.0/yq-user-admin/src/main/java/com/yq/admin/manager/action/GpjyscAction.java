package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.ManagerService;

public class GpjyscAction extends ALDAdminPageActionSupport<Gpjy> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Fcxt fcxt;
	
	public String execute(){
		ManagerService managerService = ServiceCacheFactory.getService(ManagerService.class);
		fcxt = managerService.getFcxtById(2);
		
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getGpjyPageList(super.getToPage(), 30));
		
		return SUCCESS;
	}

	public Fcxt getFcxt() {
		return fcxt;
	}

	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}
}
