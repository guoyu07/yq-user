package com.yq.user.action;

import java.util.Date;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.MD5Security;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class YbShopPayAction extends ALDAdminActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int yb;
	private String gwuser;
	private String gwno;
	private String gwid;
	private int status;
	private int ybsl;
	private int fee;
	
	private Gcuser gcuser;
	
	public String hgyb(){
		ybsl=(int)(yb*1.02);
		fee = (int)(yb*0.02);
		if(!super.getUserName().equals(gwuser)){
			super.setErroCodeNum(1);//alert('Hello, this order is not the current logged-on user names submitted, please log in again, thank you!');
		}
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		
		gcuser = userService.getUserByUserName(gwuser);
		if(gcuser.getPay()<1 || gcuser.getPay()<ybsl){
			super.setErroCodeNum(2);//alert('Hello, less than one currency "&ybsl&"，Temporarily unable to redeem, thank you!');
		}
		
		Datepay datepay = userService.getHgybOrder(super.getUserName(), "换购-"+gwno);
		if(datepay!=null){
			super.setErroCodeNum(3);//alert('该订单号已支付完成，请不要重要操作！');
		}
		return SUCCESS;
	}
	
	private String hgcode;
	private String pa3;
	public String hgybok(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.hgybOk(super.getUserName(), ybsl, fee, gwuser, hgcode, pa3, gwno, gwid);
		super.setErroCodeNum(2000);
		return SUCCESS;
	}
	
	private String sjuser;
	public String hgybsh(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		userService.hgybSh(ybsl, fee, sjuser, gwno, gwid);
		super.setErroCodeNum(2001);
		return SUCCESS;
	}
	
	private int gwpay;
	private String pa01;
	private int pid;
	private String ybf;
	private String user;
	private String order;
	private String pa02;
	
	private String title;
	private String sid;
	private String sn;
	
	/**
	 * 新商城支付通道
	 * @return
	 */
	public String ybpay(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		ybsl = (int)(gwpay*1.02);
		fee =  (int)(gwpay*0.02);
		String paylb;
		if(pid==1){
			 paylb="购物-"+order;
			 title="来自一币商城的订单";
		}	else{
			   paylb="充值-"+order;
			   title="来自一币商城的充值";
		}
		if(Strings.isNullOrEmpty(ybf)){
			Datepay datepay = userService.getHgybOrder(super.getUserName(), paylb);
			if(datepay!=null){
				super.setErroCodeNum(1);//alert('该订单号已支付完成，请不要重要操作！');
			}
		}else{
			userService.ybpay(gwpay,pa01, pid, ybf, user, order,  pa02, hgcode);
			if(pid==1){
				super.setErroCodeNum(2000);
			}else if(pid==2){
				super.setErroCodeNum(2001);
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 机票支付通道
	 * @return
	 */
	private int day;
	public String kypwe(){
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		ybsl = (int)(gwpay*1.02);
		fee =  (int)(gwpay*0.02);
		String paylb;
		if(pid==1){
			 paylb="票务支付-"+order;
			 title="来自科宇票务的订单";
		}	else{
			   paylb="票务充值-"+order;
			   title="来自科宇票务的充值";
		}
		if(Strings.isNullOrEmpty(ybf)){
			Datepay datepay = userService.getHgybOrder(super.getUserName(), paylb);
			if(datepay!=null){
				super.setErroCodeNum(1);//alert('该订单号已支付完成，请不要重要操作！');
			}
		}else{
			Gcuser gcuser = userService.getUserByUserName(user);
			if(gcuser.getPwdate()!=null){
				day = DateUtils.getIntervalDays(gcuser.getPwdate(), new Date());
			}
			userService.kypwe(gwpay,pa01, pid, ybf, user, order,  pa02, hgcode);
			sn=MD5Security.md5_16(order+"$#85546875#@$#%"+gwpay);
			if(pid==1){
				super.setErroCodeNum(2000);
			}else if(pid==2){
				super.setErroCodeNum(2001);
			}
		}
		return SUCCESS;
	}
	
	
	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Gcuser getGcuser() {
		return gcuser;
	}

	public void setGcuser(Gcuser gcuser) {
		this.gcuser = gcuser;
	}

	public int getYb() {
		return yb;
	}

	public void setYb(int yb) {
		this.yb = yb;
	}

	public String getGwuser() {
		return gwuser;
	}

	public void setGwuser(String gwuser) {
		this.gwuser = gwuser;
	}

	public String getGwno() {
		return gwno;
	}

	public void setGwno(String gwno) {
		this.gwno = gwno;
	}

	public String getGwid() {
		return gwid;
	}

	public void setGwid(String gwid) {
		this.gwid = gwid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getYbsl() {
		return ybsl;
	}

	public void setYbsl(int ybsl) {
		this.ybsl = ybsl;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getHgcode() {
		return hgcode;
	}
	public void setHgcode(String hgcode) {
		this.hgcode = hgcode;
	}
	public String getPa3() {
		return pa3;
	}
	public void setPa3(String pa3) {
		this.pa3 = pa3;
	}
	public String getSjuser() {
		return sjuser;
	}
	public void setSjuser(String sjuser) {
		this.sjuser = sjuser;
	}
	public int getGwpay() {
		return gwpay;
	}
	public void setGwpay(int gwpay) {
		this.gwpay = gwpay;
	}
	public String getPa01() {
		return pa01;
	}
	public void setPa01(String pa01) {
		this.pa01 = pa01;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getYbf() {
		return ybf;
	}
	public void setYbf(String ybf) {
		this.ybf = ybf;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getPa02() {
		return pa02;
	}
	public void setPa02(String pa02) {
		this.pa02 = pa02;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
}
