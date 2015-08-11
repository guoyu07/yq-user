package com.yq.user.bo;

import java.util.Date;
   /**
    * datecj 实体类
    */ 


public class Datecj{
	private Integer id;
	private String cjuser;
	private int dqcj;
	private int ljcj;
	private String cjfs;
	private int ifcl;
	private int gc;
	private Date cjdate;
	private Date qldate;
	private String cz;
	private String bz;
	private String ip;
	public void setCjuser(String cjuser){
	this.cjuser=cjuser;
	}
	public String getCjuser(){
		return cjuser;
	}
	public void setDqcj(int dqcj){
	this.dqcj=dqcj;
	}
	public int getDqcj(){
		return dqcj;
	}
	public void setLjcj(int ljcj){
	this.ljcj=ljcj;
	}
	public int getLjcj(){
		return ljcj;
	}
	public void setCjfs(String cjfs){
	this.cjfs=cjfs;
	}
	public String getCjfs(){
		return cjfs;
	}
	public void setIfcl(int ifcl){
	this.ifcl=ifcl;
	}
	public int getIfcl(){
		return ifcl;
	}
	public void setGc(int gc){
	this.gc=gc;
	}
	public int getGc(){
		return gc;
	}
	public void setCjdate(Date cjdate){
	this.cjdate=cjdate;
	}
	public Date getCjdate(){
		return cjdate;
	}
	public void setQldate(Date qldate){
	this.qldate=qldate;
	}
	public Date getQldate(){
		return qldate;
	}
	public void setCz(String cz){
	this.cz=cz;
	}
	public String getCz(){
		return cz;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
	public void setIp(String ip){
	this.ip=ip;
	}
	public String getIp(){
		return ip;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}

