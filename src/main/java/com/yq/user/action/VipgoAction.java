package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class VipgoAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private Gcuser gcuser;
	
	private int cjpay;
	
	public String execute(){
		
		if(status==1){
			UserService userService  = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			gcuser = userService.getUserByUserName(super.getUserName());
			return SUCCESS;
		}
		return INPUT;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public int getCjpay() {
		return cjpay;
	}

	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}
	
}
