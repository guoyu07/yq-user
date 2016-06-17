package com.yq.user.action;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UserPayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private int transferType;//1-->userpay.jsp  2-->userpay_10yh.jsp 
	
	private Gcuser gcuser;
	
	private int txpay;
	
	private String pa3;
	
	private String ybcodeid;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		if(status!=0){
			userService.saleYb(super.getUserName(), pa3, txpay, ybcodeid, ServletActionContext.getRequest().getRemoteAddr());
			super.setErroCodeNum(-1);
		}
		return SUCCESS;
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
	public int getTransferType() {
		return transferType;
	}
	public void setTransferType(int transferType) {
		this.transferType = transferType;
	}
	public int getTxpay() {
		return txpay;
	}
	public void setTxpay(int txpay) {
		this.txpay = txpay;
	}
	public String getPa3() {
		return pa3;
	}
	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}
	public String getYbcodeid() {
		return ybcodeid;
	}
	public void setYbcodeid(String ybcodeid) {
		this.ybcodeid = ybcodeid;
	}

}
