package com.yq.user.action;


import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class QxepmcAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int qx;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		userService.cancleYbSale(super.getUserName(), qx, super.ip());
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public int getQx() {
		return qx;
	}
	public void setQx(int qx) {
		this.qx = qx;
	}
}
