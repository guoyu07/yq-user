package com.yq.manager.bean;

import java.util.Date;

public class UserStatBean {
	
    //当前时间
	private String userName;
	//姓名
	private String name;
	//报单时间
	private Date activiTime;
	//报单数量
	private int sjb;
	//充值数量
	private int chargeNum;
	//当前积分
	private int jf;
	//当前一币
	private int yb;
	//买进一币数量=只统计在市场上收购或由上面VIP转过来的
	private double in;
	//卖出一币数量=除了转出到同名的，其它的都统计
	private double out;
	//小结
	private double xj;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getActiviTime() {
		return activiTime;
	}
	public void setActiviTime(Date activiTime) {
		this.activiTime = activiTime;
	}
	public int getSjb() {
		return sjb;
	}
	public void setSjb(int sjb) {
		this.sjb = sjb;
	}
	public int getChargeNum() {
		return chargeNum;
	}
	public void setChargeNum(int chargeNum) {
		this.chargeNum = chargeNum;
	}
	public int getJf() {
		return jf;
	}
	public void setJf(int jf) {
		this.jf = jf;
	}
	public int getYb() {
		return yb;
	}
	public void setYb(int yb) {
		this.yb = yb;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public double getXj() {
		xj=in-out-yb;
		return xj;
	}
	public void setXj(double xj) {
		this.xj = xj;
	}
	/**
	 * @param userName
	 * @param name
	 * @param activiTime
	 * @param sjb
	 * @param chargeNum
	 * @param jf
	 * @param yb
	 */
	public UserStatBean(String userName, String name, Date activiTime, int sjb, int chargeNum, int jf, int yb) {
		super();
		this.userName = userName;
		this.name = name;
		this.activiTime = activiTime;
		this.sjb = sjb;
		this.chargeNum = chargeNum;
		this.jf = jf;
		this.yb = yb;
	}
	/**
	 * 
	 */
	public UserStatBean() {
		super();
	}
}
