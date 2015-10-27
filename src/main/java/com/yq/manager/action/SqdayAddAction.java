package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.cservice.bean.SqDayAddBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;

public class SqdayAddAction extends ALDAdminPageActionSupport<Gcuser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private SqDayAddBean bean;
	
	private Integer day;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getSqDayAddUsers( super.getToPage(), 50, day));
		bean = adminService.getSqDayAddBean();
		return SUCCESS;
	}
	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public SqDayAddBean getBean() {
		return bean;
	}
	public void setBean(SqDayAddBean bean) {
		this.bean = bean;
	}
}
