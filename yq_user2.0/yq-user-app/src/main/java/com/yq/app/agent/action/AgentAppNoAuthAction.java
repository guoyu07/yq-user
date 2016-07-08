package com.yq.app.agent.action;

import java.util.HashMap;
import java.util.Map;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.agent.service.AgentService;

public class AgentAppNoAuthAction extends JsonBaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String appId;
	private String user;
	private String passWord;
	/**
	 * 加密登录接口
	 * @return
	 */
	public String login(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
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
	public String addScores(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		agentService.addScores(appId, orderUserName, amount,param, sign);
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
}
