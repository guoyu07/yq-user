package com.yq.user.action;

import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UserListAction extends ALDAdminPageActionSupport<Gcuser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Gcuser gcuser;
	
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		IPage<Gcuser> dataPage = userService.getTheSameNameUserPage(gcuser.getName(), gcuser.getUserid(), super.getToPage(), 20);
		super.initPage(dataPage);
		return SUCCESS;
	}
	public Gcuser getGcuser(){
		return gcuser;
	}
	public List<Gcuser> getDataList() {
		return super.getDataList();
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
