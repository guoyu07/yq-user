package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;

public class SearchUserAction extends ALDAdminPageActionSupport<Gcuser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private String user;
	
	private Fcxt fcxt;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		fcxt = adminService.getAdminUser(super.getUserName());
		
		if(status==0){
			return INPUT;
		}
		super.initPage(adminService.searchUser(user,super.getToPage(),300));
		return SUCCESS;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Fcxt getFcxt() {
		return fcxt;
	}

	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}
	
	

}
