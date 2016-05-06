package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class VipgoAction extends ALDAdminPageActionSupport<Datecj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int status;
	
	private Gcuser gcuser;
	
	private int cjpay;
	
	public String execute(){
		
		if(status==1){
			UserService userService  = ServiceCacheFactory.getServiceCache().getService(UserService.class);
			gcuser = userService.getUserByUserName(super.getUserName());
			return SUCCESS;
		}
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getDateCjPageList(super.getUserName(), super.getToPage(), 15));
		
		return INPUT;
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

	public int getCjpay() {
		return cjpay;
	}

	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}
	
}
