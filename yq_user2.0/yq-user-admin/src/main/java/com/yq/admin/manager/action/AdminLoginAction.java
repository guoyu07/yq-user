package com.yq.admin.manager.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class AdminLoginAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String adminusername;
	private String password;
	private String ValidCode;
	private int status;
	public String execute(){
		if(status==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
		HttpSession sessionhttp = ServletActionContext.getRequest()
				.getSession();
		String rand = (String) sessionhttp.getAttribute("rand");
		if (rand == null) {
			super.setErroCodeNum(1);
			super.setErroDescrip("验证码过期！");
			return SUCCESS;
		}
		if (!rand.equals(ValidCode)) {
			super.setErroCodeNum(2);
			super.setErroDescrip("验证码不正确！");
			return SUCCESS;
		}
		if(adminService.adminLogin(adminusername, password, sessionhttp.getId())){
			return "redirect";
		}else{
			super.setErroCodeNum(3);
			super.setErroDescrip("用户名或密码错误！");
			return SUCCESS;
		}
		
	}
	public String getAdminusername() {
		return adminusername;
	}
	public void setAdminusername(String adminusername) {
		this.adminusername = adminusername;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getValidCode() {
		return ValidCode;
	}
	public void setValidCode(String validCode) {
		ValidCode = validCode;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
