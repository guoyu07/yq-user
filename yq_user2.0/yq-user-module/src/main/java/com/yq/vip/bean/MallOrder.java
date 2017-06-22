package com.yq.vip.bean;

import java.util.Date;

public class MallOrder {

	private Integer id;
	private String orderId;
	private String orderUser;
	private int orderYb;
	private int orderScores;
	private int status;
	private Date updatedTime;
	private Date createdTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderUser() {
		return orderUser;
	}
	public void setOrderUser(String orderUser) {
		this.orderUser = orderUser;
	}
	public int getOrderYb() {
		return orderYb;
	}
	public void setOrderYb(int orderYb) {
		this.orderYb = orderYb;
	}
	public int getOrderScores() {
		return orderScores;
	}
	public void setOrderScores(int orderScores) {
		this.orderScores = orderScores;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	/**
	 * @param orderId
	 * @param orderUser
	 * @param orderYb
	 * @param orderScores
	 * @param status
	 * @param createdTime
	 */
	public MallOrder(String orderId, String orderUser, int orderYb, int orderScores, int status, Date createdTime) {
		super();
		this.orderId = orderId;
		this.orderUser = orderUser;
		this.orderYb = orderYb;
		this.orderScores = orderScores;
		this.status = status;
		this.createdTime = createdTime;
	}
	/**
	 * 
	 */
	public MallOrder() {
		super();
	}
}
