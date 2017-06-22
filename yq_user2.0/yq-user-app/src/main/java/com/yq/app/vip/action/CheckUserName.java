package com.yq.app.vip.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class CheckUserName extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String gguser;
	private String callback;
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gguser = gguser.toLowerCase();
		Gcuser user = userService.getUserByUserName(gguser);
		if(user!=null){
			if(user.getVip()!=0){
				super.setErroCodeNum(2000);
				return SUCCESS;
			}else{
				super.setErroCodeNum(2002);
				return SUCCESS;
			}
		}
		return SUCCESS;
	}
	
	
	public String getCallback() {
		return callback;
	}


	public void setCallback(String callback) {
		this.callback = callback;
	}


	public String getGguser() {
		return gguser;
	}
	public void setGguser(String gguser) {
		this.gguser = gguser;
	}
	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
}
