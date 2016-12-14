package com.yq.admin.manager.action;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.ModifyUserLog;

public class SearchModifyUserLogAction extends ALDAdminPageActionSupport<ModifyUserLog> {
	
	private static final long serialVersionUID = 1L;

	private String zuser;
	private int indexsize;
	private int status;
	public String searchmodifyuserlog(){
		if(status==1){
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			super.initPage(adminService.getModifyUserLogByUsername(zuser,10, super.getToPage()));
		}
		return SUCCESS;
	}

	public String getZuser() {
		return zuser;
	}

	public void setZuser(String zuser) {
		this.zuser = zuser;
	}

	public int getIndexsize() {
		return indexsize;
	}

	public void setIndexsize(int indexsize) {
		this.indexsize = indexsize;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	

}
