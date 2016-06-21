package com.yq.admin.manager.action;

import java.util.Date;
import java.util.List;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.DateUtils;
import com.yq.manager.bean.UserPerformanceSearch;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.UserPerformance;

public class PerformanceSearchAction extends ALDAdminPageActionSupport<UserPerformance> {
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
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }

		if(status==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
        bean = adminService.getUserPerformanceSearch(user, startTime, endTime);
		return SUCCESS;
	}
	//2015年获奖可能获奖用户名单
	private List<UserPerformance> listTemp;
	public String list(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		listTemp = adminService .getUserPerformancePage();		
		return SUCCESS;
	}
	
	public List<UserPerformance> getListTemp() {
		return listTemp;
	}

	public void setListTemp(List<UserPerformance> listTemp) {
		this.listTemp = listTemp;
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
