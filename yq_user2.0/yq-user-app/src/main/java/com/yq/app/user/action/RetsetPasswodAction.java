package com.yq.app.user.action;

import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.module.web.session.Session;
import com.yq.agent.bo.AgentApp;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.MD5Security;
import com.yq.common.utils.ParamCheck;
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
	
	private String newPassWord2;//登录确认登录mim
	
	private String toUserName;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(userName);
		if(gcuser!=null){
			user = gcuser;
			int callLenght = user.getCall().length();
			String callLeft = user.getCall().substring(0, 3);
			String CallRight = user.getCall().substring(callLenght-3, callLenght);
			user.setCall(callLeft+"*****"+CallRight);
			return "input01";
		}else if(status==7){//表示重置密码操作
			//开始重置密码操作
			userService.resetUserPass(toUserName, newPassWord1, newPassWord2, smsCode,ServletActionContext.getRequest().getRemoteAddr());
			return SUCCESS;
		}else{	
			return SUCCESS;
		}
		
	}

	
	
	public String getNewPassWord2() {
		return newPassWord2;
	}



	public void setNewPassWord2(String newPassWord2) {
		this.newPassWord2 = newPassWord2;
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
