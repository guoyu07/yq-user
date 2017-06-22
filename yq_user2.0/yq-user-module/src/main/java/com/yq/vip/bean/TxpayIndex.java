package com.yq.vip.bean;

import java.util.Date;

public class TxpayIndex {
	
	private int payid;
	private int ep;
	private int txvip;
	private Date createdTime;
	
	public int getPayid() {
		return payid;
	}
	public void setPayid(int payid) {
		this.payid = payid;
	}
	public int getEp() {
		return ep;
	}
	public void setEp(int ep) {
		this.ep = ep;
	}
	public int getTxvip() {
		return txvip;
	}
	public void setTxvip(int txvip) {
		this.txvip = txvip;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
}
