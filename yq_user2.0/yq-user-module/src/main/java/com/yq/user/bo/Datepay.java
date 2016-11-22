package com.yq.user.bo;

import java.util.Date;
   /**
    * datepay 实体类
    */ 


public class Datepay{
	private Integer id;
	private String username;
	//一币收入
	private int syjz;
	//一币支出
	private int jc;
	//金币收入
	private int jyjz;
	//金币支出
	private int dbjc;
	private int zff;
	//当前一币
	private int pay;
	//当前金币
	private int jydb;
	private Date abdate;
	private String regid;
	private int kjqi;
	private int bz;
	private int newbz;
	private int txbz;
	private double ration;
	private int origintype;		//途径
	
	public void setUsername(String username){
	this.username=username;
	}
	public String getUsername(){
		return username;
	}
	/**设置一币收入*/
	public void setSyjz(int syjz){
	this.syjz=syjz;
	}
	/**得到一币收入*/
	public int getSyjz(){
		return syjz;
	}
	/**设置一币支出*/
	public void setJc(int jc){
	this.jc=jc;
	}
	/**得到一币支出*/
	public int getJc(){
		return jc;
	}
	/**
	 * 设置金币收入
	 * 
	 * */
	public void setJyjz(int jyjz){
	this.jyjz=jyjz;
	}
	/**
	 * 得到金币收入
	 * 
	 * */
	public int getJyjz(){
		return jyjz;
	}
	/**
	 * 设置金币支出
	 * 
	 * */
	public void setDbjc(int dbjc){
	this.dbjc=dbjc;
	}
	/**
	 * 得到金币支出
	 * 
	 * */
	public int getDbjc(){
		return dbjc;
	}
	public void setZff(int zff){
	this.zff=zff;
	}
	public int getZff(){
		return zff;
	}
	/**设置当前一币*/
	public void setPay(int pay){
	this.pay=pay;
	}
	/**得到当前一币*/
	public int getPay(){
		return pay;
	}
	/**设置当前金币*/
	public void setJydb(int jydb){
	this.jydb=jydb;
	}
	/**获得当前金币*/
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
	public int getOrigintype() {
		return origintype;
	}
	public void setOrigintype(int origintype) {
		this.origintype = origintype;
	}
	
}

