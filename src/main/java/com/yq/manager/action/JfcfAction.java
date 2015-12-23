package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class JfcfAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		close = AdminService.isClose;
		return SUCCESS;
	}
	
	public String dealJfMr(){
		final AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		new Thread(new Runnable() {
			@Override
			public void run() {
				adminService.dealJfMrOrderForChaiFen();
			}
		}).start();
		super.setErroCodeNum(2002);
		return SUCCESS;
	}
	
	public String chaifeng(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.JygChaifen();
		 super.setErroCodeNum(2000);
		return SUCCESS;
	}
    private boolean close;
	public String closeMrMcJf(){
		AdminService.isClose = close;
		super.setErroCodeNum(2003);
		return SUCCESS;
	}
	
     public String cfdm(){
    	final AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
    	 new Thread(new Runnable() {
 			@Override
 			public void run() {
 				adminService.jfdm();
 			}
 		}).start();
    	 
    	super.setErroCodeNum(2001);
		return SUCCESS;
	}

	public boolean getClose() {
		return close;
	}

	public void setClose(boolean close) {
		this.close = close;
	}
     
     
}
