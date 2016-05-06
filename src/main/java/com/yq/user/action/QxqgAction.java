package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class QxqgAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private int qxid;
	
	private String pa3;
	
	public String execute(){
		
		if(status==1){
			UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			userService.cancelBuyJf(super.getUserName(), qxid, pa3);
			super.setErroCodeNum(2000);
		}
		return SUCCESS;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getQxid() {
		return qxid;
	}

	public void setQxid(int qxid) {
		this.qxid = qxid;
	}

	public String getPa3() {
		return pa3;
	}

	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}
	
	
}
