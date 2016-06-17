package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.bo.W10Bean;
import com.yq.manager.service.AdminService;

public class W10Action extends ALDAdminPageActionSupport<W10Bean> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uid;
	private String uname;
	private String riqi;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
        super.initPage(adminService.getTxpayPage(super.getToPage(), 20,uid,uname,riqi));
		return SUCCESS;
	}
	
	private int payid;
	private int op;
	private int page;
	public String syusers(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.syusers(payid, op);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	private String user;
	private int verify;
	public String setVerify(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.setVerifile(user, verify);
		super.setErroCodeNum(2001);
		return SUCCESS;
	}
	
	public int getPayid() {
		return payid;
	}
	public void setPayid(int payid) {
		this.payid = payid;
	}
	public int getOp() {
		return op;
	}
	public void setOp(int op) {
		this.op = op;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRiqi() {
		return riqi;
	}
	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}
	
}
