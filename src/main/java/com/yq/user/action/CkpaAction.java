package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Ejbk;
import com.yq.user.service.UserService;

public class CkpaAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private Ejbk ejbk;
	
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		 
		return SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Ejbk getEjbk() {
		return ejbk;
	}

	public void setEjbk(Ejbk ejbk) {
		this.ejbk = ejbk;
	}
}
