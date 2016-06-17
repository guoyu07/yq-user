package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class BdbZzAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private int jzpay;
	
	private String pa3;
	
	private String syuser;
	
	private int sybdb;
	
	public String execute(){
		UserService userSercice = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(status==1){
			userSercice.trasferBdb(super.getUserName(), syuser, jzpay,pa3);
			return "bdbdate";
		}else{
			Gcuser gcuser = userSercice.getUserByUserName(super.getUserName());
			sybdb = gcuser.getSybdb();
			if(gcuser.getVip()==0){
				super.setErroCodeNum(1);
				return SUCCESS;
			}
		}
		return SUCCESS;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getJzpay() {
		return jzpay;
	}

	public void setJzpay(int jzpay) {
		this.jzpay = jzpay;
	}

	public String getPa3() {
		return pa3;
	}

	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}

	public String getSyuser() {
		return syuser;
	}

	public void setSyuser(String syuser) {
		this.syuser = syuser;
	}

	public int getSybdb() {
		return sybdb;
	}

	public void setSybdb(int sybdb) {
		this.sybdb = sybdb;
	}
}
