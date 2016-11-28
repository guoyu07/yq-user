package com.yq.admin.cw.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.cw.bean.ClientBdblog;
import com.yq.cw.bean.SearchDayOfYb;
import com.yq.cw.bean.VipSearchLogBean;
import com.yq.cw.service.CwService;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.SysBiLog;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class CWBdblogAction extends ALDAdminPageActionSupport<SysBiLog> {

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
	
	private List<ClientBdblog> clientBdbList;
	
	public String execute(){
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		vipList = cwService.getMyDownVip(super.getUserName());
		/*LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		logService.getClientBdblogList(searchUserName,startTime,endTime);*/
		return SUCCESS;
	}
	
	public String searchbdblog(){
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		vipList = cwService.getMyDownVip(super.getUserName());
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		if(status==1){
			UserService userService = ServiceCacheFactory.getService(UserService.class);
		    gcuser = userService.getUserByUserName(searchUserName);
			clientBdbList = logService.getClientBdblogList(searchUserName,startTime,endTime);
		}
		return SUCCESS;
	}
	
	public String bdboutExcel(){
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
			descDirectoryPath=path + "/temp/"+searchUserName+"-bdb.xls";
		}else{
			descDirectoryPath=path + "/temp/"+startTime+"~"+endTime+"-bdb.xls";
		}
		String[] headers ={ "充值用户", "被充值的用户", "收入", "支出","服务费","服务费金额", "用户当前数量", "充值时间"};
		List<ClientBdblog> data = ServiceCacheFactory.getServiceCache().getService(LogService.class).getClientBdblogList(searchUserName,queryStartDate,queryEndDatet);
		writeExcel(descDirectoryPath.toString(), "用户"+searchUserName+"保单币充值明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath.toString(), response);
		return null;
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

	public SearchDayOfYb getDayofyb() {
		return dayofyb;
	}

	public void setDayofyb(SearchDayOfYb dayofyb) {
		this.dayofyb = dayofyb;
	}

	public List<ClientBdblog> getClientBdbList() {
		return clientBdbList;
	}

	public void setClientBdbList(List<ClientBdblog> clientBdbList) {
		this.clientBdbList = clientBdbList;
	}


	
	
}
