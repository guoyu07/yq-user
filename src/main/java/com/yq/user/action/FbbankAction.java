package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Txpay;
import com.yq.user.service.UserService;

public class FbbankAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int fb;
	private Txpay txpay;
	private Gcuser gcuser;
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		txpay = userService.getTxpayById(fb);
		gcuser = userService.getUserByUserName(txpay.getPayusername());
		return SUCCESS;
	}
	public int getFb() {
		return fb;
	}
	public void setFb(int fb) {
		this.fb = fb;
	}
	public Txpay getTxpay() {
		return txpay;
	}
	public void setTxpay(Txpay txpay) {
		this.txpay = txpay;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
}
