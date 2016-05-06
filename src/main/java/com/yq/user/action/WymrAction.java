package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.UserService;

public class WymrAction extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private Gpjy gpjy;
	
	private int myjddb;
	
	private int id;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gpjy = userService.getGpjyById(id);
		
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		myjddb = gcuser.getJydb();
		if(myjddb<gpjy.getJypay()){
			super.setErroCodeNum(1);
		}
		if(status==1){
			userService.mrJf(super.getUserName(), id);
			super.setErroCodeNum(2000);
		}
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Gpjy getGpjy() {
		return gpjy;
	}
	public void setGpjy(Gpjy gpjy) {
		this.gpjy = gpjy;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
