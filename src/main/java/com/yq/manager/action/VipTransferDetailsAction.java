package com.yq.manager.action;


import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.bean.YbCjbBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Vipxtgc;

public class VipTransferDetailsAction extends ALDAdminPageActionSupport<Vipxtgc> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String vipName;
	private String startDate;
	private String endDate;
	private List<String> listVipName;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getVipxtgcPageList(vipName, startDate, endDate, super.getToPage(), 30));
		listVipName = adminService.getAllVipName();
		return SUCCESS;
	}
	
	
	private YbCjbBean bean;
	public String stat(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		bean = adminService.getStatBean(vipName, null, null);
		return SUCCESS;
	}
	
	
	public String getVipName() {
		return vipName;
	}

	public void setVipName(String vipName) {
		this.vipName = vipName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<String> getListVipName() {
		return listVipName;
	}

	public void setListVipName(List<String> listVipName) {
		this.listVipName = listVipName;
	}

	public YbCjbBean getBean() {
		return bean;
	}
	public void setBean(YbCjbBean bean) {
		this.bean = bean;
	}
}
