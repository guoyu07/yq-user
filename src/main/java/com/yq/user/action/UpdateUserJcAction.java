package com.yq.user.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UpdateUserJcAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String jcname;
	
	private String jcuserid;
	
	private int status;
	
	private Gcuser gcuser;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		if(status!=0){
			if(!Strings.isNullOrEmpty(gcuser.getJcname())||!Strings.isNullOrEmpty(gcuser.getJcuserid())){
				super.setErroCodeNum(1);
				return SUCCESS;
			}
			
			userService.updateUser(gcuser.getUsername(), jcname, jcuserid);
			return SUCCESS;
			
		}
		
		return INPUT;
	}
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	
	public Gcuser getGcuser(){
		return gcuser;
	}

	public String getJcname() {
		return jcname;
	}

	public void setJcname(String jcname) {
		this.jcname = jcname;
	}

	public String getJcuserid() {
		return jcuserid;
	}

	public void setJcuserid(String jcuserid) {
		this.jcuserid = jcuserid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
