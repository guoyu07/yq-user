package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.admin.manage.action.BaseManageAction;
import com.yq.manage.bean.Role;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.Sgxt;
import com.yq.user.service.UserService;

public class CancelUserPointSaleAction extends BaseManageAction<Gpjy> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private String user;
	
	private Fcxt fcxt;
	
	private Sgxt sgxt;
	
	private int qxid;
	
	private String pa3;
	
	//等到当前用户最高角色
	private Role role;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		fcxt = adminService.getAdminUser(super.getUserName());
		role = this.getCurrentHighestRole();
		if(status==0){
			return INPUT;
		}
		sgxt = userService.getSgxt(user);
		super.initPage(userService.getAllGpjyDetailsPageList(user, super.getToPage(), 15));
		return SUCCESS;
	}
	
	public String canclePointSale(){
		if(status==1){
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			adminService.cancelSale(user, qxid, pa3);
			super.setErroCodeNum(2000);
		}
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		super.initPage(userService.getAllGpjyDetailsPageList(user, super.getToPage(), 15));
		return SUCCESS;
	}

	public int getQxid() {
		return qxid;
	}

	public void setQxid(int qxid) {
		this.qxid = qxid;
	}

	public String getPa3() {
		return pa3;
	}

	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Fcxt getFcxt() {
		return fcxt;
	}

	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}

	public Sgxt getSgxt() {
		return sgxt;
	}

	public void setSgxt(Sgxt sgxt) {
		this.sgxt = sgxt;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	

}
