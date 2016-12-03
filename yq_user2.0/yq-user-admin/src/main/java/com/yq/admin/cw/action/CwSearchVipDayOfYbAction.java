package com.yq.admin.cw.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.cw.bean.DayOfYb;
import com.yq.cw.bean.SearchDayOfYb;
import com.yq.cw.bean.VipSearchBdbLogBean;
import com.yq.cw.bean.VipSearchLogBean;
import com.yq.cw.bean.VipServiceFee;
import com.yq.cw.service.CwService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class CwSearchVipDayOfYbAction extends ALDAdminPageActionSupport<SearchDayOfYb> {

	
	private static final long serialVersionUID = 1L;
	private String startTime;
	private String endTime;
	private List<String> vipList;
	private String searchUserName;
	private int status;
	
	private String preDate;
	private String nextDate;
	
	private Gcuser gcuser;
	
	private VipSearchLogBean bean;
	
	private SearchDayOfYb dayofyb;
	
	private List<VipServiceFee> vipserviceFeeList;
	
	public String dayofyb(){
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		vipList = cwService.getMyDownVip(super.getUserName());
		if (status == 1) {
			UserService userService = ServiceCacheFactory.getService(UserService.class);
		    gcuser = userService.getUserByUserName(searchUserName);
			dayofyb = cwService.getSearchDayOfYb(searchUserName,startTime,endTime);
		}
		return SUCCESS;
		
	}


	public String dayofyboutexcel(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			queryStartDate = startTime+" 00:00:00";
			queryEndDatet = endTime + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = null;
		if(searchUserName!=null){
			descDirectoryPath=path + "/temp/"+searchUserName+"-dayofyb.xls";
		}else{
			descDirectoryPath=path + "/temp/"+startTime+"~"+endTime+"-dayofyb.xls";
		}
		String[] headers ={ "时间", "摘要", "备注（参考）", "收入数量", "收入单价", "收入金额", "支出数量","支出单价", "支出金额", "结余"};
		List<DayOfYb> data = ServiceCacheFactory.getService(CwService.class).getDayOfYbList(searchUserName, queryStartDate, queryEndDatet);
		writeExcel(descDirectoryPath.toString(), "用户"+searchUserName+"的一币日记明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath.toString(), response);
		return null;
	}

	public String ybservicefee(){
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		vipList = cwService.getMyDownVip(super.getUserName());
		if (status == 1) {
			UserService userService = ServiceCacheFactory.getService(UserService.class);
		    gcuser = userService.getUserByUserName(searchUserName);
		    vipserviceFeeList = cwService.getByserviceFeeList(searchUserName,startTime,endTime);
		}
		return SUCCESS;
		
	}
	
	public String yibiservicerfeeExcel(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			queryStartDate = startTime+" 00:00:00";
			queryEndDatet = endTime + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = null;
		if(searchUserName!=null){
			descDirectoryPath=path + "/temp/"+searchUserName+"-ybservicefee.xls";
		}else{
			descDirectoryPath=path + "/temp/"+startTime+"~"+endTime+"-ybservicefee.xls";
		}
		String[] headers ={ "用户名", "时间", "操作详情", "支出", "服务费", "服务费金额"};
		List<VipServiceFee> data = ServiceCacheFactory.getService(CwService.class).getByserviceFeeList(searchUserName, queryStartDate, queryEndDatet);
		writeExcel(descDirectoryPath.toString(), "用户"+searchUserName+"的一币服务费明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath.toString(), response);
		return null;
		
	}

	public SearchDayOfYb getDayofyb() {
		return dayofyb;
	}



	public void setDayofyb(SearchDayOfYb dayofyb) {
		this.dayofyb = dayofyb;
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



	public List<String> getVipList() {
		return vipList;
	}



	public void setVipList(List<String> vipList) {
		this.vipList = vipList;
	}



	public String getSearchUserName() {
		return searchUserName;
	}



	public void setSearchUserName(String searchUserName) {
		this.searchUserName = searchUserName;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public String getPreDate() {
		return preDate;
	}



	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}



	public String getNextDate() {
		return nextDate;
	}



	public void setNextDate(String nextDate) {
		this.nextDate = nextDate;
	}



	public Gcuser getGcuser() {
		return gcuser;
	}



	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}



	public VipSearchLogBean getBean() {
		return bean;
	}



	public void setBean(VipSearchLogBean bean) {
		this.bean = bean;
	}


	public List<VipServiceFee> getVipserviceFeeList() {
		return vipserviceFeeList;
	}


	public void setVipserviceFeeList(List<VipServiceFee> vipserviceFeeList) {
		this.vipserviceFeeList = vipserviceFeeList;
	}
	
	
	
}