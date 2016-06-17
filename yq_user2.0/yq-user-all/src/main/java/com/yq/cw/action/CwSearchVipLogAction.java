package com.yq.cw.action;

import java.util.Date;
import java.util.List;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.cw.bean.VipCjbLogBean;
import com.yq.cw.bean.VipSearchLogBean;
import com.yq.cw.service.CwService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class CwSearchVipLogAction extends ALDAdminActionSupport {

	private static final long serialVersionUID = 1L;

	private String startTime;
	private List<String> vipList;
	private String searchUserName;
	private int status;
	
	private String preDate;
	private String nextDate;
	
	private Gcuser gcuser;
	
	private VipSearchLogBean bean;
	
	public String execute() {
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		vipList = cwService.getMyDownVip(super.getUserName());
		if (status == 1) {
			if(Strings.isNullOrEmpty(startTime)){
				startTime = DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD);
			}
			UserService userService = ServiceCacheFactory.getService(UserService.class);
		    gcuser = userService.getUserByUserName(searchUserName);
			Date start = DateUtils.StringToDate(startTime,DateStyle.YYYY_MM_DD);
			Date preDate_ = DateUtils.addDay(start, -1);
			Date nextDate_ = DateUtils.addDay(start, 1);
			preDate = DateUtils.DateToString(preDate_, DateStyle.YYYY_MM_DD);
			nextDate =  DateUtils.DateToString(nextDate_, DateStyle.YYYY_MM_DD);
			CwService cwServuce = ServiceCacheFactory.getService(CwService.class);
			bean = cwServuce.getVipSearchBean(searchUserName, startTime);
		}
		return SUCCESS;
	}
	
	private VipCjbLogBean cjbBean;
	public String vipcjbLog(){
		CwService cwService = ServiceCacheFactory.getService(CwService.class);
		vipList = cwService.getMyDownVip(super.getUserName());
		if (status == 1) {
			if(Strings.isNullOrEmpty(startTime)){
				startTime = DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD);
			}
			UserService userService = ServiceCacheFactory.getService(UserService.class);
		    gcuser = userService.getUserByUserName(searchUserName);
			Date start = DateUtils.StringToDate(startTime,DateStyle.YYYY_MM_DD);
			Date preDate_ = DateUtils.addDay(start, -1);
			Date nextDate_ = DateUtils.addDay(start, 1);
			preDate = DateUtils.DateToString(preDate_, DateStyle.YYYY_MM_DD);
			nextDate =  DateUtils.DateToString(nextDate_, DateStyle.YYYY_MM_DD);
			CwService cwServuce = ServiceCacheFactory.getService(CwService.class);
			cjbBean = cwServuce.getVipCjbBean(searchUserName, startTime);
		}
		
		return SUCCESS;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
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
	public VipSearchLogBean getBean() {
		return bean;
	}
	public void setBean(VipSearchLogBean bean) {
		this.bean = bean;
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
	public VipCjbLogBean getCjbBean() {
		return cjbBean;
	}
	public void setCjbBean(VipCjbLogBean cjbBean) {
		this.cjbBean = cjbBean;
	}
}
