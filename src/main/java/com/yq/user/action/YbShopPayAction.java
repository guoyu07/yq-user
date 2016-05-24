package com.yq.user.action;


import java.util.List;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminActionSupport;
import com.yq.common.utils.MD5Security;
import com.yq.common.utils.UrlRequestUtils;
import com.yq.common.utils.UrlRequestUtils.Mode;
import com.yq.user.bean.CallBackMsgBean;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.ShopBean;
import com.yq.user.scheduler.SendChargeMsgScheduler;
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
	
	private double gwpay;
	private String pa01;
	private int pid;
	private String ybf;
	private String user;
	private String order;
	private String pa02;
	
	private String title;
	private String sid;
	private String sn;
	private String btk;
	private String sign;
	
	/**
	 * 新商城支付通道
	 * @return
	 */
	private String url;
	
	private int allScores;
	private int feeScores;
	private String ybstr;
	private String resultstr;
	public String ybpay(){
		
		UserService userService = ServiceCacheFactory.getService(UserService.class);
		
		String paylb;
		
		if(pid==1){
			LogSystem.info("收到的客户端字符串"+ybstr);
			int scores = 0;
			 paylb="购物-"+order;
			 title="来自一币商城的订单";
			 if(UserService.isOpenScoresPay){
				 try {
					 String signStr = order+"yc$shop@Sfie68"+ybstr;
					 String mySign =  MD5Security.code(signStr,32).toLowerCase();
					 if(!sign.equals(mySign)){
						 LogSystem.warn("md5校验失败，收到的key=["+signStr+"],md5后的值为["+mySign+"],收到的sing=["+sign+"]");
						 super.setErroCodeNum(8);
						 return SUCCESS;
					 }
				} catch (Exception e) {
					 LogSystem.error(e, "md5加密失败");
					 super.setErroCodeNum(8);
					 return SUCCESS;
				}
				 
				 List<ShopBean> list = userService.countPay(ybstr);
				 gwpay = 0;
				 for(ShopBean shop:list){ 
					 gwpay += shop.getYbValue();
					 scores += shop.getScoresValue();
				 }
				 ybsl = (int)(gwpay*1.02);
				 fee =  (int)(gwpay*0.02);
				 allScores = (int)(scores*1.02);
			     feeScores = (int)(scores*0.02);
				 
				 if(!Strings.isNullOrEmpty(user)){
					 Gcuser gcuser = userService.getUserByUserName(user);
					  if(gcuser!=null){
							if(gcuser.getScores()<=0&&scores>0){
								 super.setErroCodeNum(9);
								 return SUCCESS;
							}
							if(gcuser.getScores()<allScores){
								ybsl += (allScores - gcuser.getScores());
								allScores = gcuser.getScores();
							}
						 }
				 }
				 
			}
			 
		}	else{
			   ybsl = (int)(gwpay*1.02);
			   fee =  (int)(gwpay*0.02);
			   paylb="充值-"+order;
			   title="来自一币商城的充值";
		}
		
		if(!Strings.isNullOrEmpty(user)){
			Datepay datepay = userService.getHgybOrder(user, paylb);
			if(datepay!=null){
				super.setErroCodeNum(1);//alert('该订单号已支付完成，请不要重要操作！');
				return SUCCESS;
			}
		}

		
		if(!Strings.isNullOrEmpty(ybf)){
			resultstr = userService.ybpay(ybsl,pa01, pid, ybf, user, order,  pa02, hgcode,allScores,ybstr);
			String callBackUrl = "";
			if(pid==1){
				sn=MD5Security.md5_16(order+"$@@$"+resultstr);
				LogSystem.info("返回的resultStr="+resultstr+"--sn="+sn+",order="+order);
//				LogSystem.info(url+"?act=payment&resultstr="+resultstr+"&op=returnyibi&sn="+sn+"&paycode=success&payamount="+gwpay+"&pid=1&order_sn="+order+"&&payuser="+user);
				callBackUrl = url+"?act=payment&resultstr="+resultstr+"&op=asyncreturnyibi&sn="+sn+"&paycode=success&payamount="+gwpay+"&pid=1&order_sn="+order+"&&payuser="+user;
				super.setErroCodeNum(2000);
			}else if(pid==2){
				sn=MD5Security.md5_16(order+"$@@$"+gwpay);
				callBackUrl = url + "?act=payment&op=asyncreturnyibi&sn="+sn+"&paycode=success&payamount="+gwpay+"&pid=2&order_sn="+order+"&&payuser="+user;
				super.setErroCodeNum(2001);
			}
//			callBackToServerShop(callBackUrl);
		}
		return SUCCESS;
	}
	
	/**
	 * 回调机票服务器
	 */
	private static final String SHOP_SUCCESS_TAG="success";
	private void callBackToServerShop(String url) {
		String callBackUrl = url;
		try {
			String result = UrlRequestUtils.execute(callBackUrl, null, Mode.GET);
			LogSystem.log("商城回调请求地址:" + callBackUrl + ",result=" + result);
			if (SHOP_SUCCESS_TAG.equals(result)) {
				LogSystem.info("成功！");
			}else{
				SendChargeMsgScheduler.addMsg(new CallBackMsgBean(callBackUrl, null, Mode.GET, SHOP_SUCCESS_TAG));
			}
		} catch (Exception e) {
			LogSystem.error(e, "商城回调失败！");
			//放到队列中进行处理
			SendChargeMsgScheduler.addMsg(new CallBackMsgBean(callBackUrl, null, Mode.GET, SHOP_SUCCESS_TAG));
		}
	}
	
	/**
	 * 机票支付通道
	 * @return
	 */
	private int day;
	private static final String KYPW_URL = "http://www.kypwb.com/interface/YiBiPayReturnNotify?act=payment&op=returnyibi&paycode=success";
	private static final String SUCCESS_TAG = "ok";
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
			Datepay datepay = userService.getHgybOrder(user, paylb);
			if(datepay!=null){
				super.setErroCodeNum(1);//alert('该订单号已支付完成，请不要重要操作！');
			}
		}else{
			Datepay datepay = userService.getHgybOrder(user, paylb);
			if(datepay!=null){
				super.setErroCodeNum(1);//alert('该订单号已支付完成，请不要重要操作！');
				return SUCCESS;
			}
//			Gcuser gcuser = userService.getUserByUserName(user);
//			if(gcuser.getPwdate()!=null){
//				day = DateUtils.getIntervalDays(gcuser.getPwdate(), new Date());
//			}
			userService.kypwe(gwpay,pa01, pid, ybf, user, order,  pa02, hgcode);
			sn=MD5Security.md5_16(order+"$#85546875#@$#%"+gwpay);
			
			if(pid==1){
				super.setErroCodeNum(2000);
				callBackToServerJP();
			}else if(pid==2){
				super.setErroCodeNum(2001);
				callBackToServerJP();
			}
		}
		return SUCCESS;
	}
	/**
	 * 回调机票服务器
	 */
	private void callBackToServerJP() {
		String callBackUrl = "";
		try {
			String payAmount = new java.text.DecimalFormat("#.00").format(gwpay);
			callBackUrl = KYPW_URL + "&sn=" + sn + "&payamount=" + payAmount + "&order_sn=" + order + "&payuser="
					+ user + "&pid=" + pid;
			String result = UrlRequestUtils.execute(callBackUrl, null, Mode.GET);
			LogSystem.log("机票支付回调请求地址:" + callBackUrl + ",result=" + result);
			if (SUCCESS_TAG.equals(result)) {
				LogSystem.info("成功！");
			}else{
				SendChargeMsgScheduler.addMsg(new CallBackMsgBean(callBackUrl, null, Mode.GET, SUCCESS_TAG));
			}
		} catch (Exception e) {
			LogSystem.error(e, "机票回调失败！");
			//放到队列中进行处理
			SendChargeMsgScheduler.addMsg(new CallBackMsgBean(callBackUrl, null, Mode.GET, SUCCESS_TAG));
		}
	}
	
	
	public String getResultstr() {
		return resultstr;
	}


	public void setResultstr(String resultstr) {
		this.resultstr = resultstr;
	}


	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getYbstr() {
		return ybstr;
	}


	public void setYbstr(String ybstr) {
		this.ybstr = ybstr;
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
	public double getGwpay() {
		return gwpay;
	}
	public void setGwpay(double gwpay) {
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


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getBtk() {
		return btk;
	}


	public void setBtk(String btk) {
		this.btk = btk;
	}


	public String getSign() {
		return sign;
	}
	public int getAllScores() {
		return allScores;
	}


	public void setAllScores(int allScores) {
		this.allScores = allScores;
	}


	public int getFeeScores() {
		return feeScores;
	}


	public void setFeeScores(int feeScores) {
		this.feeScores = feeScores;
	}


	public void setSign(String sign) {
		this.sign = sign;
	}
	
}
