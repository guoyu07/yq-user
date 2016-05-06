package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class BankAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Gcuser gcuser;

	private Gcuser gcuserup;
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		gcuserup = userService.getUserByUserName(gcuser.getVipname());
		return SUCCESS;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public Gcuser getGcuserup() {
		return gcuserup;
	}

	public void setGcuserup(Gcuser gcuserup) {
		this.gcuserup = gcuserup;
	}
	
}
