package com.yq.app.user.action;

import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class DatePayForMallOrderAction extends ALDAdminActionSupport{
	private static final long serialVersionUID = 1L;
	private Gcuser gcuser;
	private int status;
	private String orderId;
	private List<Datepay> datepaylist;
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(status==1){
			if(userService.isHasMallorderByorder(super.getUserName(),orderId)){
				datepaylist = logService.getDatePayListByMallorder(super.getUserName(), orderId);
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
	public List<Datepay> getDatepaylist() {
		return datepaylist;
	}
	public void setDatepaylist(List<Datepay> datepaylist) {
		this.datepaylist = datepaylist;
	}
	

}
