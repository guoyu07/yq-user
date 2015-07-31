package com.yq.user.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.DateUtils;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Epkjdate;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class EpjqksAction extends ALDAdminPageActionSupport<Datepay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private Epkjdate epkjdate;
	
	private int pay;
	private int year;
	private int month;
	private int day;
	private int hours;
	private int minutes;
	//下注一币数量
	private int tzsl;
	//选择的项目  1.
	private int tzlb;
	
    public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
    	if(status==0){
    		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
    		pay = gcuser.getPay();
    		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class); 
    		epkjdate = managerService.getEpkjdate();
    		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class); 
    		super.initPage(logService.getDatePayListPageBykjqi(super.getUserName(), super.getToPage(), 15));
    		
    		Date now = new Date();
    		year = DateUtils.getYear(now);
    		month = DateUtils.getMonth(now)+1;
    		day = DateUtils.getDay(now);
    		hours = DateUtils.getHour(now);
    		minutes = DateUtils.getMinute(now);
    		return INPUT;
    	}else{
    		userService.guess(super.getUserName(), tzlb, tzsl);
    		super.setErroCodeNum(20);//成功提示
    		return INPUT;
    	}
    }
    
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Epkjdate getEpkjdate() {
		return epkjdate;
	}
	public void setEpkjdate(Epkjdate epkjdate) {
		this.epkjdate = epkjdate;
	}

	public int getPay() {
		return pay;
	}
	

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public int getMinutes() {
		return minutes;
	}

	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}

	public int getTzsl() {
		return tzsl;
	}

	public void setTzsl(int tzsl) {
		this.tzsl = tzsl;
	}

	public int getTzlb() {
		return tzlb;
	}

	public void setTzlb(int tzlb) {
		this.tzlb = tzlb;
	}
}
