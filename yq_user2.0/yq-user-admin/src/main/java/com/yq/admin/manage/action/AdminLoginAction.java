package com.yq.admin.manage.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.service.ManageService;
import com.yq.manager.service.AdminService;

public class AdminLoginAction extends ALDAdminActionSupport {
	
	
	private static final long serialVersionUID = 1L;
	
	
		private String adminUserName;
		private String passWord;
		private String validCode;
		private int status;
		private String smsCode;
		
		public String execute(){
			if(status==0){
				return SUCCESS;
			}
			AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
			ManageService manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
			HttpSession sessionhttp = ServletActionContext.getRequest().getSession();
			String rand = (String) sessionhttp.getAttribute("rand");
			if(Strings.isNullOrEmpty(validCode)){
				super.setErroCodeNum(399);
				super.setErroDescrip("验证码不能为空！");
				return SUCCESS;
			}
			if(Strings.isNullOrEmpty(rand)){
				super.setErroCodeNum(400);
				super.setErroDescrip("验证码过期,请点击刷新！");
				return SUCCESS;
			}
			if(!rand.equals(validCode)){
				super.setErroCodeNum(401);
				super.setErroDescrip("验证码不正确！");
				return SUCCESS;
			}
			if(Strings.isNullOrEmpty(smsCode)){
				super.setErroCodeNum(406);
				super.setErroDescrip("短信验证码不能为空！");
				return SUCCESS;
			}
			if(!manageService.getAminSmscode(adminUserName).equals(smsCode)){
				super.setErroCodeNum(407);
				super.setErroDescrip("短信验证码不正确！");
				return SUCCESS;
			}
			
			if(adminService.adminUserLogin(adminUserName, passWord, sessionhttp, ServletActionContext.getRequest().getRemoteAddr())){
				manageService.invalidateSmsCode(adminUserName);
				return "redirect";
			}else{
				super.setErroCodeNum(402);
				super.setErroDescrip("用户名或密码错误！");
				return SUCCESS;
			}
			
		}

		
		public String getSmsCode() {
			return smsCode;
		}


		public void setSmsCode(String smsCode) {
			this.smsCode = smsCode;
		}


		public String getAdminUserName() {
			return adminUserName;
		}


		public void setAdminUserName(String adminUserName) {
			this.adminUserName = adminUserName;
		}


		public String getPassWord() {
			return passWord;
		}

		public void setPassWord(String passWord) {
			this.passWord = passWord;
		}

		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}


		public String getValidCode() {
			return validCode;
		}


		public void setValidCode(String validCode) {
			this.validCode = validCode;
		}


	

}
