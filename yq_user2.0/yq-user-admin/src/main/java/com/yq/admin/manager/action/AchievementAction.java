package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.service.UserService;

/**
 * @author 作者: HuHua
 * @version 2016年9月10日
 * 类说明    重置玩家业绩
 */
public class AchievementAction extends ALDAdminActionSupport{
	
	private static final long serialVersionUID = 1L;
	private String user;
	private String status;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		if(userService.getUserByUserName(user)==null){
			status="1";
		}
		adminService.resetUserAchivement(user);
		return SUCCESS;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

}
