package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class VipUpAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	private Gcuser gcuserup;
	
	private String upuname;
	
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		
		gcuserup = userService.getUserByUserName(gcuser.getVipname());
		if(gcuserup!=null){
			upuname = gcuserup.getUsername().substring(0, 2);
		}else{
			upuname = "**";
		}
		return SUCCESS;
	}
	public Gcuser getGcuserup() {
		return gcuserup;
	}
	public void setGcuserup(Gcuser gcuserup) {
		this.gcuserup = gcuserup;
	}
	public String getUpuname() {
		return upuname;
	}
	public void setUpuname(String upuname) {
		this.upuname = upuname;
	}

	
}
