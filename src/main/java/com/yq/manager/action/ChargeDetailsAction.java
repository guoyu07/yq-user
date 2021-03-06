package com.yq.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datecj;
import com.yq.user.service.LogService;

public class ChargeDetailsAction extends ALDAdminPageActionSupport<Datecj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String startDate1;
	private String endDate1;
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getAllDateCjPageList(startDate1,endDate1,super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public String outDateCjExcel(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);

		 
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/充值明细.xls";
		
		String s = startDate1==null?"":startDate1;
		String e = endDate1==null?"":endDate1;
		
		String[] headers = { "id", "用户名", "最近", "累计", "充值方式","ifcl","gc","cjdate", "充值时间", "操作员","原购买者","ip"};
		List<Datecj> data = logService.getDateCjList(startDate1, endDate1);
		writeExcel(descDirectoryPath, s+"="+e+"充值明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath, response);
		return null;
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
