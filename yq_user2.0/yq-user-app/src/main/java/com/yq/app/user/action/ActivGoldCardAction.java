package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datecj;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;
/**
 * 激活金币卡
 * @author ThinkPad User
 *
 */
public class ActivGoldCardAction extends ALDAdminPageActionSupport<Datecj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String pdid;
	
	private String pdpa;
	
	private String fwid;
	
	private int status;
	
	private String smsCode;
	
	public String execute(){
		if(status==1){
			UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			userService.activedGoldCard(super.getUserName(), pdid, pdpa, fwid, super.ip(),smsCode);
			super.setErroCodeNum(2000);
		}
		
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getDateCjPageList(super.getUserName(), super.getToPage(), 10));
		super.setErroCodeNum(2001);
		
		return SUCCESS;
	}


	public String getPdid() {
		return pdid;
	}


	public void setPdid(String pdid) {
		this.pdid = pdid;
	}


	public String getPdpa() {
		return pdpa;
	}


	public void setPdpa(String pdpa) {
		this.pdpa = pdpa;
	}


	public String getFwid() {
		return fwid;
	}


	public void setFwid(String fwid) {
		this.fwid = fwid;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getSmsCode() {
		return smsCode;
	}


	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}
	
	

}
