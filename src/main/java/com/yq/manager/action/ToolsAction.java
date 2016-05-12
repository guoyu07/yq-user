package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
/**
 * 一些工具
 * @author ThinkPad User
 *
 */
public class ToolsAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String user;
	private int ssjb;
	private String desc;
	public String addAqAndBq(){
		new Thread(new Runnable() {
			@Override
			public void run() {
				AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
				adminService.addAqOrBqForUserNoLog(user, ssjb, desc);
			}
		}).start();
		return SUCCESS;
	}
	
	public int getErroCodeNum() {
		return super.getErroCodeNum();
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getSsjb() {
		return ssjb;
	}
	public void setSsjb(int ssjb) {
		this.ssjb = ssjb;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

	
}
