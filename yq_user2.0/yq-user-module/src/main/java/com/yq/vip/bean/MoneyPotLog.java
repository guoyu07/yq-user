package com.yq.vip.bean;

import java.util.Date;

public class MoneyPotLog {
	
	private int id;
	
	private String moneypotorderid;
	
	private String username;
	
	private String name;
	
	private String userId;
	
	private double moneyCount;
	
	private int state;
	
	private Date createTime;
	
	private Date updateTime;
	
	private String dusername;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public double getMoneyCount() {
		return moneyCount;
	}

	public void setMoneyCount(double moneyCount) {
		this.moneyCount = moneyCount;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMoneypotorderid() {
		return moneypotorderid;
	}

	public void setMoneypotorderid(String moneypotorderid) {
		this.moneypotorderid = moneypotorderid;
	}

	public String getDusername() {
		return dusername;
	}

	public void setDusername(String dusername) {
		this.dusername = dusername;
	}

	public MoneyPotLog(){
		
	}
	
	
	public MoneyPotLog(String moneypotorderid,String username, String name, String userId, double moneyCount, int state, Date createTime,
			Date updateTime, String dusername) {
		super();
		this.moneypotorderid = moneypotorderid;
		this.username = username;
		this.name = name;
		this.userId = userId;
		this.moneyCount = moneyCount;
		this.state = state;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.dusername = dusername;
	}
	
	
	

}
