package com.yq.admin.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.service.UserService;

public class VipcjbDetailsAction extends ALDAdminPageActionSupport<Vipcjgl> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String zuser;

	private String startDate1;
	private String endDate1;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		super.initPage(userService.getVipcjbPageList(zuser, super.getToPage(), 30, queryStartDate, queryEndDatet));
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
		String descDirectoryPath = path + "/temp/"+zuser+"-vipcjb.xls";
		String[] headers =
		{ "id", "充值用户","充值金额", "充值时间", "操作者", "剩余充值币","备注"};
		List<Vipcjgl> data = ServiceCacheFactory.getService(UserService.class).getVipcjbList(zuser, queryStartDate, queryEndDatet);
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
	
	
}
