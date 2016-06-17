package com.yq.user.action;

import java.util.List;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class TjzAction extends ALDAdminPageActionSupport<Gcuser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private List<String> fromUsers;
	
	private String pa2j;
	
	private int tp;//0  转一币  1转购物券
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		if(status==0){
			Gcuser gcuser = userService.getUserByUserName(super.getUserName());
			super.initPage(userService.getTheSameNameUserPageByCondition(super.getUserName(), gcuser.getName(), gcuser.getUserid(), super.getToPage(), 10));
		}else{
			
			if(fromUsers==null||fromUsers.size()==0){
				super.setErroCodeNum(6);
				return SUCCESS;
			}
			if(tp==0){
				userService.batchTrasferYb(fromUsers, super.getUserName(), pa2j);
			}else{
				userService.batchTrasferScores(fromUsers, super.getUserName(), pa2j);
			}
			super.setErroCodeNum(10);
		}
		
		return SUCCESS;
	}
	




	public int getTp() {
		return tp;
	}





	public void setTp(int tp) {
		this.tp = tp;
	}





	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<String> getFromUsers() {
		return fromUsers;
	}

	public void setFromUsers(List<String> fromUsers) {
		this.fromUsers = fromUsers;
	}

	public String getPa2j() {
		return pa2j;
	}

	public void setPa2j(String pa2j) {
		this.pa2j = pa2j;
	}
}
