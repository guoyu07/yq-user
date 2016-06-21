package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class BcjfAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private String bcid;
	private int bcjf;
	
	private Gcuser gcuser;
	public String execute(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0){
			gcuser =  userService.getUserByUserName(bcid);
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addJf(bcid, bcjf);
		gcuser =  userService.getUserByUserName(bcid);
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getBcid() {
		return bcid;
	}
	public void setBcid(String bcid) {
		this.bcid = bcid;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public int getBcjf() {
		return bcjf;
	}
	public void setBcjf(int bcjf) {
		this.bcjf = bcjf;
	}
}
