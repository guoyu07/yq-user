package com.yq.admin.manager.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manager.service.AdminService;

public class AdminOperateLogAction extends ALDAdminPageActionSupport<AdminOperateLog>{
	private static final long serialVersionUID = 1L;
	private String startDate1;
	private String endDate1;
	private String admin;
	private int beizhu;
	private String user;
	public String execute() {
		AdminService adminService = ServiceCacheFactory.getServiceCache().getService(AdminService.class);
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		super.initPage(adminService.getAdminOperateLogPageList(admin,beizhu,user,queryStartDate, queryEndDatet, super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}


	public String getStartDate1() {
		return startDate1;
	}
	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}
	public String getEndDate1() {
		return endDate1;
	}
	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public int getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(int beizhu) {
		this.beizhu = beizhu;
	}

	

}
