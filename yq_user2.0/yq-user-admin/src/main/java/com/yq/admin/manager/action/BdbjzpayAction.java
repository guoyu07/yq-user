package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class BdbjzpayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int status;
	
	private String jcname;
	private String syuser;
	private int jzpay;
	private String uid;
	private Gcuser gcuser;
	private String oppass;
	private int remark;
	
	public String execute(){
		if(status==0){
			return INPUT;
		}
		UserService userService  = ServiceCacheFactory.getService(UserService.class);
		userService.trasferBdbByAdmin(jcname, syuser, jzpay, oppass,remark, super.getUserName());
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	
	public String bdbpay(){
        /*if(!super.getUserName().equals("admin1")){
            return INPUT;
        }*/
		UserService userService  = ServiceCacheFactory.getService(UserService.class);
		if(status==0){
			gcuser = userService.getUserByUserName(uid);
			return INPUT;
		}
		userService.addBdbByAdmin(syuser, jzpay);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.CHANGE_BDB, "給用戶:"+syuser+",報單幣数量："+jzpay);
		userService.addAdminOperateLog(log);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getJcname() {
		return jcname;
	}


	public void setJcname(String jcname) {
		this.jcname = jcname;
	}


	public String getSyuser() {
		return syuser;
	}


	public void setSyuser(String syuser) {
		this.syuser = syuser;
	}


	public int getJzpay() {
		return jzpay;
	}


	public void setJzpay(int jzpay) {
		this.jzpay = jzpay;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public Gcuser getGcuser() {
		return gcuser;
	}


	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}


	public String getOppass() {
		return oppass;
	}


	public void setOppass(String oppass) {
		this.oppass = oppass;
	}


	public int getRemark() {
		return remark;
	}


	public void setRemark(int remark) {
		this.remark = remark;
	}

}
