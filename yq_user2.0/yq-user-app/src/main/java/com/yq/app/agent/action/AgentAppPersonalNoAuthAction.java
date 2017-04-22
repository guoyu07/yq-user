package com.yq.app.agent.action;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.module.web.action.JsonBaseActionSupport;
import com.yq.agent.bean.PointChangeDetail;
import com.yq.agent.bean.PointChangeInfo;
import com.yq.agent.bean.SameAccount;
import com.yq.agent.bean.UserPersonalInfoBean;
import com.yq.agent.bean.UserPointSplitDetail;
import com.yq.agent.service.AgentService;
import com.yq.user.bo.Gcuser;
import com.yq.user.service.UserService;

public class AgentAppPersonalNoAuthAction extends JsonBaseActionSupport{

	private static final long serialVersionUID = 1L;
	
	
	private String appId;
	private String user;
	private String passWord;	  	//登录密码
	private String secondPassWord;	//二级密码
	private String param;
	private String sign;
	private String data;//第三方数据包
	private String rsaKey;
	
	
	public String userPersonalInfo(){//新方法
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		param=treeMap.get("param");
		sign=treeMap.get("sign");
		return this.renderObjectResult(UserPersonalInfoBean.getUserPersonalInfoBeanByGcuser(agentService.getUserInfo(appId, user,param,sign)));
	}

	
	public String pointChangeinfo(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		param=treeMap.get("param");
		sign=treeMap.get("sign");
		return this.renderObjectResult(PointChangeInfo.getPointChangeInfo(agentService.getPointsChangeLog(appId, param, sign)));
	}

	
	private int currentPage;
	private int pageSize;
	public String getSameUserPersonalInfo(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		currentPage=Integer.parseInt(treeMap.get("currentPage"));
		pageSize=Integer.parseInt(treeMap.get("pageSize"));
		return this.renderPageResult(SameAccount.getPageSameUserPersonalInfo(agentService.getSameUserInfo(user,currentPage, pageSize)));
	}
	
	
	public String userPointChangeDetail(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		currentPage=Integer.parseInt(treeMap.get("currentPage"));
		pageSize=Integer.parseInt(treeMap.get("pageSize"));
		return this.renderPageResult(PointChangeDetail.getPointChangeDetail(agentService.getPointDetail(user,currentPage, pageSize)));
	}
	
	
	public String userPointSplitDetail(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		currentPage=Integer.parseInt(treeMap.get("currentPage"));
		pageSize=Integer.parseInt(treeMap.get("pageSize"));
		return this.renderPageResult(UserPointSplitDetail.getPointSplitDetail(agentService.getUserPointSplitDetail(user,currentPage, pageSize)));
		
	}
	
	public String getSameUserTotalWealth(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		return this.renderObjectResult(agentService.getSameAccountWealth(user));
	}
	
	
	private String oldPayPassword;
	private String payPassword;
	private int state;
	private String call;
	private String smsCode; 		//手机验证码
	/*设置或者支付密码*/
	public String setPayPassword(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		payPassword=treeMap.get("payPassword");
		call=treeMap.get("call");
		passWord=treeMap.get("passWord");
		secondPassWord=treeMap.get("secondPassWord");
		oldPayPassword=treeMap.get("oldPayPassword");
		user=treeMap.get("user");
		smsCode=treeMap.get("smsCode");
		state=Integer.parseInt(treeMap.get("state"));
		sign=treeMap.get("sign");
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		if(state==1){
			Gcuser gcuser = userService.getUserByUserName(user);
			if(gcuser==null){
				throw new ServiceException(1, "用户名不存在！");
			}
			agentService.checkParam(user, passWord, secondPassWord, call, state);
			int callLenght = gcuser.getCall().length();
			String callLeft = gcuser.getCall().substring(0, 3);
			String CallRight = gcuser.getCall().substring(callLenght-3, callLenght);
			String callNumber=callLeft+"*****"+CallRight;
			result.put("callNumber", callNumber);
			return renderObjectResult(result);
		}
		if(state==2){
			agentService.checkParam(user, passWord, secondPassWord, call, state);
			userService.sendSmsMsg(user,15);//发送验证码
			Gcuser gcuser = userService.getUserByUserName(user);
			result.put("callNumber", gcuser.getCall());
			result.put("smsCode", gcuser.getVipsq());
			return renderObjectResult(result);
		}
		if(state==3){
			agentService.checkParam(user, passWord, secondPassWord, call, state);
			result.put("info", agentService.setPayPassword(appId, user,payPassword, smsCode, call, sign, passWord, secondPassWord,param));
			return renderObjectResult(result);
		}
		if(state==4){
			agentService.checkParam(user, passWord, secondPassWord, call, state);
			result.put("info", agentService.updatePayPassword(appId, user,payPassword, oldPayPassword, smsCode, call, sign, passWord, secondPassWord,param));
			return renderObjectResult(result);
		}
        return renderObjectResult(result);
	}
	private String token;
	public String bindPayPassword(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		payPassword=treeMap.get("payPassword");
		token=treeMap.get("token");
		call=treeMap.get("call");
		sign=treeMap.get("sign");
		passWord=treeMap.get("passWord");
		secondPassWord=treeMap.get("secondPassWord");
		param=treeMap.get("param");
		result.put("info", agentService.bindPayPassword(appId, user,payPassword, token, call, sign, passWord, secondPassWord,param));
		return renderObjectResult(result);
	}
	
	public String queryOder(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		productOrder=treeMap.get("productOrder");
		param=treeMap.get("param");
		result.put("info", agentService.queryTrasactionOder( appId,  productOrder,  param, sign));
		return renderObjectResult(result);
	}
	
	public String getUserPaypassword(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		user=treeMap.get("user");
		result.put("flag", agentService.getUserPaypassword(user));
		return renderObjectResult(result);
	}
	
	
	
	private String fromUserName;
	private String amount;
	private String productDesc;
	private String toUserName;
	private String productOrder;
	/**
	 * 转账
	 * @return
	 */
	public String transactionPay(){
		Map<String,String> result = new HashMap<String,String>();
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		fromUserName=treeMap.get("fromUserName");
		toUserName=treeMap.get("toUserName");
		amount=treeMap.get("amount");
		productOrder=treeMap.get("productOrder");
		productDesc=treeMap.get("productDesc");
		payPassword=treeMap.get("payPassword");
		param=treeMap.get("param");
		result.put("info", agentService.transactionPay(appId, fromUserName, toUserName, amount, productOrder, productDesc, param, sign, payPassword));
		return renderObjectResult(result);
	}
	
	public String getAllUsername(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		param=treeMap.get("param");
		return renderObjectResult(agentService.getUserNameList(user));
	}
	
	
	public String getUserByUsername(){
		AgentService agentService = ServiceCacheFactory.getService(AgentService.class);
		TreeMap<String, String> treeMap = agentService.analysisData(appId,data,rsaKey);
		appId=treeMap.get("appId");
		user=treeMap.get("user");
		param=treeMap.get("param");
		return this.renderObjectResult(UserPersonalInfoBean.getUserPersonalInfoBeanByGcuser(agentService.getUserName(user)));
	}
	
	/**
	 * TODO 积分拆分前单价
	 * @return
	 */
	public String pointSplitBeforPrice(){
		return amount;
		
	}
	
	public String getFromUserName() {
		return fromUserName;
	}


	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
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


	public String getToUserName() {
		return toUserName;
	}


	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}


	public String getOldPayPassword() {
		return oldPayPassword;
	}


	public void setOldPayPassword(String oldPayPassword) {
		this.oldPayPassword = oldPayPassword;
	}


	public String getPayPassword() {
		return payPassword;
	}


	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}


	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public String getCall() {
		return call;
	}


	public void setCall(String call) {
		this.call = call;
	}


	public String getSmsCode() {
		return smsCode;
	}


	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
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


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}


	public String getSecondPassWord() {
		return secondPassWord;
	}


	public void setSecondPassWord(String secondPassWord) {
		this.secondPassWord = secondPassWord;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public String getData() {
		return data;
	}


	public void setData(String data) {
		this.data = data;
	}
	
	
	
	
}
