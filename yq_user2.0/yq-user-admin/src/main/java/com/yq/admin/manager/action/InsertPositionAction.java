package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;

public class InsertPositionAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String user;//插入用户
	private String pos;//位置  左或右
	private String insertUser;//被插入用户
	private int status;
	private int sjb;
	public String execute(){
       /* if(!super.getUserName().equals("admin1")){
            return INPUT;
        }*/
		if(status==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.insertPosition(user, pos, insertUser,sjb);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getInsertUser() {
		return insertUser;
	}
	public void setInsertUser(String insertUser) {
		this.insertUser = insertUser;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getSjb() {
		return sjb;
	}
	public void setSjb(int sjb) {
		this.sjb = sjb;
	}

}
