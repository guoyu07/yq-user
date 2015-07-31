package com.yq.user.action;

import com.sr178.game.framework.constant.SystemConstant;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class CheckReg extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String gguser;
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser user = userService.getUserByUserName(gguser);
		if(user!=null){
			super.setErroCodeNum(SystemConstant.FAIL_CODE);
		}
		return SUCCESS;
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
