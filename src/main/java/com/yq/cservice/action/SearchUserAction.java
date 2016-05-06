package com.yq.cservice.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.cservice.service.CsService;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class SearchUserAction extends ALDAdminPageActionSupport<Datecj> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String user;
	private Gcuser gcuser;
	private Fcxt csUser;
	private Fcxt rsq;
	private int back;
	public String execute(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		CsService csService = ServiceCacheFactory.getService(CsService.class);
		gcuser = userService.getUserByUserName(user);
		csUser = csService.getCsAdminUser(super.getUserName());
		if(gcuser!=null&&gcuser.getDqu()!=null){
			rsq = csService.getByDqu(gcuser.getDqu());
			if(gcuser.getDqu()==csUser.getFsjygsl()||gcuser.getDqu()==csUser.getSyjygsl()||gcuser.getDqu()==csUser.getJygsl()||gcuser.getDqu()==csUser.getJy5w()||gcuser.getDqu()==csUser.getPayadd()){

			}else{
				back =1;
				return SUCCESS;
			}
		}
		return SUCCESS;
	}
	
	private int status;
	private int cjpay;
	private String cjfs;
	public String chargeBdb(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(user);
		if(gcuser==null){
			super.setErroCodeNum(1);//用户不存在
		}
		if(status==0){
			return "input1";
		}
		if(status==1){
			return "input2";
		}
		if(status==2){
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			adminService.chargeBdbByAdmin(super.getUserName(), user, cjpay, super.ip(), cjfs);
			super.setErroCodeNum(2000);
			return "input2";
		}
		return SUCCESS;
	}
	
	public String chargeGw(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		gcuser = userService.getUserByUserName(user);
		if(gcuser==null){
			super.setErroCodeNum(1);//用户不存在
		}
		if(status==0){
			return "input1";
		}
		if(status==1){
			return "input2";
		}
		if(status==2){
			AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			adminService.chargeGw(super.getUserName(), user, cjpay, super.ip(), cjfs);
			super.setErroCodeNum(2000);
			return "input2";
		}
		return SUCCESS;
	}
	
	public String dbdList(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getDateCjPageList(user, super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public Fcxt getRsq() {
		return rsq;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setRsq(Fcxt rsq) {
		this.rsq = rsq;
	}
	public int getBack() {
		return back;
	}
	public void setBack(int back) {
		this.back = back;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public Fcxt getCsUser() {
		return csUser;
	}
	public void setCsUser(Fcxt csUser) {
		this.csUser = csUser;
	}
	public int getCjpay() {
		return cjpay;
	}
	public void setCjpay(int cjpay) {
		this.cjpay = cjpay;
	}
	public String getCjfs() {
		return cjfs;
	}
	public void setCjfs(String cjfs) {
		this.cjfs = cjfs;
	}
}
