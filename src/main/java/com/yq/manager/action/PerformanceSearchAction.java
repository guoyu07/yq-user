package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.bean.UserPerformanceSearch;
import com.yq.manager.service.AdminService;

public class PerformanceSearchAction extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserPerformanceSearch bean;
	private String user;
	private String startTime;
	private String endTime;
	
	
	private int status;
	
	public String execute(){
		if(status==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
        bean = adminService.getUserPerformanceSearch(user, startTime, endTime);
		return SUCCESS;
	}
	
	public UserPerformanceSearch getBean() {
		return bean;
	}
	public void setBean(UserPerformanceSearch bean) {
		this.bean = bean;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
