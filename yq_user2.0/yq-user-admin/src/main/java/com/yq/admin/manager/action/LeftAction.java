package com.yq.admin.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.service.ManageService;
import com.yq.user.bo.Fcxt;
import com.yq.user.dao.FcxtDao;

public class LeftAction extends ALDAdminActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
 
	private Fcxt fcxt;
	public String execute(){
		FcxtDao fcxtDao = ServiceCacheFactory.getService(FcxtDao.class);
		fcxt = fcxtDao.getAdminUser(super.getUserName());
		
		return SUCCESS;
	}
	  
	
	private String newPwd;
	private String password2;
    /**
     * 修改密码
     * 
     * @return
     * @throws Exception
     */
    public String saveWd(){
    	ManageService manageService = ServiceCacheFactory.getService(ManageService.class);
        manageService.savePwd(newPwd,password2, manageService.getManageUser(super.getUserName()).getId());
        return SUCCESS;
        
    }

	
	public Fcxt getFcxt() {
		return fcxt;
	}
	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}


	public String getNewPwd() {
		return newPwd;
	}


	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}


	public String getPassword2() {
		return password2;
	}


	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	
}
