package com.yq.user.bo;

import java.util.Date;

   /**
    * gcuser for excel 实体类
    */ 


public class GcuserForExcel{
	private Integer id;
	private String username;
	private int sjb;
	private String up;
	private Date upgmdate;
	private String name;
	private String addsheng;
	private String addshi;
	private String addqu;
	private String call;
	private String qq;
	private Date bddate;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getSjb() {
		return sjb*500;
	}
	public void setSjb(int sjb) {
		this.sjb = sjb;
	}
	public String getUp() {
		return up;
	}
	public void setUp(String up) {
		this.up = up;
	}
	public Date getUpgmdate() {
		return upgmdate;
	}
	public void setUpgmdate(Date upgmdate) {
		this.upgmdate = upgmdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddsheng() {
		return addsheng;
	}
	public void setAddsheng(String addsheng) {
		this.addsheng = addsheng;
	}
	public String getAddshi() {
		return addshi;
	}
	public void setAddshi(String addshi) {
		this.addshi = addshi;
	}
	public String getAddqu() {
		return addqu;
	}
	public void setAddqu(String addqu) {
		this.addqu = addqu;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Date getBddate() {
		return bddate;
	}
	public void setBddate(Date bddate) {
		this.bddate = bddate;
	}
}

