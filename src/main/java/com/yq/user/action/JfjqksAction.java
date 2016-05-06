package com.yq.user.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.ProblemCode;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.DateUtils;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.Jfkjdate;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class JfjqksAction extends ALDAdminPageActionSupport<Gpjy> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private int status;
	
	private int jyg;
	private int year;
	private int month;
	private int day;
	private int hours;
	private int minutes;
	//下注一币数量
	private int tzsl;
	//选择的项目  1.
	private int tzlb;
	
	private Jfkjdate jfkjdate;
	
	@ProblemCode //没有看懂竞猜的时间规则
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
    	if(status==0){
    		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
    		jyg = gcuser.getJyg();
    		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class); 
    		jfkjdate = managerService.getJfkjdate();
    		
    		super.initPage(userService.getGpjyPage(super.getUserName(), super.getToPage(), 15));
    		
    		Date now = new Date();
    		year = DateUtils.getYear(now);
    		month = DateUtils.getMonth(now)+1;
    		day = DateUtils.getDay(now);
    		hours = DateUtils.getHour(now);
    		minutes = DateUtils.getMinute(now);
    	}else{
    		userService.guessJf(super.getUserName(), tzlb, tzsl);
    		super.setErroCodeNum(2000);//成功提示
    	}
		return SUCCESS;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getJyg() {
		return jyg;
	}

	public void setJyg(int jyg) {
		this.jyg = jyg;
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

	public Jfkjdate getJfkjdate() {
		return jfkjdate;
	}

	public void setJfkjdate(Jfkjdate jfkjdate) {
		this.jfkjdate = jfkjdate;
	}
}
