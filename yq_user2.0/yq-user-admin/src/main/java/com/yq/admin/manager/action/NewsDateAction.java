package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.bo.NewsDateBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Dateip;

public class NewsDateAction extends ALDAdminPageActionSupport<Dateip> {

	private static final long serialVersionUID = 1L;
	
	private NewsDateBean bean;
	private String zuser;
	private int status;
	
	public String execute(){
		
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(status==1){
			super.initPage(adminService.getAllDateIp(zuser,super.getToPage(), 30));
		}
		return SUCCESS;
	}
	public NewsDateBean getBean() {
		return bean;
	}

	public void setBean(NewsDateBean bean) {
		this.bean = bean;
	}
	public String getZuser() {
		return zuser;
	}
	public void setZuser(String zuser) {
		this.zuser = zuser;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
