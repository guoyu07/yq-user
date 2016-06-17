package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fhdate;

public class FhjlAction extends ALDAdminPageActionSupport<Fhdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Double sumPdlj;
	

	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getFhdatePageList(super.getToPage(), 30));
		sumPdlj = adminService.getTodaySumpdlj();
		
		
		
		return SUCCESS;
	}
	
	
	public Double getSumPdlj() {
		return sumPdlj;
	}

	public void setSumPdlj(Double sumPdlj) {
		this.sumPdlj = sumPdlj;
	}

}
