package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Fcxt;
import com.yq.user.dao.FcxtDao;

public class LeftAction extends ALDAdminActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
 
	private Fcxt fcxt;
	public String execute(){
		FcxtDao fcxtDao = ServiceCacheFactory.getService(FcxtDao.class);
		fcxt = fcxtDao.getAdminUser(super.getUserName());
		
		return SUCCESS;
	}
	public Fcxt getFcxt() {
		return fcxt;
	}
	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}
}
