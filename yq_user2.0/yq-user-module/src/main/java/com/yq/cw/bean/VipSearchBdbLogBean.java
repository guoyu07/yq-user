package com.yq.cw.bean;

import java.util.List;

public class VipSearchBdbLogBean {

	private int startNum;
	private List<ClientBdblog> clientBdbList;
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public List<ClientBdblog> getClientBdbList() {
		return clientBdbList;
	}
	public void setClientBdbList(List<ClientBdblog> clientBdbList) {
		this.clientBdbList = clientBdbList;
	}
	
	
	
}
