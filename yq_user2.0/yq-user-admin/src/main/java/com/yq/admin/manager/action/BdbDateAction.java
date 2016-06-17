package com.yq.admin.manager.action;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Bdbdate;

public class BdbDateAction extends ALDAdminPageActionSupport<Bdbdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getBdbdatePageList(super.getToPage(), 30));
		return SUCCESS;
	}

	private String zuser;
	private String startDate1;
	private String endDate1;
	public String bdbdateByDateAndUserName(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getBdbdatePageListByUserNameAndDate(zuser, queryStartDate, queryEndDatet, super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public String outExcel(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+zuser+"-bdb.xls";
		
		String[] headers =
		{ "id", "会员名", "报单币收入", "报单币支出", "剩余报单币","累积","左总计", "右总计", "左结余", "右结余", "更新时间","备注" };
		List<Bdbdate> data = ServiceCacheFactory.getService(AdminService.class).getBdbdateListByUserNameAndDate(zuser, queryStartDate, queryEndDatet);
		
		writeExcel(descDirectoryPath, "用户"+zuser+"的报单币明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		
		download(descDirectoryPath, response);
		return null;
	}
	

	public String getZuser() {
		return zuser;
	}
	public void setZuser(String zuser) {
		this.zuser = zuser;
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
	
}
