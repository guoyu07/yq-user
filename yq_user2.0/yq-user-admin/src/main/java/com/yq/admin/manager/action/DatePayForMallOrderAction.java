package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;
import com.yq.user.service.LogService;

public class DatePayForMallOrderAction extends ALDAdminPageActionSupport<Datepay>{
	private static final long serialVersionUID = 1L;
	private int status;
	private String orderId;
	private String zuser;
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		//UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		/*if(status==1){
			logService.getMallorder(orderId);
		}*/
		super.initPage(logService.getDatePayByMallorder(orderId,super.getToPage(),30));
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
	public String getZuser() {
		return zuser;
	}
	public void setZuser(String zuser) {
		this.zuser = zuser;
	}
	

}
