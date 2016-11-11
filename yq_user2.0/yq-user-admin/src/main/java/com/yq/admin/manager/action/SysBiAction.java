package com.yq.admin.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.SysBiLog;
import com.yq.user.service.LogService;

/**
 * @author 作者: HuHua
 * @version 2016年11月2日
 * 类说明 
 */
public class SysBiAction extends ALDAdminPageActionSupport<SysBiLog> {

	private static final long serialVersionUID = 1L;
	
	
	private String zuser;
	private String startDate1;
	private String endDate1;
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getSysBiLogPageList(zuser,startDate1,endDate1,super.getToPage(), 20));
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
		if(zuser!=null){
			descDirectoryPath=path + "/temp/"+zuser+"-systembi.xls";
		}else{
			descDirectoryPath=path + "/temp/"+startDate1+"~"+endDate1+"-systembi.xls";
		}
		String[] headers ={ "id", "充值用户", "充值时间", "用户当前数量", "充值金额", "操作者"};
		List<SysBiLog> data = ServiceCacheFactory.getServiceCache().getService(LogService.class).getSysBiLogList(zuser,startDate1,endDate1);
		writeExcel(descDirectoryPath.toString(), "用户"+zuser+"的系统充值明细", headers, data, "yyyy-MM-dd hh:mm:ss");
		download(descDirectoryPath.toString(), response);
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
