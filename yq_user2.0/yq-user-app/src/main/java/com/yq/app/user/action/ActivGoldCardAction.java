package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.service.UserService;
/**
 * 激活金币卡
 * @author ThinkPad User
 *
 */
public class ActivGoldCardAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String pdid;
	
	private String pdpa;
	
	private String fwid;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		userService.activedGoldCard(super.getUserName(), pdid, pdpa, fwid, super.ip());
		super.setErroCodeNum(2000);
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
	
	

}
