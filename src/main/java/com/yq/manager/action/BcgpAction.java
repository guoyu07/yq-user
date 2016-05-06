package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcfh;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.UserService;

public class BcgpAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private String bcid;
	private int bcgp;
	private int gcgc;
	
	private Gcfh gcfh;
	private Gpjy gpjy;
	
	private Gcuser gcuser;
	public String execute(){
		
		if(status==0){
			UserService userService = ServiceCacheFactory.getService(UserService.class);
			gcuser =  userService.getUserByUserName(bcid);
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.editGfAndJf(bcid, gcgc, bcgp);
		gcfh = adminService.getGcfh(bcid, "系统配送");
		gpjy = adminService.getGpjy(bcid, "系统配送");
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getBcgp() {
		return bcgp;
	}
	public void setBcgp(int bcgp) {
		this.bcgp = bcgp;
	}
	public int getGcgc() {
		return gcgc;
	}
	public void setGcgc(int gcgc) {
		this.gcgc = gcgc;
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
	public Gcfh getGcfh() {
		return gcfh;
	}
	public void setGcfh(Gcfh gcfh) {
		this.gcfh = gcfh;
	}
	public Gpjy getGpjy() {
		return gpjy;
	}
	public void setGpjy(Gpjy gpjy) {
		this.gpjy = gpjy;
	}
}
