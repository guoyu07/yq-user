package com.yq.admin.manager.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.service.AdminService;

/**
 * @author 作者: HuHua
 * @version 2016年12月8日
 * 类说明  后台自动积分买入
 */
public class AutoJfBuyAction extends ALDAdminActionSupport{

	
	private static final long serialVersionUID = 1L;
	//查询的结果  一共需要处理多少条
	private int needNum;
	//查询结果  当前已处理到了多少条
	private int currentNum;
	//数量
	private int num;
	//操作密码
	private String oppa;
	private int status;
	
	public String dealJfMcByAdmin(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(status==0){
			return SUCCESS;
		}
		/*if(!super.getUserName().equals("admin1")){
			return SUCCESS;
		}*/
		if(!AdminService.mcdealJfLock.get()){
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
						adminService.dealJfMcOrder(num);
		 			}
		 		}).start();
		}else{
			
		}
		 needNum = AdminService.mcneedDealNum;
		 currentNum = AdminService.mccurrentNum;
		super.setErroCodeNum(2001);
		AdminOperateLog log= new AdminOperateLog(super.getUserName(),"", new Date(), AdminGlobal.AUTO_JB_SALE, "自動賣出數："+num);
		adminService.addAdminOperateLog(log);
		return SUCCESS;
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
	public String getOppa() {
		return oppa;
	}
	public void setOppa(String oppa) {
		this.oppa = oppa;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}
