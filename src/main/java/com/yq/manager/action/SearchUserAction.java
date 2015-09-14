package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;

public class SearchUserAction extends ALDAdminPageActionSupport<Gcuser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private String user;
	
	public String execute(){
		if(status==0){
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
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
	
	

}
