package com.yq.app.user.action;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.MD5Security;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

/**
 * @author 作者: HuHua
 * @version 2016年8月10日
 * 类说明   密码重置action
 */
public class RetsetPasswodAction extends ALDAdminActionSupport {

	private static final long serialVersionUID = 1L;
	
	
	private Gcuser user;
	
	private int status;//状态 0表示忘记密码界面，7表示重置密码界面操作
	
	private String call;
	
	private String userName;
	
	private String smsCode;//验证码
	
	private String newPassWord1;//登录新的密码
	
	private String toUserName;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(userName);
		if(gcuser!=null){
			user = gcuser;
			call = gcuser.getCall();
			return "input01";
		}else if(status==7){//表示重置密码操作
			Gcuser guser = userService.getUserByUserName(toUserName);
			if(guser==null){
				super.setErroCodeNum(1);//用户不存在
				return SUCCESS;
			}
			if(!smsCode.equals(guser.getVipsq())){//验证码有误
				super.setErroCodeNum(2);
				return SUCCESS;
			}
			if(!Strings.isNullOrEmpty(newPassWord1)){
				//开始重置密码操作
				userService.resetUserPass(toUserName,toUserName, MD5Security.md5_16(newPassWord1),guser.getUserid(),ServletActionContext.getRequest().getRemoteAddr());
				return SUCCESS;
			}else{
				super.setErroCodeNum(3000);
				return SUCCESS;
			}
		}else{	
			return SUCCESS;
		}
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}

	public Gcuser getUser() {
		return user;
	}

	public void setUser(Gcuser user) {
		this.user = user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}




	public String getSmsCode() {
		return smsCode;
	}




	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}




	public String getNewPassWord1() {
		return newPassWord1;
	}




	public void setNewPassWord1(String newPassWord1) {
		this.newPassWord1 = newPassWord1;
	}
	
}
