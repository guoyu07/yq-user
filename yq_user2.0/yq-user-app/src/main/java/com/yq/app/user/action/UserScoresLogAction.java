package com.yq.app.user.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.UserScoresLogForExcel;
import com.yq.user.service.UserService;

public class UserScoresLogAction extends ALDAdminPageActionSupport<UserScoresLogForExcel> {

	private static final long serialVersionUID = 1L;
	private String startDate1;
	private String endDate1;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		super.initPage(userService.getUserScoresLogPage(super.getUserName(), super.getToPage(), 17,startDate1,endDate1));
		return SUCCESS;
	}
	
	public String outExcel(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		HttpServletResponse response = ServletActionContext.getResponse();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/购物卷明细"+super.getUserName()+".xls";
		String s = startDate1==null?"":startDate1;
		String e = endDate1==null?"":endDate1;
		String[] headers = { "id", "用户名", "来源用户", "改变数量", "当前数量","改变类型","改变","税率(暂无用)","参数", "时间"};
		List<UserScoresLogForExcel> data = userService.getUserScoresLogList(super.getUserName(), startDate1, endDate1);
		writeExcel(descDirectoryPath, s+"="+e+"购物卷明细", headers, data, "yyyy-MM-dd hh:mm:ss");
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
