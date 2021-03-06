package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class VipjzpayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Gcuser gcuser;
	
	private int status;
	
	private String jzuser;//接收用户名
	
	private int jzpay;//转入金额
	
	private String pa3;//二级密码
	
	private String dlpa;//独立密码
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		if(status==1){
			userService.trasferYbToOtherPersion(super.getUserName(), jzuser,pa3,jzpay);
			super.setErroCodeNum(2000);
		}
		
		return SUCCESS;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getJzuser() {
		return jzuser;
	}
	public void setJzuser(String jzuser) {
		this.jzuser = jzuser;
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
	public String getDlpa() {
		return dlpa;
	}
	public void setDlpa(String dlpa) {
		this.dlpa = dlpa;
	}
}
