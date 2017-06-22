package com.yq.vip.bean;

import java.util.Date;
   /**
    * cpuser 实体类
    */ 


public class Cpuser{
	private int cgid;
	private String cguser;
	private String cpmq;
	private Date jydate;
	private int jyjf;
	private String jyname;
	private String jyqq;
	private String jycall;
	private String add;
	private Date fwdate;
	public void setCgid(int cgid){
	this.cgid=cgid;
	}
	public int getCgid(){
		return cgid;
	}
	public void setCguser(String cguser){
	this.cguser=cguser;
	}
	public String getCguser(){
		return cguser;
	}
	public void setCpmq(String cpmq){
	this.cpmq=cpmq;
	}
	public String getCpmq(){
		return cpmq;
	}
	public void setJydate(Date jydate){
	this.jydate=jydate;
	}
	public Date getJydate(){
		return jydate;
	}
	public void setJyjf(int jyjf){
	this.jyjf=jyjf;
	}
	public int getJyjf(){
		return jyjf;
	}
	public void setJyname(String jyname){
	this.jyname=jyname;
	}
	public String getJyname(){
		return jyname;
	}
	public void setJyqq(String jyqq){
	this.jyqq=jyqq;
	}
	public String getJyqq(){
		return jyqq;
	}
	public void setJycall(String jycall){
	this.jycall=jycall;
	}
	public String getJycall(){
		return jycall;
	}
	public void setAdd(String add){
	this.add=add;
	}
	public String getAdd(){
		return add;
	}
	public void setFwdate(Date fwdate){
	this.fwdate=fwdate;
	}
	public Date getFwdate(){
		return fwdate;
	}
}

