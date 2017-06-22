package com.yq.vip.bean;

import java.util.Date;
   /**
    * tduser 实体类
    */ 


public class Tduser{
	private Integer id;
	private String gainame;
	private String tdname;
	private String gaiuserid;
	private String tduserid;
	private String tduser;
	private String tdcall;
	private String tdqq;
	private int gai;
	private Date tddate = new Date();
	public void setId(Integer id){
	this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setTdname(String tdname){
	this.tdname=tdname;
	}
	public String getTdname(){
		return tdname;
	}
	public void setTduserid(String tduserid){
	this.tduserid=tduserid;
	}
	public String getTduserid(){
		return tduserid;
	}
	public void setTduser(String tduser){
	this.tduser=tduser;
	}
	public String getTduser(){
		return tduser;
	}
	public void setTdcall(String tdcall){
	this.tdcall=tdcall;
	}
	public String getTdcall(){
		return tdcall;
	}
	public void setTdqq(String tdqq){
	this.tdqq=tdqq;
	}
	public String getTdqq(){
		return tdqq;
	}
	public void setTddate(Date tddate){
	this.tddate=tddate;
	}
	public Date getTddate(){
		return tddate;
	}
	public String getGainame() {
		return gainame;
	}
	public void setGainame(String gainame) {
		this.gainame = gainame;
	}
	public String getGaiuserid() {
		return gaiuserid;
	}
	public void setGaiuserid(String gaiuserid) {
		this.gaiuserid = gaiuserid;
	}
	public int getGai() {
		return gai;
	}
	public void setGai(int gai) {
		this.gai = gai;
	}
}

