package com.yq.vip.bean;

   /**
    * you_mingxi 实体类
    */ 


public class YouMingxi{
	private Integer id;
	private String tjuser;
	private String down;
	private int sjb;
	private int count;
	public void setTjuser(String tjuser){
	this.tjuser=tjuser;
	}
	public String getTjuser(){
		return tjuser;
	}
	public void setDown(String down){
	this.down=down;
	}
	public String getDown(){
		return down;
	}
	public void setSjb(int sjb){
	this.sjb=sjb;
	}
	public int getSjb(){
		return sjb;
	}
	public void setCount(int count){
	this.count=count;
	}
	public int getCount(){
		return count;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String insertStr(){
		return "("+id+", '"+tjuser+"', '"+down+"', "+sjb+", "+count+")";
	}
}

