package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class BtpayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	private String uid;
	private Gcuser gcuser;
	private int btpay;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0||btpay==0){
			gcuser = userService.getUserByUserName(uid);
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addBtPay(uid, btpay);
		gcuser = userService.getUserByUserName(uid);
		return SUCCESS;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public int getBtpay() {
		return btpay;
	}
	public void setBtpay(int btpay) {
		this.btpay = btpay;
	}
}
