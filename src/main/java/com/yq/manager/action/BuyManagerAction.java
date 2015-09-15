package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Cpuser;

public class BuyManagerAction extends ALDAdminPageActionSupport<Cpuser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getCpuserPageList(super.getToPage(),30));
		return SUCCESS;
	}
	
	private int cp;
	public String recoverGoods(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.recoverGoods(cp);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	private int cgId;
	public String fwdate(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.fwDate(cgId);
		super.setErroCodeNum(2001);
		return SUCCESS;
	}
	public int getCp() {
		return cp;
	}
	public void setCp(int cp) {
		this.cp = cp;
	}
	public int getCgId() {
		return cgId;
	}
	public void setCgId(int cgId) {
		this.cgId = cgId;
	}
}
