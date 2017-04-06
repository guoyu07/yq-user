package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class BcjbAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private String bcid;
	private int bcjb;
	
	private Gcuser gcuser;
	public String execute(){
        /*if(!super.getUserName().equals("admin1")){
            return INPUT;
        }*/
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0){
			gcuser =  userService.getUserByUserName(bcid);
			return INPUT;
		}
		LogSystem.log("用户["+super.getUserName()+"]操作，加金币["+new Date()+"],给--->["+bcid+"],积分数量:"+bcjb);
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addJb(bcid, bcjb);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),"", new Date(), AdminGlobal.CHANGE_JB, "給用戶:"+bcid+",金幣数量："+bcjb);
		adminService.addAdminOperateLog(log);
		gcuser =  userService.getUserByUserName(bcid);
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getBcid() {
		return bcid;
	}
	public void setBcid(String bcid) {
		this.bcid = bcid;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public int getBcjb() {
		return bcjb;
	}
	public void setBcjb(int bcjb) {
		this.bcjb = bcjb;
	}
}
