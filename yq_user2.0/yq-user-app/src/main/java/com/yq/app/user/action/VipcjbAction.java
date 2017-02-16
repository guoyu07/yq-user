package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.service.UserService;

public class VipcjbAction extends ALDAdminPageActionSupport<Vipcjgl> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Gcuser gcuser;
	private int status;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		super.initPage(userService.getVipcjbPageList(super.getUserName(), super.getToPage(), 10));
		if(status==1){
			return "cjbdetail";
		}
		return SUCCESS;
	}
	
	private String cjuser;
	private int cjpay;
	private String cjpass;
	public String cj(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.vipCj(super.getUserName(), cjuser, cjpay, cjpass);
		super.setErroCodeNum(2000);;
		return SUCCESS;
	}
	
	public String vipcjbcjbdetail(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		super.initPage(userService.getVipcjbPageList(super.getUserName(), super.getToPage(), 20));
		return "cjbdetail";
	}
	
	
	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public String getCjuser() {
		return cjuser;
	}

	public void setCjuser(String cjuser) {
		this.cjuser = cjuser;
	}

	public int getCjpay() {
		return cjpay;
	}

	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}

	public String getCjpass() {
		return cjpass;
	}

	public void setCjpass(String cjpass) {
		this.cjpass = cjpass;
	}
	
	
}
