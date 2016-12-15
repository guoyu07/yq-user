package com.yq.app.user.action;

import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.UserScoresLog;
import com.yq.user.service.UserService;

public class UserMallorderScoresLogAction extends ALDAdminActionSupport{
	private static final long serialVersionUID = 1L;
	private Gcuser gcuser;
	private int status;
	private String orderId;
	private List<UserScoresLog> userScoresLoglist;
	
	public String execute() {
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(status==1){
			if(userService.isHasMallorderByorder(super.getUserName(),orderId)){
				userScoresLoglist = userService.getUserScoresLogByMallOrderList(super.getUserName(),orderId);
			}
		}
		return SUCCESS;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public List<UserScoresLog> getUserScoresLoglist() {
		return userScoresLoglist;
	}

	public void setUserScoresLoglist(List<UserScoresLog> userScoresLoglist) {
		this.userScoresLoglist = userScoresLoglist;
	}

	

}
