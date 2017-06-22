package com.yq.app.vip.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class VipLogin extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String vipName;
	private String vipPassword;
	private String smsCode;


	public String execute() {
		UserService aus = ServiceCacheFactory.getServiceCache()
				.getService(UserService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		
		Gcuser au = aus.viplogin(sessionhttp.getId(), vipName, vipPassword,ServletActionContext.getRequest().getRemoteAddr());
		if (au == null) {
			super.setErroCodeNum(2003);
			super.setErroDescrip("登录失败，用户名或密码错误");
			return SUCCESS;
		} else {
			if(au.getUserAgent()!=0){
				super.setErroCodeNum(99999);
				super.setErroDescrip("您的号被封啦，请联系管理员！");
				return SUCCESS;
			}
			if(!Strings.isNullOrEmpty(smsCode)){
				if(!smsCode.equals(au.getVipsq())){
					super.setErroCodeNum(2004);
					super.setErroDescrip("短信验证码不正确！");
					return SUCCESS;
				}
			}else{
				super.setErroCodeNum(2004);
				super.setErroDescrip("短信验证码不正确！");
				return SUCCESS;
			}
			if(au.getGanew()!=0){
				super.setErroCodeNum(4);//重定向去修改用户信息
				return SUCCESS;
			}
			//扫描重置vip名称
			try {
				aus.resetVip(au.getUsername());
			} catch (Exception e) {
				LogSystem.error(e, "重置vip名称出错!~~~");
			}
			super.setErroCodeNum(2000);
			super.setErroDescrip("登录成功！");
			return SUCCESS;
		}
	}

	public String getErroDescrip() {
		return super.getErroDescrip();
	}
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	public String getVipName() {
		return vipName;
	}


	public void setVipName(String vipName) {
		this.vipName = vipName;
	}



	public String getVipPassword() {
		return vipPassword;
	}



	public void setVipPassword(String vipPassword) {
		this.vipPassword = vipPassword;
	}



	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}


}
