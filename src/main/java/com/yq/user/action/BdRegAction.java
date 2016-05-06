package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;

public class BdRegAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String up;
	
	private String bduser;
	
	private int cjpay;
	
	private String pa1j;
	
	private String pa2j;
	
	private String call;
	//短信校验码
	private String ceid;
	
	private int status;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		long startTime = System.currentTimeMillis();
    	LogSystem.info("action中开始"+super.getUserName()+"--开始执行开户操作，节点"+up+",绑定用户--》"+bduser+",开户金额"+cjpay);
		call = userService.bdReg(super.getUserName(), up, bduser, cjpay, pa1j, pa2j, ceid, status);
		long end = System.currentTimeMillis();
		LogSystem.info("action中结束"+super.getUserName()+"--开始执行开户操作，节点"+up+",绑定用户--》"+bduser+",开户金额"+cjpay+",结束，耗时=["+(end-startTime)/1000+"s]");
		if(status==0){
			return SUCCESS;
		}else{
			return "sgks01";
		}
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	
	public String getUserName(){
		return super.getUserName();
	}
	public String getUp() {
		return up;
	}


	public void setUp(String up) {
		this.up = up;
	}


	public String getBduser() {
		return bduser;
	}


	public void setBduser(String bduser) {
		this.bduser = bduser;
	}


	public int getCjpay() {
		return cjpay;
	}


	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}


	public String getPa1j() {
		return pa1j;
	}


	public void setPa1j(String pa1j) {
		this.pa1j = pa1j;
	}


	public String getPa2j() {
		return pa2j;
	}


	public void setPa2j(String pa2j) {
		this.pa2j = pa2j;
	}
	public String getCall() {
		return call;
	}


	public void setCall(String call) {
		this.call = call;
	}


	public String getCeid() {
		return ceid;
	}


	public void setCeid(String ceid) {
		this.ceid = ceid;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}

}
