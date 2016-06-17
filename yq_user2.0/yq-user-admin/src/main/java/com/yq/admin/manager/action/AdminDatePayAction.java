package com.yq.admin.manager.action;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;
import com.yq.user.service.LogService;

public class AdminDatePayAction extends ALDAdminPageActionSupport<Datepay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer beizhu;
	
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Datepay> page = logService.getAdminDatePayListPage((beizhu==null||beizhu==0)?null:beizhu, super.getToPage(), 50);
		
		super.initPage(page);
		
		return SUCCESS;
	}

	private String zuser;
	private String startDate1;
	private String endDate1;
	public String datepayByDateAndUserName(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getAdminDatePayListPageByUserNameAndDate(zuser, queryStartDate, queryEndDatet,(beizhu==null||beizhu==0)?null:beizhu, super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public String outDpExcel(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);

		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+zuser+"-yb.xls";
		
		String[] headers = { "id", "会员名", "一币收入", "一币支出", "金币收入","金币支出","zff","剩余一币", "剩余金币", "更新时间","备注","kjqi","bz","newbz","txbz","折扣"};
		List<Datepay> data = logService.getAdminDatePayLisByUserNameAndDate(zuser, queryStartDate, queryEndDatet,(beizhu==null||beizhu==0)?null:beizhu);
		writeExcel(descDirectoryPath, "用户"+zuser+"的一币和金币明细", headers, data, "yyyy-MM-dd hh:mm:ss");
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
	public Integer getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(Integer beizhu) {
		this.beizhu = beizhu;
	}
	
	
	
}
