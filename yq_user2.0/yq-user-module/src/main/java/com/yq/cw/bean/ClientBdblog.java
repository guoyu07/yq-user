package com.yq.cw.bean;

import java.util.Date;

import com.yq.user.bo.SysBiLog;

public class ClientBdblog extends SysBiLog{
	
	
	private String username; 				// 充值用户
	
	private String operator; 				
	
	private double in;
	
	private double out;

	private double servicefee;
	
	private double servicefeejine;
	
	private int currentamount;				//用户当前的数量
	
	private Date rechargedate;				//重置时间
	
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	
	public double getServicefee() {
		return servicefee;
	}

	public void setServicefee(double servicefee) {
		this.servicefee = servicefee;
	}

	public double getServicefeejine() {
		return servicefeejine;
	}

	public void setServicefeejine(double servicefeejine) {
		this.servicefeejine = servicefeejine;
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

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public double getIn() {
		return in;
	}

	public void setIn(double in) {
		this.in = in;
	}

	public double getOut() {
		return out;
	}

	public void setOut(double out) {
		this.out = out;
	}
	
	
	
}
