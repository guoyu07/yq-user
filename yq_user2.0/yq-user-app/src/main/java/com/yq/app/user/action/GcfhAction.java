package com.yq.app.user.action;

import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcfh;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class GcfhAction extends ALDAdminPageActionSupport<Gcfh> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int lb;

	private Gcuser gcuser;
	
	private int status;
	
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Gcfh> page = logService.getGcfhListPage(super.getUserName(),lb, super.getToPage(), 15);
		
		super.initPage(page);
		/*
		String result = "p0";
		if(lb==1){
			if(status==1){
				return "p1detail";
			}
			result ="p1detail";
		}*/
		return SUCCESS;
	}
	
	
	public String gcbf0(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Gcfh> page = logService.getGcfhListPage(super.getUserName(),0, super.getToPage(), 15);
		
		super.initPage(page);
		
	
		return "p0";
	}
	
	public String gcbf1(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Gcfh> page = logService.getGcfhListPage(super.getUserName(),1, super.getToPage(), 15);
		
		super.initPage(page);
		return "p1detail";
	}

	
	
	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public Gcuser getGcuser(){
		return gcuser;
	}

	public List<Gcfh> getDataList() {
		return super.getDataList();
	}

	public int getLb() {
		return lb;
	}


	public void setLb(int lb) {
		this.lb = lb;
	}
	
	

}
