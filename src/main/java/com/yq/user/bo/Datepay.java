package com.yq.user.bo;

import java.util.Date;
   /**
    * datepay 实体类
    */ 


public class Datepay{
	private Integer id;
	private String username;
	private int syjz;
	private int jc;
	private int jyjz;
	private int dbjc;
	private int zff;
	private int pay;
	private int jydb;
	private Date abdate;
	private String regid;
	private int kjqi;
	private int bz;
	private int newbz;
	private int txbz;
	private double ration;
	
	
	public void setUsername(String username){
	this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setSyjz(int syjz){
	this.syjz=syjz;
	}
	public int getSyjz(){
		return syjz;
	}
	public void setJc(int jc){
	this.jc=jc;
	}
	public int getJc(){
		return jc;
	}
	public void setJyjz(int jyjz){
	this.jyjz=jyjz;
	}
	public int getJyjz(){
		return jyjz;
	}
	public void setDbjc(int dbjc){
	this.dbjc=dbjc;
	}
	public int getDbjc(){
		return dbjc;
	}
	public void setZff(int zff){
	this.zff=zff;
	}
	public int getZff(){
		return zff;
	}
	public void setPay(int pay){
	this.pay=pay;
	}
	public int getPay(){
		return pay;
	}
	public void setJydb(int jydb){
	this.jydb=jydb;
	}
	public int getJydb(){
		return jydb;
	}
	public void setAbdate(Date abdate){
	this.abdate=abdate;
	}
	public Date getAbdate(){
		return abdate;
	}
	public void setRegid(String regid){
	this.regid=regid;
	}
	public String getRegid(){
		return regid;
	}
	public void setKjqi(int kjqi){
	this.kjqi=kjqi;
	}
	public int getKjqi(){
		return kjqi;
	}
	public void setBz(int bz){
	this.bz=bz;
	}
	public int getBz(){
		return bz;
	}
	public void setNewbz(int newbz){
	this.newbz=newbz;
	}
	public int getNewbz(){
		return newbz;
	}
	public void setTxbz(int txbz){
	this.txbz=txbz;
	}
	public int getTxbz(){
		return txbz;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public double getRation() {
		return ration;
	}
	public void setRation(double ration) {
		this.ration = ration;
	}
}

