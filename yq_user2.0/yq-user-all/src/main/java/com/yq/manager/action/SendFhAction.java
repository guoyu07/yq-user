package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class SendFhAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pdid;
	
	private int type;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		
		if(type==1){
			adminService.sendCommonUser(pdid);
			super.setErroCodeNum(2001);
		}else{
			adminService.sendDoubleArea(pdid);
			super.setErroCodeNum(2002);
		}
		
		return SUCCESS;
	}

	public int getPdid() {
		return pdid;
	}

	public void setPdid(int pdid) {
		this.pdid = pdid;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
