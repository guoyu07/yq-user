package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.NotAllowedCode;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Sgxt;
import com.yq.user.dao.SgxtDao;
import com.yq.user.dao.TxPayDao;
import com.yq.user.service.UserService;

public class EditYbSaleAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String user;
	private Gcuser gcuser;
	private Sgxt sgxt;
	private String opPass;
	private int status;
	private int rs_ztx;
	private int fhpay;
	private int vippay;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(user);
		@NotAllowedCode
		TxPayDao txPayDao = ServiceCacheFactory.getService(TxPayDao.class);
		rs_ztx = txPayDao.getUserSumPayNum(user);
		@NotAllowedCode
		SgxtDao sgxtDao = ServiceCacheFactory.getService(SgxtDao.class);
		sgxt = sgxtDao.get(user);
		if(status==1){
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			adminService.editYbSale(user, opPass, fhpay, vippay);
			super.setErroCodeNum(2000);
		}
		return SUCCESS;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public Sgxt getSgxt() {
		return sgxt;
	}
	public void setSgxt(Sgxt sgxt) {
		this.sgxt = sgxt;
	}
	public String getOpPass() {
		return opPass;
	}
	public void setOpPass(String opPass) {
		this.opPass = opPass;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRs_ztx() {
		return rs_ztx;
	}
	public void setRs_ztx(int rs_ztx) {
		this.rs_ztx = rs_ztx;
	}
	public int getFhpay() {
		return fhpay;
	}
	public void setFhpay(int fhpay) {
		this.fhpay = fhpay;
	}
	public int getVippay() {
		return vippay;
	}
	public void setVippay(int vippay) {
		this.vippay = vippay;
	}
	
}
