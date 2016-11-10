package com.yq.admin.manager.action;


import java.util.Date;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.DateUtils;
import com.yq.manager.bo.BackCountBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Mtfhtj;

public class BackCountAction extends ALDAdminPageActionSupport<Mtfhtj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private boolean count;
	
	private BackCountBean backCountBean;
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		
//		count = adminService.isCanBackCount();
		count = true;
		backCountBean = adminService.getBackCountBean();
		
		super.initPage(adminService.getMtfhtjPageList(super.getToPage(), 30));
		
		return SUCCESS;
	}
	
	private String date;
	public String backCount(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(Strings.isNullOrEmpty(date)){
			return SUCCESS;
		}
		Date dateDay = DateUtils.StringToDate(date,"yyyy-MM-dd");
		adminService.backCount(dateDay);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}

	public boolean getCount() {
		return count;
	}

	public void setCount(boolean count) {
		this.count = count;
	}

	public BackCountBean getBackCountBean() {
		return backCountBean;
	}

	public void setBackCountBean(BackCountBean backCountBean) {
		this.backCountBean = backCountBean;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
