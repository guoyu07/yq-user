package com.yq.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class Login2jAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String inputUrl;
	private String password3;
	
	private int status;
	
	
	public String execute(){
		if(status!=0){
			UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			Gcuser user = userService.getUserByUserName(super.getUserName());
			if(Strings.isNullOrEmpty(password3)||!user.getPassword3().equals(password3)){
				super.setErroCodeNum(1);
			}
			return SUCCESS;
		}
		
		return INPUT;
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	public String getInputUrl() {
		return inputUrl;
	}

	public void setInputUrl(String inputUrl) {
		this.inputUrl = inputUrl;
	}

	public String getPassword3() {
		return password3;
	}
	public void setPassword3(String password3) {
		this.password3 = password3;
	}

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserName() {
		return super.getUserName();
	}
}
