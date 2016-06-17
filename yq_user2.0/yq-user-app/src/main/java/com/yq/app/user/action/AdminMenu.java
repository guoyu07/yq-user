package com.yq.app.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.NotAllowedCode;
import com.yq.common.ProblemCode;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Sgxt;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.SgxtDao;
import com.yq.user.service.UserService;

public class AdminMenu extends ALDAdminActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private double fbpay;
	
	private double mqfh;
	
	private double ajygj;
	
	private int fdpay;
	
	private Gcuser gcuser;
	
	public String execute(){
		@NotAllowedCode
		SgxtDao sgxDao = ServiceCacheFactory.getServiceCache().getService(SgxtDao.class);
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		gcuser = userService.getUserByUserName(super.getUserName());
		
		Sgxt sgxt = sgxDao.get(super.getUserName());
		if(sgxt!=null){
			if(sgxt.getFhbl()==0.005){
				fbpay=0.5;
			}else if(sgxt.getFhbl()==0.01){
				fbpay = 1;
			}
			mqfh = sgxt.getMqfh();
		}
		@NotAllowedCode
		FcxtDao fcxtDao = ServiceCacheFactory.getServiceCache().getService(FcxtDao.class);
		Fcxt fcxt = fcxtDao.get(2);
		if(fcxt!=null){
			ajygj = fcxt.getJygj();
		}
		
		
		@NotAllowedCode
		@ProblemCode //此处是一个批量更新数据的地方 不知道啥意思，所以有问题
//		GpjyDao gpjyDao = ServiceCacheFactory.getServiceCache().getService(GpjyDao.class);
//		gpjyDao.update();
		
		
		
		int asjb = gcuser.getSjb();
		if( asjb==1 ){
			 fdpay=2000;
		}else if( asjb==2){
			 fdpay=4000;
		}else if( asjb==4){
			fdpay=8000;
		}else if( asjb==10){
			fdpay=20000;
		}else if( asjb==20){
			fdpay=40000;
		}else if( asjb==40){
			fdpay=80000;
		}else if( asjb==100){
			fdpay=200000;
		}
 
		
		return SUCCESS;
	}

	public Gcuser getGcuser() {
		return gcuser;
	}

	public double getFbpay() {
		return fbpay;
	}

	public void setFbpay(double fbpay) {
		this.fbpay = fbpay;
	}

	public double getMqfh() {
		return mqfh;
	}

	public void setMqfh(double mqfh) {
		this.mqfh = mqfh;
	}

	public double getAjygj() {
		return ajygj;
	}

	public void setAjygj(double ajygj) {
		this.ajygj = ajygj;
	}

	public int getFdpay() {
		return fdpay;
	}

	public void setFdpay(int fdpay) {
		this.fdpay = fdpay;
	}
	
}
