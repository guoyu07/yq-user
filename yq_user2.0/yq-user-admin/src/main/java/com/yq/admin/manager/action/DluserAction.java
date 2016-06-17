package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class DluserAction extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uid;
	private int status;
	private Gcuser gcuser;
	
	private int jb;
	
	private String dldate;
	private String dqdate;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0){
			gcuser = userService.getUserByUserName(uid);
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.changeDldate(uid,jb,dldate,dqdate);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public String changeShengAdmin(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.changeSheng(uid);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public String changeShiAdmin(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.changeShi(uid);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public String changeAreaAdmin(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.changeArea(uid);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public String changeBigAreaAdmin(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.changeBigArea(uid);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public int getJb() {
		return jb;
	}

	public void setJb(int jb) {
		this.jb = jb;
	}

	public String getDldate() {
		return dldate;
	}

	public void setDldate(String dldate) {
		this.dldate = dldate;
	}

	public String getDqdate() {
		return dqdate;
	}

	public void setDqdate(String dqdate) {
		this.dqdate = dqdate;
	}
}
