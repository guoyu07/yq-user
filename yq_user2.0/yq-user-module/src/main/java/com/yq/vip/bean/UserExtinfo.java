package com.yq.vip.bean;

public class UserExtinfo {
	
	private String userName;
	private int needVerify;//是否需要审核  0需要   1不需要
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getNeedVerify() {
		return needVerify;
	}
	public void setNeedVerify(int needVerify) {
		this.needVerify = needVerify;
	}
	public UserExtinfo(String userName, int needVerify) {
		super();
		this.userName = userName;
		this.needVerify = needVerify;
	}
	public UserExtinfo() {
		super();
	}
	
	
}
