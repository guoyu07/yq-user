package com.yq.user.action;

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
	
	public String execute(){
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Gcfh> page = logService.getGcfhListPage(super.getUserName(),lb, super.getToPage(), 15);
		
		super.initPage(page);
		
		String result = "p0";
		if(lb==1){
			result ="p1";
		}
		return result;
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
