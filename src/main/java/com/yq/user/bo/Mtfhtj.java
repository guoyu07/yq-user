package com.yq.user.bo;

import java.util.Date;
   /**
    * mtfhtj 实体类
    */ 


public class Mtfhtj{
	private Integer tjid;
	private Date fhdate;
	private int newd;
	private double zfh;
	private double mqfh;
	private double tjzj;
	public Integer getTjid() {
		return tjid;
	}
	public void setTjid(Integer tjid) {
		this.tjid = tjid;
	}
	public void setFhdate(Date fhdate){
	this.fhdate=fhdate;
	}
	public Date getFhdate(){
		return fhdate;
	}
	public void setNewd(int newd){
	this.newd=newd;
	}
	public int getNewd(){
		return newd;
	}
	public void setZfh(double zfh){
	this.zfh=zfh;
	}
	public double getZfh(){
		return zfh;
	}
	public void setMqfh(double mqfh){
	this.mqfh=mqfh;
	}
	public double getMqfh(){
		return mqfh;
	}
	public void setTjzj(double tjzj){
	this.tjzj=tjzj;
	}
	public double getTjzj(){
		return tjzj;
	}
}

