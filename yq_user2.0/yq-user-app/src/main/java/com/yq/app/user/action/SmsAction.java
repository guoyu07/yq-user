package com.yq.app.user.action;


import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class SmsAction extends ALDAdminActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private String toUserName;
    private int op;
	public String execute(){
		if(Strings.isNullOrEmpty(toUserName)){
			toUserName = super.getUserName();
		}
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		try {
			userService.sendSmsMsg(toUserName,op);
		} catch (Exception e) {
			 super.setErroCodeNum(3000);
		}
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

	public int getOp() {
		return op;
	}
	public void setOp(int op) {
		this.op = op;
	}
	
}
