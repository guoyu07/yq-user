package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.UserProperty;
import com.yq.user.service.UserService;

public class BigVipLegalPersonAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private String uid;
	
	private Gcuser gcuser;
	
	private String faren;
	
	private UserProperty userp;
	
	private UserProperty olduserp;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		olduserp =userService.getUserProperty(uid);
		if(status==0){
			gcuser = userService.getUserByUserName(uid);
			return INPUT;
		}
		gcuser = userService.getUserByUserName(uid);
		
		if(userService.updateFaren(uid,faren)){
			userp = userService.getUserProperty(uid);
		}
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.LEGALPERSON_OP, "修改大vip法人为:"+faren+","+"玩家:"+uid,uid);
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

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public String getFaren() {
		return faren;
	}

	public void setFaren(String faren) {
		this.faren = faren;
	}

	public UserProperty getUserp() {
		return userp;
	}

	public void setUserp(UserProperty userp) {
		this.userp = userp;
	}

	public UserProperty getOlduserp() {
		return olduserp;
	}

	public void setOlduserp(UserProperty olduserp) {
		this.olduserp = olduserp;
	}
	
	
	
	
}
