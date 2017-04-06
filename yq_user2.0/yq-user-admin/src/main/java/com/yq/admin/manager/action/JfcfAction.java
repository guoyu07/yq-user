package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.service.AdminService;

public class JfcfAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String beishu;
	public String execute(){
		close = AdminService.isClose;
		beishu = AdminService.beishu;
		return SUCCESS;
	}
	private String date;
	public String dealJfMr(){
		final AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		new Thread(new Runnable() {
			@Override
			public void run() {
				adminService.dealJfMrOrderForChaiFen(date);
			}
		}).start();
		super.setErroCodeNum(2002);
		return SUCCESS;
	}
	//查询的结果  一共需要处理多少条
	private int needNum;
	//查询结果  当前已处理到了多少条
	private int currentNum;
	//数量
	private int num;
	//操作密码
	private String oppa;
	private int status;
	public String dealJfMrByAdmin(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(status==0){
			return SUCCESS;
		}
		/*if(!super.getUserName().equals("admin1")){
			return SUCCESS;
		}*/
		if(!AdminService.dealJfLock.get()){
			if(status==2){
				super.setErroCodeNum(2002);
				return SUCCESS;
			}
			if(oppa==null||!oppa.equals("ldkdkjjs9988")){
				super.setErroCodeNum(2000);
				return SUCCESS;
			}
			 new Thread(new Runnable() {
		 			@Override
		 			public void run() {
		 				AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		 				adminService.dealJfMrOrder(num);
		 			}
		 		}).start();
		}else{
			
		}
		needNum = AdminService.needDealNum;
		currentNum = AdminService.currentNum;
		super.setErroCodeNum(2001);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),"", new Date(), AdminGlobal.AUTO_JB_BUY, "自動買入數："+num);
		adminService.addAdminOperateLog(log);
		return SUCCESS;
	}
	
	public String chaifeng(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.JygChaifen();
		
		 super.setErroCodeNum(2000);
		return SUCCESS;
	}
    private boolean close;
	public String closeMrMcJf(){
		AdminService.isClose = close;
		super.setErroCodeNum(2003);
		return SUCCESS;
	}
	
     public String cfdm(){
    	final AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
    	 new Thread(new Runnable() {
 			@Override
 			public void run() {
 				adminService.jfdm();
 			}
 		}).start();
    	 
    	super.setErroCodeNum(2001);
		return SUCCESS;
	}
     
     
     public String resetcfb(){
    	final AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
    	 new Thread(new Runnable() {
 			@Override
 			public void run() {
 				adminService.resetCfb();
 			}
 		}).start();
    	 
    	super.setErroCodeNum(2001);
		return SUCCESS;
	}

	public boolean getClose() {
		return close;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setClose(boolean close) {
		this.close = close;
	}

	public int getNeedNum() {
		return needNum;
	}

	public void setNeedNum(int needNum) {
		this.needNum = needNum;
	}

	public int getCurrentNum() {
		return currentNum;
	}

	public void setCurrentNum(int currentNum) {
		this.currentNum = currentNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getOppa() {
		return oppa;
	}

	public void setOppa(String oppa) {
		this.oppa = oppa;
	}

	public String getBeishu() {
		return beishu;
	}
	
}
