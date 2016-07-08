package com.yq.agent.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.module.utils.JedisUtils;
import com.sr178.module.utils.MD5Security;
import com.sr178.module.web.session.Session;
import com.yq.agent.bo.AgentApp;
import com.yq.agent.bo.AgentOrder;
import com.yq.agent.bo.AgentScoresChangeLog;
import com.yq.agent.bo.AgentUser;
import com.yq.agent.constant.AgentScoresChangeType;
import com.yq.agent.dao.AgentAppDao;
import com.yq.agent.dao.AgentOrderDao;
import com.yq.agent.dao.AgentScoresChangeLogDao;
import com.yq.agent.dao.AgentUserDao;
import com.yq.app.utils.MacShaUtils;
import com.yq.common.utils.ParamCheck;
import com.yq.common.utils.UrlRequestUtils;
import com.yq.common.utils.UrlRequestUtils.Mode;
import com.yq.user.bean.CallBackMsgBean;
import com.yq.user.bo.Gcuser;
import com.yq.user.constant.ScoresChangeType;
import com.yq.user.constant.YbChangeType;
import com.yq.user.dao.GcuserDao;
import com.yq.user.scheduler.SendChargeMsgScheduler;
import com.yq.user.service.UserService;

public class AgentService {

	@Autowired
	private GcuserDao gcuserDao;
	@Autowired
	private AgentAppDao agentAppDao;
	@Autowired
	private AgentOrderDao agentOrderDao;
	@Autowired
	private UserService userService;
	@Autowired
	private AgentUserDao agentUserDao;
	@Autowired
	private AgentScoresChangeLogDao agentScoresChangeLogDao;
	
	
  	private static final String AGENT_APP_SESSION_CACHE_PRE = "agent_app_session_";
  	private static final int SESSION_EXPERI_SECONDS = 24*3600;
  	
  	public String generatorCacheKey(String sessionId){
  		return AGENT_APP_SESSION_CACHE_PRE+sessionId;
  	}
  	
  	public Session getSession(String sessionId){
    	String key = generatorCacheKey(sessionId);
    	return JedisUtils.getObject(key, Session.class);
    }
    
    public void setSession(String sessionId,Session session){
    	String key = generatorCacheKey(sessionId);
    	JedisUtils.setObject(key, session);
    	JedisUtils.expireKey(key, SESSION_EXPERI_SECONDS);
    }
    
    public void delSession(String sessionId){
    	String key = generatorCacheKey(sessionId);
    	JedisUtils.delete(key);
    }
	/**
	 * 查看是否登录了
	 * 
	 * @param sessionId
	 * @return
	 */
	public String isLogin(String tokenId) {
		if (tokenId == null || "".equals(tokenId)) {
			return null;
		}
		Session appSession = getSession(tokenId);
		if(appSession!=null){
			return appSession.getUserName();
		}
		return null;
	}
	/**
	 * 登录
	 * 
	 * @param userName
	 * @param passWord
	 */
	public String login(String userName, String passWord,String appId) {
		ParamCheck.checkString(userName, 1, "用户名不能为空");
		ParamCheck.checkString(passWord, 2, "密码不能为空");
		Gcuser gcUser = gcuserDao.getUser(userName);
		//查询app信息
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(3, "无效的appid");
		}
		//登录成功
		if(gcUser!=null){
			if(gcUser.getPassword().equals(passWord)){
				String tokenId = UUID.randomUUID().toString();
				Session appSession = new Session(userName, System.currentTimeMillis(), tokenId);
				setSession(tokenId, appSession);
				return tokenId;
			}else{
				throw new ServiceException(4, "用户名或密码错误！");
			}
		}else{
			throw new ServiceException(4, "用户名或密码错误！");
		}
	}
	
	/**
	 * 创建订单
	 * @param appId
	 * @param orderUserName
	 * @param amount
	 * @param productOrder
	 * @param productDesc
	 * @param param
	 * @param sign
	 */
	public int creatOrder(String appId, String orderUserName, String amount, String productOrder, String productDesc, String param, String sign){
		ParamCheck.checkString(orderUserName, 1, "用户名不能为空");
		ParamCheck.checkString(amount, 2, "订单金额不能为空");
		ParamCheck.checkString(productOrder, 3, "商户订单号不能为空");
		ParamCheck.checkString(productDesc, 4, "商品名称不能为空不能为空");
		ParamCheck.checkString(sign, 5, "前民更不能为空");
		if(param==null){
			param = "";
		}
		Gcuser gcuser = gcuserDao.getUser(orderUserName);
		if(gcuser==null){
			throw new ServiceException(6, "用户名不存在！");
		}
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appid");
		}
		if(amount.indexOf(".")!=-1){
			throw new ServiceException(8, "金额必须是正整数！");
		}
		int yb = 0;
		try {
			yb = Integer.valueOf(amount);
		} catch (Exception e) {
			throw new ServiceException(8, "金额必须是正整数！");
		}
		if(yb<=0){
			throw new ServiceException(8, "金额必须是正整数！");
		}
		String signStr = appId+orderUserName+amount+productOrder+productDesc+param;
		String mySign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为["+signStr+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		
		AgentOrder agentOrder = new AgentOrder();
		agentOrder.setAmount(yb);
		agentOrder.setAppId(appId);
		agentOrder.setCreatedTime(new Date());
		agentOrder.setOrderUserName(orderUserName.trim());
		agentOrder.setParam(param);
		agentOrder.setProductDesc(productDesc.trim());
		agentOrder.setProductOrder(productOrder.trim());
		agentOrder.setStatus(AgentOrder.ST_CTREATE);
		agentOrder.setCallBackStatus(AgentOrder.ST_CTREATE);
		int orderId = agentOrderDao.addBackKey(agentOrder);
		return orderId;
	}
	
	
	/**
	 * 创建订单
	 * @param appId
	 * @param orderUserName
	 * @param amount
	 * @param productOrder
	 * @param productDesc
	 * @param param
	 * @param sign
	 */
	@Transactional
	public void addScores(String orderId,String appId, String orderUserName, String amount ,String param, String sign){
		ParamCheck.checkString(orderUserName, 1, "用户名不能为空");
		ParamCheck.checkString(amount, 2, "订单金额不能为空");
		ParamCheck.checkString(orderId, 10, "订单号不能为空");
		ParamCheck.checkString(sign, 3, "签名更不能为空");
		if(param==null){
			param = "";
		}
		Gcuser gcuser = gcuserDao.getUser(orderUserName);
		if(gcuser==null){
			throw new ServiceException(4, "用户名不存在！");
		}
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(5, "无效的appid");
		}
		if(amount.indexOf(".")!=-1){
			throw new ServiceException(6, "金额必须是正整数！");
		}
		int scores = 0;
		try {
			scores = Integer.valueOf(amount);
		} catch (Exception e) {
			throw new ServiceException(6, "金额必须是正整数！");
		}
		if(scores<=0){
			throw new ServiceException(6, "金额必须是正整数！");
		}
		String signStr = appId+orderUserName+amount+param+orderId;
		String mySign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为["+signStr+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(7, "签名不正确！");
		}
		
		AgentUser agentUser = agentUserDao.get(new SqlParamBean("id", agentApp.getAgentId()));
		if(agentUser==null){
			throw new ServiceException(8, "数据错误！appid--》"+appId+"对应的agentId不存在"+agentApp.getAgentId());
		}
		if(agentUser.getAgentScores()<scores){
			throw new ServiceException(9,"商户购物券不足！");
		}
		//订单号重复检查
		AgentScoresChangeLog changeLog = agentScoresChangeLogDao.get(new SqlParamBean("app_id", appId),new SqlParamBean("and", "order_id", orderId));
		if(changeLog!=null){
			throw new ServiceException(11,"该订单已处理！");
		}
		//给商户减购物券
		trasferScores(agentUser.getAgentName(), orderUserName, scores, agentUser.getAgentScores()-scores, param, AgentScoresChangeType.ADD_TO_USER, appId,orderId);
	}
	
	@Transactional
	private void trasferScores(String fromAgentName,String toUserName,int amount,int nowNum,String param,int changeType,String appId,String orderId){
		if(agentUserDao.reduceScore(fromAgentName, amount)){
			AgentScoresChangeLog changeLog = new AgentScoresChangeLog(fromAgentName, toUserName, appId, changeType, -amount, nowNum, param, new Date());
			changeLog.setOrderId(orderId);
			agentScoresChangeLogDao.add(changeLog);
		}else{
			throw new ServiceException(9,"商户购物券不足！");
		}
		//给目标用户加购物券
		if(!userService.changeScores(toUserName, amount, ScoresChangeType.APP_ADD, 0, fromAgentName, appId)){
			throw new ServiceException(4,"用户不存在");
		}
	}
	
	public static void main(String[] args) {
		System.out.println("");
	}
	
	/**
	 * 支付订单
	 * @param payUserName
	 * @param password
	 * @param password3
	 * @param orderId
	 */
	@Transactional
	public Map<String,String> payOrder(String payUserName,String password,String password3,int orderId){
		ParamCheck.checkString(payUserName, 1, "用户名不能为空");
		ParamCheck.checkString(password, 2, "登录密码不能为空");
		ParamCheck.checkString(password3, 3, "二级密码不能为空");
		
		AgentOrder agentOrder = agentOrderDao.get(new SqlParamBean("id", orderId));
		if(agentOrder==null||agentOrder.getStatus()!=AgentOrder.ST_CTREATE){
			throw new ServiceException(4, "订单不存在或该订单已失效！");
		}
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", agentOrder.getAppId()));
		Gcuser gcuser = gcuserDao.getUser(payUserName);
		if(gcuser==null){
			throw new ServiceException(5, "用户名不存在！");
		}
		if (!password.equals(gcuser.getPassword())) {
			throw new ServiceException(6, "登录密码错误！");
		}
		if (!password3.equals(MD5Security.md5_16_Small(gcuser.getPassword3()))) {
			throw new ServiceException(7, "二级密码错误！");
		}
		//支付指定的yb
		boolean result = userService.changeYb(payUserName, -agentOrder.getAmount(),orderId+"-"+agentOrder.getProductDesc(), YbChangeType.AGENT_REDUCE, null, 0);
		if(result){
			if(!agentOrderDao.updateStatusToSuccess(orderId, payUserName.trim(), new Date())){
				throw new ServiceException(4, "订单不存在或该订单已失效！");
			}else{
				Map<String,String> paramMap = new HashMap<String,String>();
				paramMap.put("payUserName", payUserName.trim());
				paramMap.put("amount", agentOrder.getAmount()+"");
				paramMap.put("productOrder", agentOrder.getProductOrder());
				paramMap.put("order", orderId+"");
				paramMap.put("param", agentOrder.getParam());
				String signStr = payUserName+agentOrder.getAmount()+agentOrder.getProductOrder()+orderId+agentOrder.getParam();
				String sign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey());
				paramMap.put("sign", sign);
				LogSystem.info("开启第三方商户支付回调，回调签名字符串为["+signStr+"],key为["+agentApp.getAppKey()+"],签名为["+sign+"]");
				//回调
				if(!Strings.isNullOrEmpty(agentApp.getCallBackUrl())){
					String url = agentApp.getCallBackUrl();
					callBackToAgent(url, paramMap);
				}
				return paramMap;
			}
		}else{
			throw new ServiceException(8, "账户金额不足！");
		}
		
		
	}
	
	private static final String SUCCESS_TAG = "success";
	private void callBackToAgent(String url,Map<String,String> paramMap) {
		String callBackUrl = url;
		CallBackMsgBean callbackMsg = new CallBackMsgBean(callBackUrl, paramMap, Mode.POST, SUCCESS_TAG) {
			@Override
			public void afterSuccess() {
				agentOrderDao.updateCallBackStatusToSuccess(Integer.valueOf(this.getParamMap().get("order")), new Date());
			}
			@Override
			public void afterLoseEffect() {
				
			}
			@Override
			public void afterFail() {
				
			}
		};
		try {
			String result = UrlRequestUtils.execute(callBackUrl, paramMap, Mode.POST);
			LogSystem.log("第三方回调请求地址:" + callBackUrl + ",result=" + result);
			if (SUCCESS_TAG.equals(result)) {
				callbackMsg.afterSuccess();
				LogSystem.info("成功！");
			}else{
				SendChargeMsgScheduler.addMsg(callbackMsg);
			}
		} catch (Exception e) {
			LogSystem.error(e, "第三方回调失败！");
			//放到队列中进行处理
			SendChargeMsgScheduler.addMsg(callbackMsg);
		}
	}
}
