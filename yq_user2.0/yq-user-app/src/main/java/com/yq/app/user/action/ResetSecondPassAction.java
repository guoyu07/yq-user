package com.yq.app.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.InterRegionCode;
import com.yq.user.service.UserService;

public class ResetSecondPassAction extends ALDAdminActionSupport {
	private static final long serialVersionUID = 1L;

	
 	private int status;
 	
 	private Gcuser gcuser;
	private String userName;
	private String newSecondPassword1;
	private String newSecondPassword2;
	
	private String smsCode;
 	private String call;
 	
 	private InterRegionCode interRegionCode;
 	
 	private int areaCode;
 
	public String execute() {
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		if(status==0){
			gcuser = userService.getUserByUserName(userName);
			
			if(!Strings.isNullOrEmpty(gcuser.getCall())){
				int callLenght = gcuser.getCall().length();
				String callLeft = gcuser.getCall().substring(0, 3);
				String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
				gcuser.setCall(callLeft+"*****"+CallRight);
			}
		    if(!Strings.isNullOrEmpty(gcuser.getUserid())){
		    	int idCardLenght = gcuser.getUserid().length();
				String idCardLeft = gcuser.getUserid().substring(0, 4);
				String idCardRight = gcuser.getUserid().substring(idCardLenght-4, idCardLenght);
				gcuser.setUserid(idCardLeft+"**********"+idCardRight);
		    }
			
			return INPUT;
		}else{
            Gcuser guser = userService.getUserByUserName(userName);
			
			if(guser==null){
				super.setErroCodeNum(1);//用户不存在
				return SUCCESS;
			}
			
			if(!Strings.isNullOrEmpty(smsCode)){
				if(!smsCode.equals(guser.getVipsq())){
					super.setErroCodeNum(2);//alert('您填入的手机验证码不正确！');
					return SUCCESS;
				}
			}
			
			if(Strings.isNullOrEmpty(newSecondPassword1)||Strings.isNullOrEmpty(newSecondPassword1)||!newSecondPassword1.equals(newSecondPassword2)){
				super.setErroCodeNum(3);//alert('您填入的二级密码不正确！');
				return SUCCESS;
			}
			
			if(!Strings.isNullOrEmpty(newSecondPassword1)&&!Strings.isNullOrEmpty(newSecondPassword2)&&newSecondPassword1.equals(newSecondPassword2)){
				//开始更新资料操作
				userService.reSetSecondPassBySameUser(guser,newSecondPassword2);//updateUser(userName, guser.getName(), idCard, MD5Security.md5_16(newPassWord1), card, bank, provinceName, cityName, areaName, ServletActionContext.getRequest().getRemoteAddr(), areaCode);
				return SUCCESS;
			}else{
				super.setErroCodeNum(3000);//有信息为空
				return SUCCESS;
			}
		}
		
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNewSecondPassword1() {
		return newSecondPassword1;
	}

	public void setNewSecondPassword1(String newSecondPassword1) {
		this.newSecondPassword1 = newSecondPassword1;
	}

	public String getNewSecondPassword2() {
		return newSecondPassword2;
	}

	public void setNewSecondPassword2(String newSecondPassword2) {
		this.newSecondPassword2 = newSecondPassword2;
	}

	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public InterRegionCode getInterRegionCode() {
		return interRegionCode;
	}

	public void setInterRegionCode(InterRegionCode interRegionCode) {
		this.interRegionCode = interRegionCode;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	
	
	
}
