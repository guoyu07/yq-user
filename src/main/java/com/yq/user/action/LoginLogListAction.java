package com.yq.user.action;

import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Dateip;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class LoginLogListAction extends ALDAdminPageActionSupport<Dateip> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Gcuser gcuser;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Dateip> page = logService.getDateipListPage(gcuser.getUsername(), super.getToPage(), 18);
		
		 super.initPage(page);
		
		return SUCCESS;
	}
	
	public Gcuser getGcuser(){
		return gcuser;
	}

	public List<Dateip> getDataList() {
		return super.getDataList();
	}
	
}
