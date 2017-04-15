package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.bean.Performance;
import com.yq.manager.service.AdminService;

public class AllPerformance extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Performance bean;
    private String user;
    private int max=10;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		bean = adminService.getUserAllStepPerformance(user,max);
		return SUCCESS;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}

	public Performance getBean() {
		return bean;
	}

	public void setBean(Performance bean) {
		this.bean = bean;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
}
