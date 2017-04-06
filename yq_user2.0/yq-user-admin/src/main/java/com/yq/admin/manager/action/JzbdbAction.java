package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class JzbdbAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private String jzid;
	private int jzbdb;
	private Gcuser gcuser;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0){
			gcuser =  userService.getUserByUserName(jzid);
			return INPUT;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addSyep(jzid, jzbdb,super.getUserName());
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),"", new Date(), AdminGlobal.CHANGE_BDB, "改變數量："+jzbdb);
		adminService.addAdminOperateLog(log);
		gcuser =  userService.getUserByUserName(jzid);
		return SUCCESS;
	}
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}


	public String getJzid() {
		return jzid;
	}


	public void setJzid(String jzid) {
		this.jzid = jzid;
	}


	public int getJzbdb() {
		return jzbdb;
	}


	public void setJzbdb(int jzbdb) {
		this.jzbdb = jzbdb;
	}


	public Gcuser getGcuser() {
		return gcuser;
	}


	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	
	
}
