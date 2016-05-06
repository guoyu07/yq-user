package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class CgksAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int cpbh;
	
	private int leftTimes;
	public String execute(){
		
		UserService userSerivice = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		leftTimes = userSerivice.jfQg(super.getUserName(), cpbh);
		if(leftTimes!=-1){
			super.setErroCodeNum(3);
		}
		return SUCCESS;
	}
	public int getCpbh() {
		return cpbh;
	}
	public void setCpbh(int cpbh) {
		this.cpbh = cpbh;
	}
	public int getLeftTimes() {
		return leftTimes;
	}
	public void setLeftTimes(int leftTimes) {
		this.leftTimes = leftTimes;
	}
	
	
}
