package com.yq.app.user.action;

import com.google.common.base.Strings;
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
	
	private Gcuser farenUser;
	
	private String smsCode;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		if(gcuser.getVip()==2){
			farenUser = userService.getUserByUserName(userService.getUserProperty(super.getUserName()).getFaren());
			if(!Strings.isNullOrEmpty(farenUser.getCall())){
				int callLenght = farenUser.getCall().length();
				String callLeft = farenUser.getCall().substring(0, 3);
				String CallRight = farenUser.getCall().substring(callLenght-3, callLenght);
				farenUser.setCall(callLeft+"*****"+CallRight);
			}
		}
		
		if(!Strings.isNullOrEmpty(gcuser.getCall())){
			int callLenght = gcuser.getCall().length();
			String callLeft = gcuser.getCall().substring(0, 3);
			String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
			gcuser.setCall(callLeft+"*****"+CallRight);
		}
		
		if(status==1){
			
			if(gcuser.getVip()==2){
				farenUser = userService.getUserByUserName(userService.getUserProperty(super.getUserName()).getFaren());
				if(farenUser!=null){
					if(!farenUser.getVipsq().equals(smsCode)){
						super.setErroCodeNum(2001);
						return SUCCESS;
					}
				}else{
					super.setErroCodeNum(2002);
					return SUCCESS;
				}
			}else{
				if(!smsCode.equals(gcuser.getVipsq())){
					super.setErroCodeNum(2001);
					return SUCCESS;
				}
			}
			userService.trasferYbToOtherPersion(super.getUserName(), jzuser,pa3,jzpay,farenUser);
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
	public Gcuser getFarenUser() {
		return farenUser;
	}
	public void setFarenUser(Gcuser farenUser) {
		this.farenUser = farenUser;
	}
	public String getSmsCode() {
		return smsCode;
	}
	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
	
	
}
