package com.yq.user.bo;

import java.util.Date;
   /**
    * fhdate 实体类
    */ 


public class Fhdate{
	private int id;
	private Date abdate;
	private double zly;
	private double ly5;
	private int fhk;
	private double vipfhpay;
	private double fhpay;
	private double tjjt;
	private double tjmq;
	private int bz;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setAbdate(Date abdate){
	this.abdate=abdate;
	}
	public Date getAbdate(){
		return abdate;
	}
	public void setZly(double zly){
	this.zly=zly;
	}
	public double getZly(){
		return zly;
	}
	public void setLy5(double ly5){
	this.ly5=ly5;
	}
	public double getLy5(){
		return ly5;
	}
	public void setFhk(int fhk){
	this.fhk=fhk;
	}
	public int getFhk(){
		return fhk;
	}
	public void setVipfhpay(double vipfhpay){
	this.vipfhpay=vipfhpay;
	}
	public double getVipfhpay(){
		return vipfhpay;
	}
	public void setFhpay(double fhpay){
	this.fhpay=fhpay;
	}
	public double getFhpay(){
		return fhpay;
	}
	public void setTjjt(double tjjt){
	this.tjjt=tjjt;
	}
	public double getTjjt(){
		return tjjt;
	}
	public void setTjmq(double tjmq){
	this.tjmq=tjmq;
	}
	public double getTjmq(){
		return tjmq;
	}
	public void setBz(int bz){
	this.bz=bz;
	}
	public int getBz(){
		return bz;
	}
}

