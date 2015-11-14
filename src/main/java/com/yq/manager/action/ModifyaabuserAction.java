package com.yq.manager.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class ModifyaabuserAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int status;
	private Gcuser gcuser;
	private String userid;
	
	private String password3;
	private String card;
	private String bank;
	private String name;
	private String call;
	private String email;
	private String qq;
	private String userid2;
	private Integer payok;
	private String jcname;
	private String jcuserid;
	private String password;
	private String pwdate;
	
	
	private Fcxt fcxt;
	
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		fcxt = adminService.getAdminUser(super.getUserName());
		if(status==0){
			UserService userService = ServiceCacheFactory.getService(UserService.class);
			gcuser = userService.getUserByUserName(userid);
			return INPUT;
		}
		adminService.updateUser(userid, password3, card, bank, name, call, email, qq, userid2, payok, jcname, jcuserid, password,pwdate,super.ip());
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Gcuser getGcuser() {
		return gcuser;
	}
	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword3() {
		return password3;
	}
	public void setPassword3(String password3) {
		this.password3 = password3;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getUserid2() {
		return userid2;
	}
	public void setUserid2(String userid2) {
		this.userid2 = userid2;
	}
	public String getJcname() {
		return jcname;
	}
	public void setJcname(String jcname) {
		this.jcname = jcname;
	}
	public String getJcuserid() {
		return jcuserid;
	}
	public void setJcuserid(String jcuserid) {
		this.jcuserid = jcuserid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getPayok() {
		return payok;
	}
	public void setPayok(Integer payok) {
		this.payok = payok;
	}
	public Fcxt getFcxt() {
		return fcxt;
	}
	public void setFcxt(Fcxt fcxt) {
		this.fcxt = fcxt;
	}
	public String getPwdate() {
		return pwdate;
	}
	public void setPwdate(String pwdate) {
		this.pwdate = pwdate;
	}
	
}
