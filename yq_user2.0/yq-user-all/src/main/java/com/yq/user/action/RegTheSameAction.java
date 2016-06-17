package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class RegTheSameAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private Gcuser gcuser;
	
	private String gguser;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(status==0){
			gcuser = userService.getUserByUserName(super.getUserName());
		}else{
			userService.regTheSameUser(gguser, super.getUserName());
			super.setErroCodeNum(2);
		}
		return SUCCESS;
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

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public String getGguser() {
		return gguser;
	}

	public void setGguser(String gguser) {
		this.gguser = gguser;
	}
}
