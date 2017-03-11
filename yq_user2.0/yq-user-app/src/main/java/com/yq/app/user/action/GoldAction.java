package com.yq.app.user.action;

import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class GoldAction extends ALDAdminPageActionSupport<Datepay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer lb;
	private Gcuser gcuser;

	private int status;
	
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		if(lb!=null&&lb==0){
			lb=null;
		}
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		IPage<Datepay> page = logService.getGoldDetailListPage(super.getUserName(), lb, super.getToPage(), 18);
		
		super.initPage(page);
		
		return SUCCESS;
	}
	
	public Gcuser getGcuser(){
		return gcuser;
	}
	public List<Datepay> getDataList() {
		return super.getDataList();
	}
	public Integer getLb() {
		return lb;
	}

	public void setLb(Integer lb) {
		this.lb = lb;
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
	
	
}
