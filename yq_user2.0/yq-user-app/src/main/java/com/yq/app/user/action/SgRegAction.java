package com.yq.app.user.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Sgxt;
import com.yq.user.service.ManagerService;
import com.yq.user.service.UserService;

public class SgRegAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String bdid;
	
	private String myup;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		
		ManagerService managerService = ServiceCacheFactory.getServiceCache().getService(ManagerService.class);
		
		Fcxt fcxt = managerService.getFcxtById(2);
		if(fcxt!=null){
			Date date = fcxt.getJsdate();
			if(date!=null&&new Date().getTime()>date.getTime()){
				super.setErroCodeNum(1);//alert('结算期间暂停开户，明天开放！');history.go(-1);
				return SUCCESS;
			}
		}
		
		if(gcuser.getSjb()==0){
			super.setErroCodeNum(2);//alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);
			return SUCCESS;
		}
		
		Sgxt tuser = userService.getSgxt(myup);
		if(tuser==null){
			super.setErroCodeNum(3);//alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);
			return SUCCESS;
		}
		
		return SUCCESS;
	}
	
	
	public int getErroCodeNum(){
		return super.getErroCodeNum();
	}
	
	public String getUserName(){
		return super.getUserName();
	}


	public String getMyup() {
		return myup;
	}


	public void setMyup(String myup) {
		this.myup = myup;
	}


	public String getBdid() {
		return bdid;
	}


	public void setBdid(String bdid) {
		this.bdid = bdid;
	}

}
