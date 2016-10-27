package com.yq.app.agent.action;

import java.util.HashMap;
import java.util.Map;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.agent.service.AgentService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class AgentAppNoAuthAction extends JsonBaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String appId;
	private String user;
	private String passWord;	  	//登录密码
	private String secondPassWord;	//二级密码
	private String smsCode; 		//手机验证码
	private int state;				
	/**
	 * 加密登录接口
	 * @return
	 */
	public String login(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(state==1){
			Gcuser gcuser = userService.getUserByUserName(user);
			if(gcuser==null){
				throw new ServiceException(1, "用户名不存在！");
			}
			agentService.checkParam(user, passWord, secondPassWord);
			int callLenght = gcuser.getCall().length();
			String callLeft = gcuser.getCall().substring(0, 3);
			String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
			String callNumber=callLeft+"*****"+CallRight;
			result.put("callNumber", callNumber);
			return renderObjectResult(result);
		}
		if(state==2){
			agentService.checkParam(user, passWord, secondPassWord);
			userService.sendSmsMsg(user,14);//发送验证码
			Gcuser gcuser = userService.getUserByUserName(user);
			result.put("smsCodeSuccess", gcuser.getVipsq());
			return renderObjectResult(result);
		}
		if(state==3){
			agentService.checkParam(user, passWord, secondPassWord);
			result.put("resultCode", agentService.bindAccountCheck(user,passWord,secondPassWord,smsCode));
			return renderObjectResult(result);
		}
		result.put("tokenId", agentService.login(user, passWord,appId));
        return renderObjectResult(result);
	}
	/**
	 * 创建订单
	 */
    private String orderUserName;
	private String amount;
	private String productOrder;
	private String productDesc;
	private String param;
	private String sign;
	public String createOrder(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		return this.renderKeyValueResult("order", agentService.creatOrder(appId, orderUserName, amount, productOrder, productDesc, param, sign));
	}
	/**
	 * 支付订单
	 */
	private String passWord3;
	private int order; 
	public String payOrder(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
        return this.renderObjectResult(agentService.payOrder(user, passWord, passWord3, order));
	}
	/**
	 * 给商户加购物券
	 * @return
	 */
	private String orderId;
	public String addScores(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		agentService.addScores(orderId,appId, orderUserName, amount,param, sign);
		return this.renderSuccessResult();
	}
	
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getOrderUserName() {
		return orderUserName;
	}
	public void setOrderUserName(String orderUserName) {
		this.orderUserName = orderUserName;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getProductOrder() {
		return productOrder;
	}
	public void setProductOrder(String productOrder) {
		this.productOrder = productOrder;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getPassWord3() {
		return passWord3;
	}
	public void setPassWord3(String passWord3) {
		this.passWord3 = passWord3;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getSecondPassWord() {
		return secondPassWord;
	}

	public void setSecondPassWord(String secondPassWord) {
		this.secondPassWord = secondPassWord;
	}

	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	

	
	
}
