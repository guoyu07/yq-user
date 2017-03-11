package com.yq.app.user.action;

import java.util.List;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bean.UserBeanTemp;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class UserListAction extends ALDAdminPageActionSupport<Gcuser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Gcuser gcuser;
	
	private List<UserBeanTemp> userList;
	private int status;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		IPage<Gcuser> dataPage = userService.getTheSameNameUserPage(gcuser.getName(), gcuser.getUserid(), super.getToPage(),18);
		super.initPage(dataPage);
		if(status==1){
			return "detail";
		}
		return SUCCESS;
	}
	public String getuserlist(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		userList = userService.getUserNameList(super.getUserName());
		return SUCCESS;
	}
	public String userlistdetail(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		IPage<Gcuser> dataPage = userService.getTheSameNameUserPage(gcuser.getName(), gcuser.getUserid(), super.getToPage(), 12);
		super.initPage(dataPage);
		return "detail";
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
	public List<UserBeanTemp> getUserList() {
		return userList;
	}
	public void setUserList(List<UserBeanTemp> userList) {
		this.userList = userList;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
