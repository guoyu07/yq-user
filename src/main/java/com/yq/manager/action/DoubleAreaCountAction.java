package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.exception.ServiceException;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;
import com.yq.user.service.ManagerService;

public class DoubleAreaCountAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	public String execute(){
		if(!super.getUserName().equals("admin1")){
			return INPUT;
		}
		if(status==0){
			ManagerService managerService = ServiceCacheFactory.getService(ManagerService.class);
			Fcxt fcxt = managerService.getFcxtById(2);
			if(System.currentTimeMillis()<=fcxt.getJsdate().getTime()){
				throw new ServiceException(1, "还没有到结算时间（每星期二22点后）！");
			}
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.doubelAreaCount();
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	
}
