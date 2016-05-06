package com.yq.user.bo;

import java.util.Date;

public class GpjyIndexMc{
	private int id;
	private double pay;
	private double mcsl;
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
	public double getMcsl() {
		return mcsl;
	}
	public void setMcsl(double mcsl) {
		this.mcsl = mcsl;
	}
	public Date getCreatedTime() {
		return CreatedTime;
	}
	public void setCreatedTime(Date createdTime) {
		CreatedTime = createdTime;
	}
}

