package com.yq.vip.bean;

import java.util.Date;

public class GpjyIndexMr{
	private int id;
	private double pay;
	private double mysl;
	private Date CreatedTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
	public Date getCreatedTime() {
		return CreatedTime;
	}
	public void setCreatedTime(Date createdTime) {
		CreatedTime = createdTime;
	}
	public double getMysl() {
		return mysl;
	}
	public void setMysl(double mysl) {
		this.mysl = mysl;
	}
}

