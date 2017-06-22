package com.yq.app.vip.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class MyepokAction extends ALDAdminActionSupport {

	private static final long serialVersionUID = 1L;
	private int ep;
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		userService.sureIGivedMoney(super.getUserName(), ep);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public int getEp() {
		return ep;
	}
	public void setEp(int ep) {
		this.ep = ep;
	}
	
	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
}
