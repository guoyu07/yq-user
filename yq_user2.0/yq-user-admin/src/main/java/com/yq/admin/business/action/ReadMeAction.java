package com.yq.admin.business.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.business.bean.YbDetail;
import com.yq.business.service.BusinessService;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;

public class ReadMeAction extends ALDAdminPageActionSupport<Datepay>{

	private static final long serialVersionUID = 1L;

	private String startDate1;
	private String endDate1;
	
	public String execute(){
		BusinessService businessService = ServiceCacheFactory.getService(BusinessService.class);
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		super.initPage(businessService.getYbDetail(super.getUserName(), 27,super.getToPage(), queryStartDate, queryEndDatet));
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
		String descDirectoryPath = null;
		if(super.getUserName()!=null){
			descDirectoryPath=path + "/temp/"+super.getUserName()+"-一币明细.xls";
		}else{
			descDirectoryPath=path + "/temp/"+startDate1+"~"+endDate1+"-一币明细.xls";
		}
		String[] headers ={ "商户", "成交时间","收入", "支出", "剩余","备注"};
		
		List<YbDetail> data = ServiceCacheFactory.getService(BusinessService.class).getYbList(super.getUserName(),queryStartDate, queryEndDatet);
		writeExcel(descDirectoryPath.toString(), "商户"+super.getUserName()+"的一币明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath.toString(), response);
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
