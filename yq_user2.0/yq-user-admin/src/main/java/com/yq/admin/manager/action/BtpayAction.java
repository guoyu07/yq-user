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

public class BtpayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	private String uid;
	private Gcuser gcuser;
	private int btpay;
	public String executexxxxxx(){
       /* if(!super.getUserName().equals("admin1")){
            return INPUT;
        }*/
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0||btpay==0){
			gcuser = userService.getUserByUserName(uid);
			return INPUT;
		}
		LogSystem.log("用户["+super.getUserName()+"]操作，加btpay["+new Date()+"],给--->["+uid+"],积分数量:"+btpay);
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addBtPay(uid, btpay);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.CHANGE_YB_BT, "給用戶:"+uid+",一筆補貼数量："+uid,uid);
		adminService.addAdminOperateLog(log);
		gcuser = userService.getUserByUserName(uid);
		return SUCCESS;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public int getBtpay() {
		return btpay;
	}
	public void setBtpay(int btpay) {
		this.btpay = btpay;
	}
}
