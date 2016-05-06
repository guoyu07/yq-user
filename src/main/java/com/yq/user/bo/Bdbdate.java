package com.yq.user.bo;

import java.util.Date;
   /**
    * bdbdate 实体类
    */ 


public class Bdbdate{
	private Integer id;
	private String zuser;
	private int sy;
	private int jc;
	private int sybdb;
	private int ljbdb;
	private int zaq;
	private int zbq;
	private int aq;
	private int bq;
	private Date bfdate;
	private String bz;
	public void setId(Integer id){
	this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setZuser(String zuser){
	this.zuser=zuser;
	}
	public String getZuser(){
		return zuser;
	}
	public void setSy(int sy){
	this.sy=sy;
	}
	public int getSy(){
		return sy;
	}
	public void setJc(int jc){
	this.jc=jc;
	}
	public int getJc(){
		return jc;
	}
	public void setSybdb(int sybdb){
	this.sybdb=sybdb;
	}
	public int getSybdb(){
		return sybdb;
	}
	public void setLjbdb(int ljbdb){
	this.ljbdb=ljbdb;
	}
	public int getLjbdb(){
		return ljbdb;
	}
	public void setZaq(int zaq){
	this.zaq=zaq;
	}
	public int getZaq(){
		return zaq;
	}
	public void setZbq(int zbq){
	this.zbq=zbq;
	}
	public int getZbq(){
		return zbq;
	}
	public void setAq(int aq){
	this.aq=aq;
	}
	public int getAq(){
		return aq;
	}
	public void setBq(int bq){
	this.bq=bq;
	}
	public int getBq(){
		return bq;
	}
	public void setBfdate(Date bfdate){
	this.bfdate=bfdate;
	}
	public Date getBfdate(){
		return bfdate;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
}

