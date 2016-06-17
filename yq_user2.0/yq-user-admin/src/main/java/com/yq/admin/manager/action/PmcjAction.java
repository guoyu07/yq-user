package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class PmcjAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private int status;
	
	private int cjpay;
	
	private String czy;
	
	
	public String execute(){
		if(status==0){
			return INPUT;
		}
		if(status==1){
			return "comfirm";
		}
		if(status==2){
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			adminService.pmToUser(id, cjpay, czy);
			super.setErroCodeNum(2000);
		}
		return SUCCESS;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCjpay() {
		return cjpay;
	}
	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}
	public String getCzy() {
		return czy;
	}
	public void setCzy(String czy) {
		this.czy = czy;
	}
}
