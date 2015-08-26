package com.yq.user.action;


import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class SmsAction extends ALDAdminActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private String toUserName;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		userService.sendSmsMsg(toUserName);
		return SUCCESS;
	}

	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
}
