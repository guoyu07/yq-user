package com.yq.common.action;

import com.sr178.module.web.action.BaseActionSupport;
/**
 * @author hzy
 * 2012-7-20
 */
public class ALDAdminActionSupport extends BaseActionSupport {
	/**  */
	private static final long serialVersionUID = 1L;
	
	public int getErroCodeNum() {
		return super.getCode();
	}

	public void setErroCodeNum(int erroCodeNum) {
		super.setCode(erroCodeNum);
	}

	public String getErroDescrip() {
		return super.getDesc();
	}

	public void setErroDescrip(String erroDescrip) {
		super.setDesc(erroDescrip);
	}

	
}
