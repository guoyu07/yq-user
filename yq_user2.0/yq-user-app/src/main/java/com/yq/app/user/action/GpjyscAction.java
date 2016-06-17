package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Fcxt;
import com.yq.user.service.ManagerService;

public class GpjyscAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Fcxt fcxt;
	public String execute(){
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class); 
		fcxt = managerService.getFcxtById(2);
		return SUCCESS;
		
	}
	public Fcxt getFcxt() {
		return fcxt;
	}
	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}

}
