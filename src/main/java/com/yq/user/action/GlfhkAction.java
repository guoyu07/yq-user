package com.yq.user.action;

import org.apache.commons.lang.RandomStringUtils;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Ejbk;
import com.yq.user.service.UserService;

public class GlfhkAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//卡id
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
			if(ejbk.getGpa()>1){
				super.setErroCodeNum(2);//你上次已经查看过该卡密码，如果密码已过给发给客户，请不要随便重置密码！
			}else if(ejbk.getGpa()<2){
				pdpa = RandomStringUtils.random(6, RANDOMCHAR);
				fwid = RandomStringUtils.random(6, RANDOMCHAR);
				ejbk = userService.updateEjbk(id,super.getUserName(),pdpa,fwid);
				return "ckpa";
			}
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

	public void setEjbk(Ejbk ejbk) {
		this.ejbk = ejbk;
	}
}
