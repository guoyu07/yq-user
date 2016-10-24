package com.yq.admin.manager.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Tduser;

public class TduserAction extends ALDAdminPageActionSupport<Tduser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	private String cjpa;
	private String suser;
	private int sst;
	public String execute(){
		
		if(!Strings.isNullOrEmpty(cjpa)){
			checkPassword();
		}
		
		if(sst==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(!Strings.isNullOrEmpty(suser)){
			checkPassword();
			super.initPage(adminService.getTduserPageList(super.getToPage(), 20, suser));
		}
		return SUCCESS;
	}
	
	private Integer tdId;
	private Tduser tuser;
	public String search(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		tuser = adminService.getTduser(tdId);
		return SUCCESS;
	}
	
	private String tdname;
	private String tduserid;
	private String tduser;
	private String tdcall;
	private String tdqq;
	
	public String add(){
		checkPassword();
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addTduser(tdname, tduserid, tduser, tdcall, tdqq);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	public String edit(){
		checkPassword();
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.updateTduser(tdId, tdname, tduserid, tduser, tdcall, tdqq);
		super.setErroCodeNum(2001);
		return SUCCESS;
	}
	
	
	private String fromUserName;
	private String toUserName;
	public String transferUser(){
		checkPassword();
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.transferUserInfo(fromUserName, toUserName);
		super.setErroCodeNum(2002);
		return SUCCESS;
	}

	
	
	private void checkPassword(){
        if(!cjpa.equals("xfyc15th")){
			throw new ServiceException(100, "密码错误");
		}
	}

	public String getCjpa() {
		return cjpa;
	}

	public void setCjpa(String cjpa) {
		this.cjpa = cjpa;
	}

	public String getSuser() {
		return suser;
	}

	public void setSuser(String suser) {
		this.suser = suser;
	}

	public int getSst() {
		return sst;
	}

	public void setSst(int sst) {
		this.sst = sst;
	}

	public Integer getTdId() {
		return tdId;
	}

	public void setTdId(Integer tdId) {
		this.tdId = tdId;
	}

	public Tduser getTuser() {
		return tuser;
	}

	public void setTuser(Tduser tuser) {
		this.tuser = tuser;
	}

	public String getTdname() {
		return tdname;
	}

	public void setTdname(String tdname) {
		this.tdname = tdname;
	}

	public String getTduserid() {
		return tduserid;
	}

	public void setTduserid(String tduserid) {
		this.tduserid = tduserid;
	}

	public String getTduser() {
		return tduser;
	}

	public void setTduser(String tduser) {
		this.tduser = tduser;
	}

	public String getTdcall() {
		return tdcall;
	}

	public void setTdcall(String tdcall) {
		this.tdcall = tdcall;
	}

	public String getTdqq() {
		return tdqq;
	}

	public void setTdqq(String tdqq) {
		this.tdqq = tdqq;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getFromUserName() {
		return fromUserName;
	}

	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
}
