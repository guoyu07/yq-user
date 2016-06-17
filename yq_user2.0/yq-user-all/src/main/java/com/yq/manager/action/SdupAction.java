package com.yq.manager.action;

import com.yq.common.action.ALDAdminActionSupport;

public class SdupAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String my;
	
	private int status;
	
	public String execute(){
		
		if(status==0){
			return INPUT;
		}
		
		return SUCCESS;
	}

	public String getMy() {
		return my;
	}

	public void setMy(String my) {
		this.my = my;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
