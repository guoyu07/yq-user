package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Txpay;
import com.yq.user.service.UserService;

public class EpmyjlAction extends ALDAdminPageActionSupport<Txpay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getTxpayBuyDetailsPage(super.getUserName(), super.getToPage(), 10));
		return SUCCESS;
	}
	public String epmyjlmrdetail(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getTxpayBuyDetailsPage(super.getUserName(), super.getToPage(), 10));
		return "mrdetail";
	}
	
	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
