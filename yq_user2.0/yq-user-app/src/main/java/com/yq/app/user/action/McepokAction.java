package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.NotAllowedCode;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Txpay;
import com.yq.user.dao.TxPayDao;
import com.yq.user.service.UserService;

public class McepokAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	private int payId;
	private String password3;
	private String smsCode;
	private Gcuser gcuser;
	private Txpay txpay;
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(status==0){
			LogSystem.warn("[确认已收到款查询]"+"["+payId+"]"+super.getUserName()+"["+super.ip()+"]");
			gcuser = userService.getUserByUserName(super.getUserName());
			@NotAllowedCode
			TxPayDao txPayDao = ServiceCacheFactory.getServiceCache().getService(TxPayDao.class);
			txpay = txPayDao.getByPayid(payId);
			return INPUT;
		}
		LogSystem.warn("[确认已收到款]"+"["+payId+"]["+super.getUserName()+"]["+super.ip()+"]");
		userService.sureIReceivedMoney(super.getUserName(), payId, password3, smsCode, super.ip());
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPayId() {
		return payId;
	}
	public void setPayId(int payId) {
		this.payId = payId;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public Txpay getTxpay() {
		return txpay;
	}
	public void setTxpay(Txpay txpay) {
		this.txpay = txpay;
	}
	public String getPassword3() {
		return password3;
	}
	public void setPassword3(String password3) {
		this.password3 = password3;
	}
	public String getSmsCode() {
		return smsCode;
	}
	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
}
