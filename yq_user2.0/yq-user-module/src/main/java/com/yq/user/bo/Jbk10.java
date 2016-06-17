package com.yq.user.bo;

import java.util.Date;
   /**
    * jbk10 实体类
    */ 


public class Jbk10{
	private int id;
	private String pdid;
	private String pdpamd5;
	private String fwidmd5;
	private int bzok;
	private String up;
	private Date jhdate;
	private int lqcg;
	private int bf2;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setPdid(String pdid){
	this.pdid=pdid;
	}
	public String getPdid(){
		return pdid;
	}
	public void setPdpamd5(String pdpamd5){
	this.pdpamd5=pdpamd5;
	}
	public String getPdpamd5(){
		return pdpamd5;
	}
	public void setFwidmd5(String fwidmd5){
	this.fwidmd5=fwidmd5;
	}
	public String getFwidmd5(){
		return fwidmd5;
	}
	public void setBzok(int bzok){
	this.bzok=bzok;
	}
	public int getBzok(){
		return bzok;
	}
	public void setUp(String up){
	this.up=up;
	}
	public String getUp(){
		return up;
	}
	public void setJhdate(Date jhdate){
	this.jhdate=jhdate;
	}
	public Date getJhdate(){
		return jhdate;
	}
	public void setLqcg(int lqcg){
	this.lqcg=lqcg;
	}
	public int getLqcg(){
		return lqcg;
	}
	public void setBf2(int bf2){
	this.bf2=bf2;
	}
	public int getBf2(){
		return bf2;
	}
}

