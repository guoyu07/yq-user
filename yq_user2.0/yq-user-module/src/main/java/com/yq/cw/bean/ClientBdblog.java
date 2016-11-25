package com.yq.cw.bean;

import java.util.Date;

import com.yq.user.bo.SysBiLog;

public class ClientBdblog extends SysBiLog{
	
	
	private String username; 				// 充值用户
	
	private String operator; 				
	
	private double injine;
	
	private double outjine;

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

	public double getInjine() {
		return injine;
	}

	public void setInjine(double injine) {
		this.injine = injine;
	}

	public double getOutjine() {
		return outjine;
	}

	public void setOutjine(double outjine) {
		this.outjine = outjine;
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
	
}
