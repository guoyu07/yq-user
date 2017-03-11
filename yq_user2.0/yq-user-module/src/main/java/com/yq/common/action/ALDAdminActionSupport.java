package com.yq.common.action;

import com.sr178.module.web.action.BaseActionSupport;
public class ALDAdminActionSupport extends BaseActionSupport {
	/**  */
	private static final long serialVersionUID = 1L;
	
	private int thisState = 242;
	
	private int secondThisState=244;
	
	private int thirdThisState;
	
	
	
	public int getThirdThisState() {
		return thirdThisState;
	}

	public void setThirdThisState(int thirdThisState) {
		this.thirdThisState = thirdThisState;
	}

	public int getSecondThisState() {
		return secondThisState;
	}

	public void setSecondThisState(int secondThisState) {
		this.secondThisState = secondThisState;
	}

	public int getThisState() {
		return thisState;
	}

	public void setThisState(int thisState) {
		this.thisState = thisState;
	}

	public int getErroCodeNum() {
		return super.getCode();
	}

	private String redirectBaseUrl;
	public void setErroCodeNum(int erroCodeNum) {
		super.setCode(erroCodeNum);
	}

	public String getErroDescrip() {
		return super.getDesc();
	}

	public void setErroDescrip(String erroDescrip) {
		super.setDesc(erroDescrip);
	}

	public String getRedirectBaseUrl() {
		return redirectBaseUrl;
	}

	public void setRedirectBaseUrl(String redirectBaseUrl) {
		this.redirectBaseUrl = redirectBaseUrl;
	}
}
