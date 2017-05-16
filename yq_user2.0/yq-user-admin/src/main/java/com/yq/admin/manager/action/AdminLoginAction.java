package com.yq.admin.manager.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.service.ManageService;
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
	private String smsCode;
	public String execute(){
		if(status==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
		ManageService manageService = ServiceCacheFactory.getServiceCache().getService(ManageService.class);
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
		if(!manageService.getAminSmscode(adminusername).equals(smsCode)){
			super.setErroCodeNum(407);
			super.setErroDescrip("短信验证码不正确！");
			return SUCCESS;
		}
		
		if(adminService.adminUserLoginOp(adminusername, password, sessionhttp,ServletActionContext.getRequest().getRemoteAddr())){
			manageService.invalidateSmsCode(adminusername);
			return "redirect";
		}else{
			super.setErroCodeNum(3);
			super.setErroDescrip("用户名或密码错误！");
			return SUCCESS;
		}
		
	}
	/**
	 * 重置大vip
	 * @return
	 */
	public String resetBigVipUser(){
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
//				adminService.setBigVipUser();
//			}
//		}).start();;
		return SUCCESS;
	}
	
	
	public String getSmsCode() {
		return smsCode;
	}
	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
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
