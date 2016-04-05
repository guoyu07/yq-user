package com.yq.cw.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.cw.bean.DatepayForDc;
import com.yq.cw.bean.VipCjglForDc;
import com.yq.cw.service.CwService;
import com.yq.manager.service.AdminService;

public class VipOutExcelAction extends ALDAdminActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<String> vipList;
	private String zuser;
	private String startDate1;
	private String endDate1;
	private int tp;
	
	public String execute(){
		if (super.getUserName().equals("cwadmin")) {
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			vipList = adminService.getAllVipName();
		} else {
			vipList = new ArrayList<String>();
			vipList.add(super.getUserName());
		}
		
		if(tp==1){
			return outExcelForDatePay();
		}
		
		if(tp==2){
			return outExcelForVipCjb();
		}
		
		return SUCCESS;
	}
	
	
	
	
	
	public String outExcelForDatePay(){
		CwService cwService = ServiceCacheFactory.getServiceCache().getService(CwService.class);

		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+zuser+"-yb-cw.xls";
		
		String[] headers = { "时间", "操作详情", "一币收入", "收入折扣", "收入发生额","一币支出","支出折扣","支出发生额", "结余"};
		List<DatepayForDc> data = cwService.getCwDatePayLisByVipUserNameAndDateForDc(zuser, queryStartDate, queryEndDatet,null);
		writeExcel(descDirectoryPath, "用户"+zuser+"的一币明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath, response);
		return null;
	}
	
	public String outExcelForVipCjb(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+zuser+"-vipcjb-cw.xls";
		String[] headers =
		{ "充值时间", "操作说明","收入", "支出", "剩余"};
		List<VipCjglForDc> data = ServiceCacheFactory.getService(CwService.class).getVipcjglListForDcAsc(zuser, queryStartDate, queryEndDatet);
		writeExcel(descDirectoryPath, "用户"+zuser+"的充值币明细", headers, data, "yyyy-MM-dd hh:mm:ss");
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





	public int getTp() {
		return tp;
	}





	public void setTp(int tp) {
		this.tp = tp;
	}





	public List<String> getVipList() {
		return vipList;
	}





	public void setVipList(List<String> vipList) {
		this.vipList = vipList;
	}
	
	
}
