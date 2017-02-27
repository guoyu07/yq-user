package com.yq.agent.bean;

import java.util.Date;

public class TxDetail {
	
	private String userName;	//用户名
	private Date payDate;		//挂牌时间
	private Date rgDate;		//交易完成时间
	private int paynum;			//交易数量
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Date getRgDate() {
		return rgDate;
	}
	public void setRgDate(Date rgDate) {
		this.rgDate = rgDate;
	}
	public int getPaynum() {
		return paynum;
	}
	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}
	
	
	

}
