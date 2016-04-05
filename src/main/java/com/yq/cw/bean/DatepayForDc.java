package com.yq.cw.bean;

import java.util.Date;

public class DatepayForDc {

	private Integer id;
	private String username;
	private Date abdate;
	private String regid;
	private int syjz;
	private double srZk;
	private double srRmb;
	private int jc;
	private double zcZk;
	private double zcRmb;
	private int pay;
	private double ration;
	public void setId(Integer id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getAbdate() {
		return abdate;
	}
	public void setAbdate(Date abdate) {
		this.abdate = abdate;
	}
	public String getRegid() {
		return regid;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}
	public int getSyjz() {
		return syjz;
	}
	public void setSyjz(int syjz) {
		this.syjz = syjz;
	}
	
	public double getSrZk() {
		return syjz>0?ration:0d;
	}
	
	public double getSrRmb() {
		return syjz*ration;
	}
	public int getJc() {
		return jc;
	}
	public void setJc(int jc) {
		this.jc = jc;
	}
	public double getZcZk() {
		return jc>0?ration:0d;
	}
	public double getZcRmb() {
		return jc*ration;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public void setRation(double ration) {
		this.ration = ration;
	}
}
