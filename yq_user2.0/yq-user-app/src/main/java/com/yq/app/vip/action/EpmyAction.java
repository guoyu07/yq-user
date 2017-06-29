package com.yq.app.vip.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Txpay;
import com.yq.user.service.UserService;
import com.yq.vip.bean.VipUser;

public class EpmyAction extends ALDAdminActionSupport {

	private static final long serialVersionUID = 1L;
	
	private int ep;
	
	private VipUser gcuser;
	
	private Txpay txpay;
	
	private int status;
	
	private String epnm3; 
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getVipUserByUserName(super.getUserName());
		if(status==0){
			txpay = userService.buyYbPre(super.getUserName(), ep);
		}else{
			txpay = userService.buyYb(super.getUserName(), ep, epnm3);
			super.setErroCodeNum(2000);
		}
		return SUCCESS;
	}

	public int getEp() {
		return ep;
	}

	public void setEp(int ep) {
		this.ep = ep;
	}

	public VipUser getGcuser() {
		return gcuser;
	}

	public void setGcuser(VipUser gcuser) {
		this.gcuser = gcuser;
	}

	public Txpay getTxpay() {
		return txpay;
	}

	public void setTxpay(Txpay txpay) {
		this.txpay = txpay;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getEpnm3() {
		return epnm3;
	}

	public void setEpnm3(String epnm3) {
		this.epnm3 = epnm3;
	}
	
	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	
}
