package com.yq.cw.bean;

import java.util.Date;

public class BDBExcelData {

	
	private String operator;				//充值用户
	
	private double jine;
	
	private int currentamount;				//用户当前的数量
	
	private Date rechargedate;				//重置时间
	
	private String username; 				// 被充值用户

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getRechargedate() {
		return rechargedate;
	}

	public void setRechargedate(Date rechargedate) {
		this.rechargedate = rechargedate;
	}

	public int getCurrentamount() {
		return currentamount;
	}

	public void setCurrentamount(int currentamount) {
		this.currentamount = currentamount;
	}

	public double getJine() {
		return jine;
	}

	public void setJine(double jine) {
		this.jine = jine;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	
}
