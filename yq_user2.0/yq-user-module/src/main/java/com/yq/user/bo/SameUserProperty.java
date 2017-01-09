package com.yq.user.bo;

import java.util.Date;

/**
 * @author 作者: HuHua
 * @version 2017年1月9日
 * 类说明 		同名账户扩展属性字段
 */
public class SameUserProperty {

	
	private String nameUserid;		//姓名+身份证(唯一标识)
	
	private int noSureTimes;				//没确认次数
	
	private Date lastDate;			//最后时间
	
	

	public SameUserProperty() {
		
	}
	

	public SameUserProperty(String nameUserid, int noSureTimes, Date lastDate) {
		super();
		this.nameUserid = nameUserid;
		this.noSureTimes = noSureTimes;
		this.lastDate = lastDate;
	}

	public String getNameUserid() {
		return nameUserid;
	}

	public void setNameUserid(String nameUserid) {
		this.nameUserid = nameUserid;
	}

	
	public int getNoSureTimes() {
		return noSureTimes;
	}


	public void setNoSureTimes(int noSureTimes) {
		this.noSureTimes = noSureTimes;
	}


	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	
	
	
	
	
	
}
