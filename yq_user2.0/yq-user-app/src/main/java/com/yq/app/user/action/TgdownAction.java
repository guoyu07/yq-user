package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class TgdownAction extends ALDAdminPageActionSupport<Gcuser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Gcuser up;
	
	private String upName;
	
	private int status;
	
	public String execute(){
		
		UserService userService  = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		Gcuser my = userService.getUserByUserName(super.getUserName());
		up = userService.getUserByUserName(my.getUp());
		upName = up.getName().substring(0, 1);
		super.initPage(userService.getMyDownUserPage(super.getUserName(), super.getToPage(), 10));
		
		if(status==1){
			return "tgdowndetail";
		}
		
		return SUCCESS;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Gcuser getUp() {
		return up;
	}

	public void setUp(Gcuser up) {
		this.up = up;
	}

	public String getUpName() {
		return upName;
	}

	public void setUpName(String upName) {
		this.upName = upName;
	}
	
}
