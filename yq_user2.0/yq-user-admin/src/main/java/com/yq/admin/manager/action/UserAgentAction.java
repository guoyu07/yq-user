package com.yq.admin.manager.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.URLDecoderUtil;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.admin.manage.action.BaseManageAction;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.bean.Role;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Sgxt;
import com.yq.user.service.UserService;

public class UserAgentAction extends BaseManageAction<Gcuser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private String user;
	
	private Fcxt fcxt;
	
	private Sgxt sgxt;
	
	private int state;
	
	//等到当前用户最高角色
	private Role role;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		role = this.getCurrentHighestRole();
		if(status==0){
			return INPUT;
		}
		sgxt = userService.getSgxt(user);
		super.initPage(adminService.searchUser(user,super.getToPage(),300));
		return SUCCESS;
	}
	private String resionMassage;
	public String useragent(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(adminService.userAgent(user,state)){
			if(state==1){
				AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.USER_AGENT, "封号账户:"+user+",备注:"+URLDecoderUtil.decode(resionMassage,"utf-8"));
				adminService.addAdminOperateLog(log);
			}
			if(state==0){
				AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.USER_AGENTCANCEL, "解封账户:"+user+",备注:"+URLDecoderUtil.decode(resionMassage,"utf-8"));
				adminService.addAdminOperateLog(log);
			}
		}
		super.initPage(adminService.getSameUserList(user,super.getToPage(),300));
		return SUCCESS;
	}

	
	public String getResionMassage() {
		return resionMassage;
	}


	public void setResionMassage(String resionMassage) {
		this.resionMassage = resionMassage;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
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
