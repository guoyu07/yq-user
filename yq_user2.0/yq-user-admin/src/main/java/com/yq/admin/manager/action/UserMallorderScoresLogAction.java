package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.UserScoresLog;
import com.yq.user.service.LogService;

public class UserMallorderScoresLogAction extends ALDAdminPageActionSupport<UserScoresLog>{
	private static final long serialVersionUID = 1L;
	private int status;
	private String orderId;
	
	public String execute() {
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getScoresLogPageByMallOrder(orderId,super.getToPage(),30));
		return SUCCESS;
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
	

}
