package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class EpsfAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private String uid;
	
	private String sflb;
	
	private Gcuser gcuser;
	
	private int sfpay;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==0){
			gcuser = userService.getUserByUserName(uid);
			return INPUT;
		}
		
		if(sfpay<=0){
			
			return INPUT;
		}
		LogSystem.log("用户["+super.getUserName()+"]操作，修改一币["+new Date()+"],给--->["+uid+"],sfpay:"+sfpay+",sflb="+sflb);
		userService.changeYbCanFu(uid, -sfpay, sflb, 0, null, super.getUserName());
		gcuser = userService.getUserByUserName(uid);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.REDUCE_YB, "修改一币金额:"+sfpay+","+"转出者:"+uid+",sflb:"+sflb,uid);
		userService.addAdminOperateLog(log);
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

	public String getSflb() {
		return sflb;
	}

	public void setSflb(String sflb) {
		this.sflb = sflb;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public int getSfpay() {
		return sfpay;
	}

	public void setSfpay(int sfpay) {
		this.sfpay = sfpay;
	}
}
