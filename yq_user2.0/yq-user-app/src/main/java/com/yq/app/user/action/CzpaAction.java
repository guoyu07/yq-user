package com.yq.app.user.action;

import org.apache.commons.lang.RandomStringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Ejbk;
import com.yq.user.service.UserService;

public class CzpaAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String id;
	
	
	private Ejbk ejbk;
	
	private String pdpa;
	
	private String fwid;
	
	private static final char[] RANDOMCHAR = new char[]{'0','1','2','3','4','9','a','b','c','d','e','f','g','5','6','7','8','h','j','k','x','y','z','i'};

	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		ejbk = userService.getEjbk(id);
		if(ejbk==null){
			super.setErroCodeNum(1);//卡不存在
		}else{
			pdpa = RandomStringUtils.random(6, RANDOMCHAR);
			fwid = RandomStringUtils.random(6, RANDOMCHAR);
			ejbk = userService.updateEjbk(id,super.getUserName(),pdpa,fwid);
		}
		return SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Ejbk getEjbk() {
		return ejbk;
	}

	public void setEjbk(Ejbk ejbk) {
		this.ejbk = ejbk;
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
