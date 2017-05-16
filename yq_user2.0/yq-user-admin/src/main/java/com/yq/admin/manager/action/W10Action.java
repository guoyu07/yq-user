package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.bo.W10Bean;
import com.yq.manager.service.AdminService;

public class W10Action extends ALDAdminPageActionSupport<W10Bean> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uid;
	private String uname;
	private String riqi;
	public String execute(){
       /* if(!super.getUserName().equals("admin1")&&!super.getUserName().equals("admin4")){
            return INPUT;
        }*/

		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
        super.initPage(adminService.getTxpayPage(super.getToPage(), 20,uid,uname,riqi));
		return SUCCESS;
	}
	
	private int payid;
	private int op;
	private int page;
	public String syusers(){
        /*if(!super.getUserName().equals("admin1")&&!super.getUserName().equals("admin4")){
            return INPUT;
        }*/

		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.syusers(payid, op);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.TXSH, "訂單:"+payid+",提現審核："+op);
		adminService.addAdminOperateLog(log);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	private String user;
	private int verify;
	public String setVerify(){
        /*if(!super.getUserName().equals("admin1")&&!super.getUserName().equals("admin4")){
            return INPUT;
        }
*/
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.setVerifile(user, verify);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.YB_MSH, "用戶："+user+"免審核："+verify);
		adminService.addAdminOperateLog(log);
		super.setErroCodeNum(2001);
		return SUCCESS;
	}
	
	private String resionMassage;	
	private int opstate;
	public String cancelOrder(){//管理员取消订单
		/*if(!super.getUserName().equals("admin1")&&!super.getUserName().equals("admin4")){
            return INPUT;
        }*/
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.cancleYbSale(super.getUserName(), payid, resionMassage, super.ip());
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.TXTH, "体现id："+payid+"，说明："+resionMassage);
		adminService.addAdminOperateLog(log);
		super.setErroCodeNum(2002);
		return SUCCESS;
	}
	
	public String resetOrder(){//重置订单
		/*if(!super.getUserName().equals("admin1")&&!super.getUserName().equals("admin4")){
            return INPUT;
        }*/
		AdminService adminService=ServiceCacheFactory.getService(AdminService.class);
		adminService.resetYbOrder(super.getUserName(), payid, opstate, super.ip());
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),super.getUserSession().getSessionId(), new Date(), AdminGlobal.RESET_YB_ORDER, "體現id："+payid);
		adminService.addAdminOperateLog(log);
		super.setErroCodeNum(2003);
		return SUCCESS;
	}
	
	
	public String getResionMassage() {
		return resionMassage;
	}

	public void setResionMassage(String resionMassage) {
		this.resionMassage = resionMassage;
	}

	public int getPayid() {
		return payid;
	}
	public void setPayid(int payid) {
		this.payid = payid;
	}
	public int getOp() {
		return op;
	}
	public void setOp(int op) {
		this.op = op;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRiqi() {
		return riqi;
	}
	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	public int getOpstate() {
		return opstate;
	}

	public void setOpstate(int opstate) {
		this.opstate = opstate;
	}
	
	
	
}
