package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Dgag;
import com.yq.user.service.ManagerService;

public class GgckAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int ck;
	
	private Dgag dgag;
	
	public String execute(){
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		dgag = managerService.getDgag(ck);
		return SUCCESS;
	}

	public int getCk() {
		return ck;
	}

	public void setCk(int ck) {
		this.ck = ck;
	}

	public Dgag getDgag() {
		return dgag;
	}

	public void setDgag(Dgag dgag) {
		this.dgag = dgag;
	}

	
}
