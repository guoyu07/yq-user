package com.yq.app.bean;

import com.yq.user.bo.Gcuser;

public class SimpleUserInfoBean {

	private String userName;
	private String name;
	private int yb;
	private int scores;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYb() {
		return yb;
	}
	public void setYb(int yb) {
		this.yb = yb;
	}
	public int getScores() {
		return scores;
	}
	public void setScores(int scores) {
		this.scores = scores;
	}
	
	public static SimpleUserInfoBean getSimpleByGcuser(Gcuser gcuser){
		SimpleUserInfoBean simp = new SimpleUserInfoBean();
		if(gcuser!=null){
			simp.setName(gcuser.getName());
			simp.setUserName(gcuser.getUsername());
			simp.setYb(gcuser.getPay());
			simp.setScores(gcuser.getScores());
		}
		return simp;
	}
}
