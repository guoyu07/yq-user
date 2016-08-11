package com.yq.cw.bo;

public class VipDownTemp {

	private String userName;
	private String downVip;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDownVip() {
		return downVip;
	}
	public void setDownVip(String downVip) {
		this.downVip = downVip;
	}
	public VipDownTemp(String userName, String downVip) {
		super();
		this.userName = userName;
		this.downVip = downVip;
	}
	public VipDownTemp() {
		super();
	}
}
