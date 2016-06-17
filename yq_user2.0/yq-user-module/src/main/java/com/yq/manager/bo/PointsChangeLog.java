package com.yq.manager.bo;

import java.util.Date;

public class PointsChangeLog {

	private Integer id;
	private String oldPrice;
	private String newPrice;
	private String upRation;
	private String currentNum;
	private Date createdTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(String oldPrice) {
		this.oldPrice = oldPrice;
	}
	public String getNewPrice() {
		return newPrice;
	}
	public void setNewPrice(String newPrice) {
		this.newPrice = newPrice;
	}
	public String getUpRation() {
		return upRation;
	}
	public void setUpRation(String upRation) {
		this.upRation = upRation;
	}
	public String getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(String currentNum) {
		this.currentNum = currentNum;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
}
