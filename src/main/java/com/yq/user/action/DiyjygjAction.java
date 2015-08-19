package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.UserService;

public class DiyjygjAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int sgid;
	
	private int status;
	
	private String pa3;
	
	private double jygj;
	
	private Gpjy gpjy;
	
	public String execute(){
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gpjy = userService.getGpjyPage(sgid);
		
		if(status==1){
			userService.editGpjy(super.getUserName(), sgid, jygj, pa3);
			super.setErroCodeNum(2000);
		}
		
		return SUCCESS;
	}

	public int getSgid() {
		return sgid;
	}

	public void setSgid(int sgid) {
		this.sgid = sgid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPa3() {
		return pa3;
	}

	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}

	public Gpjy getGpjy() {
		return gpjy;
	}

	public void setGpjy(Gpjy gpjy) {
		this.gpjy = gpjy;
	}

	public double getJygj() {
		return jygj;
	}

	public void setJygj(double jygj) {
		this.jygj = jygj;
	}

}
