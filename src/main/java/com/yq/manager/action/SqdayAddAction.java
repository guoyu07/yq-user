package com.yq.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.cservice.bean.SqDayAddBean;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.GcuserForExcel;

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
	
	public String outExcel(){
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String[] titleArray = new String[]{"前天","昨天","今天"};
		String title = day+2<titleArray.length?titleArray[day+2]:"";
		String descDirectoryPath = path + "/temp/"+title+"新开户数据.xls";
		
		String[] headers =
		{ "id", "用户名", "单数", "推荐人", "推荐人充值时间","姓名","省", "市", "区", "手机", "QQ","升级时间" };
		List<GcuserForExcel> data = ServiceCacheFactory.getService(AdminService.class).getSqdayAddUsersForExcel(day);
		
		writeExcel(descDirectoryPath, title+"新开户数据", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath, response);
		return null;
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
