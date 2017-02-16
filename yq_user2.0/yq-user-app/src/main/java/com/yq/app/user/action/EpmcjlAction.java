package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Txpay;
import com.yq.user.service.UserService;

public class EpmcjlAction extends ALDAdminPageActionSupport<Txpay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getTxpaySalesDetailsPage(super.getUserName(), super.getToPage(), 10));
		if(status==1){
			return "mcdetail";
		}
		return SUCCESS;
	}
	
	public String epmcjlmcdetail(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		super.initPage(userService.getTxpaySalesDetailsPage(super.getUserName(), super.getToPage(), 20));
		return "mcdetail";
	}
	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
}
