package com.yq.manager.bo;

import java.util.Date;

public class UserVipLog {
	
	private String user;
	private int opType;//操作类型 1 修改vip信息   2取消vip
	private String opUser;
	private String ip;
	private String commitParam;
	private Date createdTime;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getOpType() {
		return opType;
	}
	public void setOpType(int opType) {
		this.opType = opType;
	}
	public String getOpUser() {
		return opUser;
	}
	public void setOpUser(String opUser) {
		this.opUser = opUser;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCommitParam() {
		return commitParam;
	}
	public void setCommitParam(String commitParam) {
		this.commitParam = commitParam;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	/**
	 * @param user
	 * @param opType
	 * @param opUser
	 * @param ip
	 * @param commitParam
	 * @param createdTime
	 */
	public UserVipLog(String user, int opType, String opUser, String ip, String commitParam, Date createdTime) {
		super();
		this.user = user;
		this.opType = opType;
		this.opUser = opUser;
		this.ip = ip;
		this.commitParam = commitParam;
		this.createdTime = createdTime;
	}

}
