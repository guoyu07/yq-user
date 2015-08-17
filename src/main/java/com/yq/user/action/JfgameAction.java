package com.yq.user.action;

import com.yq.common.action.ALDAdminActionSupport;

public class JfgameAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private String pa;
	
	public String execute(){
		if(status==1){
//			UserService userService  = ServiceCacheFactory.getServiceCache().getService(UserService.class);
//			Gcuser gcuser = userService.getUserByUserName(super.getUserName());
//			if(!gcuser.getPassword().equals(MD5Security.md5_16(pa))){
//				super.setErroCodeNum(1);
//				return SUCCESS;
//			}else{
				return "redirect";
			}
		 return SUCCESS;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPa() {
		return pa;
	}

	public void setPa(String pa) {
		this.pa = pa;
	}

}
