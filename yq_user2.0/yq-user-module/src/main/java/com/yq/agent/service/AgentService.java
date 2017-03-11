package com.yq.agent.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.module.utils.JedisUtils;
import com.sr178.module.utils.MD5Security;
import com.sr178.module.web.session.Session;
import com.yq.agent.bean.SameAccountWealth;
import com.yq.agent.bo.AgentApp;
import com.yq.agent.bo.AgentOrder;
import com.yq.agent.bo.AgentScoresChangeLog;
import com.yq.agent.bo.AgentUser;
import com.yq.agent.bo.AppPayRecord;
import com.yq.agent.constant.AgentScoresChangeType;
import com.yq.agent.dao.AgentAppDao;
import com.yq.agent.dao.AgentGpjyDao;
import com.yq.agent.dao.AgentOrderDao;
import com.yq.agent.dao.AgentPointsChangeLogDao;
import com.yq.agent.dao.AgentScoresChangeLogDao;
import com.yq.agent.dao.AgentTxpayDao;
import com.yq.agent.dao.AgentUserDao;
import com.yq.agent.dao.AppPayRecordDao;
import com.yq.app.utils.MacShaUtils;
import com.yq.common.utils.Global;
import com.yq.common.utils.ParamCheck;
import com.yq.common.utils.UrlRequestUtils;
import com.yq.common.utils.UrlRequestUtils.Mode;
import com.yq.manager.bo.PointsChangeLog;
import com.yq.user.bean.CallBackMsgBean;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.SameUserProperty;
import com.yq.user.bo.UserProperty;
import com.yq.user.constant.ScoresChangeType;
import com.yq.user.constant.YbChangeType;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.SameUserPropertyDao;
import com.yq.user.dao.UserPropertyDao;
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
	
	@Autowired
	private AgentTxpayDao agentTxpayDao;
	@Autowired
	private AgentPointsChangeLogDao agentPointsChangeLogDao;
	@Autowired
	private AgentGpjyDao agentGpjyDao;
	
	@Autowired
	private SameUserPropertyDao sameUserPropertyDao;
	@Autowired
	private AppPayRecordDao appPayRecordDao;
	@Autowired
	private UserPropertyDao userPropertyDao;
	
	
	
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
	@Transactional
	public int creatOrder(String appId, String orderUserName, String amount, String productOrder, String productDesc, String param, String sign){
		ParamCheck.checkString(orderUserName, 1, "用户名不能为空");
		ParamCheck.checkString(amount, 2, "订单金额不能为空");
		ParamCheck.checkString(productOrder, 3, "商户订单号不能为空");
		ParamCheck.checkString(productDesc, 4, "商品名称不能为空不能为空");
		//ParamCheck.checkString(sign, 5, "签名不能为空");
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
		System.out.println("mySign="+mySign);
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
		if(!userService.changeScores(toUserName, amount, ScoresChangeType.APP_ADD, 0, fromAgentName, appId,"")){
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
		long l1=System.currentTimeMillis();
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
		boolean result = userService.changeYb(payUserName, -agentOrder.getAmount(),orderId+"-"+agentOrder.getProductDesc(), YbChangeType.AGENT_REDUCE, null, 0, YbChangeType.APPUSE);
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
				String sign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey()).trim();
				paramMap.put("sign", sign);
				LogSystem.info("开启第三方商户支付回调，回调签名字符串为["+signStr+"],key为["+agentApp.getAppKey()+"],签名为["+sign+"]");
				
				//回调
				if(!Strings.isNullOrEmpty(agentApp.getCallBackUrl())){
					String url = agentApp.getCallBackUrl();
					callBackToAgent(url, paramMap);
				}
				long l2=System.currentTimeMillis();
				System.out.println("************************finishTime="+(l2-l1));
				
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

	
	/**
	 * 
	 * 参数检测
	 * 
	 * @param userName 用户名
	 * 
	 * @param passWord 登录密码
	 *   
	 * @param secondPassWord 二级密码
	 * 
	 * @param call 手机号
	 * 
	 * @param step 步骤
	 */
	public void checkParam(String userName, String passWord, String secondPassWord, String call, int step) {
		Gcuser gcuser = userService.getUserByUserName(userName);
		if(gcuser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		Map<String, String> param= new HashMap<>();
		if(step==2){
			ParamCheck.checkString(call, 5, "手机号不能为空");
			param.put("call", call);
			if(!call.equals(gcuser.getCall())){
				throw new ServiceException(12, "输入的手机号与预留的手机号不匹配！");
			}
		}
		ParamCheck.checkString(userName, 7, "用户名不能为空");
		ParamCheck.checkString(passWord,8, "密码不能为空");
		ParamCheck.checkString(secondPassWord, 9, "二级密码不能为空");
	   if(!gcuser.getPassword().equals(MD5Security.md5_16_Small(passWord))){
		  throw new ServiceException(4, "密码错误！");
	   }
	   if(!gcuser.getPassword3().equals(secondPassWord)){
		  throw new ServiceException(5, "二级密码错误！");
	   }
		
		//userService.checkUserInfo(userName,param);
	}
	
	
	
	/**
	 * 验证验证码
	 * 
	 * 
	 * @param userName 用户名
	 * 
	 * @param passWord 登录密码
	 *   
	 * @param secondPassWord 二级密码
	 * 
	 * @param smsCode 验证码
	 * 
	 * */
	public String bindAccountCheck(String userName, String passWord, String secondPassWord, String smsCode, String call) {
		if(smsCode==null){
			throw new ServiceException(11, "验证码为空!");
		}
		Gcuser gcuser = userService.getUserByUserName(userName);
		
		if(!smsCode.equals(gcuser.getVipsq())){
			throw new ServiceException(10, "验证码有误!");
		}
		LogSystem.info("玩家：["+userName+"],绑定账号成功！");
		gcuserDao.updateSmsCode(userName, Global.INIT_SMS_CODE);
		return gcuser.getCall();
		
	}

	
	/**
	 * 
	 * 获取玩家信息
	 * 
	 * @param appId 应用ID
	 * @param user	玩家
	 * @param param 时间参数，精确到秒
	 * @param sign	签名后的字符串
	 * @return
	 */
	public Gcuser getUserInfo(String appId, String user, String param, String sign) {
		//检测客户端传过来的参数是否为空
		ParamCheck.checkString(user, 2, "用户名不能为空");
		ParamCheck.checkString(sign, 5, "签名不能为空");
		if(param==null){
			param = "";
		}
		Gcuser guser=gcuserDao.getUser(user);
		if(guser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		//获得app
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appId");
		}
		String signString = appId+user+param;
		String mySign = MacShaUtils.doEncryptBase64(signString, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为:["+signString+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		return guser;
	}

	public List<PointsChangeLog> getPointsChangeLog(String appId, String param, String sign) {
		//检测客户端传过来的参数是否为空
		ParamCheck.checkString(sign, 5, "签名不能为空");
		if(param==null){
			param = "";
		}
		//获得app
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appId");
		}
		String signString = appId+param;
		String mySign = MacShaUtils.doEncryptBase64(signString, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为:["+signString+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		
		return agentPointsChangeLogDao.get10();
	}

	public IPage<Gcuser> getSameUserInfo(String user,int pageIndex, int pageSize) {
		Gcuser guser=gcuserDao.getUser(user);
		if(guser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		return gcuserDao.getUserPage(guser.getName(), guser.getUserid(), pageIndex, pageSize);
	}

	
	/**
	 * 得到玩家積分明細
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gpjy> getPointDetail(String user,int pageIndex,int pageSize) {
		return agentGpjyDao.getAllGpjyPageList(user, pageIndex, pageSize);
	}

	
	/**
	 * 玩家積分拆分收益明細
	 * @param user
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public IPage<Gpjy> getUserPointSplitDetail(String user, int currentPage, int pageSize) {
		return agentGpjyDao.getUserPointSplitPageList(user, currentPage, pageSize);
	}

	public boolean checkSign(String appId, String user, String param, String sign,String endKey) {
		//检测客户端传过来的参数是否为空
		ParamCheck.checkString(user, 2, "用户名不能为空");
		ParamCheck.checkString(sign, 5, "签名不能为空");
		if(param==null){
			param = "";
		}
		Gcuser guser=gcuserDao.getUser(user);
		if(guser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		//获得app
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appId");
		}
		String signString = appId+user+param;
		if(!Strings.isNullOrEmpty(endKey)){
			signString +=endKey;
		}
		
		String mySign = MacShaUtils.doEncryptBase64(signString, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为:["+signString+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		return true;
		
	}

	public SameAccountWealth getSameAccountWealth(String user) {

		Gcuser guser=gcuserDao.getUser(user);
		if(guser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		
		return gcuserDao.getSameAccountTatolWealth(guser.getName(),guser.getUserid());
	}

	
	@Transactional
	public String setPayPassword(String appId, String user, String payPassword,String smsCode,String call, String sign, String password, String secondPassword,String param) {
		ParamCheck.checkString(user, 1, "用户名不能为空");
		ParamCheck.checkString(password, 2, "登录密码不能为空");
		ParamCheck.checkString(secondPassword, 3, "二级密码不能为空");
		ParamCheck.checkString(payPassword, 4, "支付密码不能为空");
		ParamCheck.checkString(smsCode, 5, "验证码不能为空");
		ParamCheck.checkString(sign, 6, "签名不能为空");
		
		
		Gcuser guser=gcuserDao.getUser(user);
		if(guser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		if(!smsCode.equals(guser.getVipsq())){
			throw new ServiceException(10, "验证码有误!");
		}
		//获得app
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appId");
		}
		String signStr = appId+user+payPassword+password+secondPassword+smsCode+param;
		String mySign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为["+signStr+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		
		String nameUserid=guser.getName() + guser.getUserid();
		SameUserProperty userProperty = sameUserPropertyDao.getSameUserProperty(nameUserid);
		if(userProperty!=null ){
				boolean flag = sameUserPropertyDao.updatePayPassword(nameUserid,MD5Security.md5_16_Small(payPassword));
				if(!flag){
					throw new ServiceException(11, "增加支付密码失败！");
				}
				LogSystem.info("玩家：["+user+"],增加支付密码成功！");
			
		}else{
			SameUserProperty sameUserProperty =new SameUserProperty(nameUserid, new Date(), null, MD5Security.md5_16_Small(payPassword));
			if(!sameUserPropertyDao.insertSameUserProperty(sameUserProperty)){
				throw new ServiceException(12, "增加失败！");
			}
			LogSystem.info("玩家：["+user+"],设置支付密码成功！");
		}
		gcuserDao.updateSmsCode(user, Global.INIT_SMS_CODE);
		
		return "设置成功";
		
	}

	@Transactional
	public String transactionPay(String appId, String fromUserName, String toUserName, String amount,
			String productOrder, String productDesc, String param, String sign, String payPassWord) {
		ParamCheck.checkString(fromUserName, 1, "扣款用户不能为空");
		ParamCheck.checkString(amount, 2, "订单金额不能为空");
		ParamCheck.checkString(productOrder, 3, "商户订单号不能为空");
		ParamCheck.checkString(productDesc, 4, "商品名称不能为空不能为空");
		//ParamCheck.checkString(sign, 5, "签名不能为空");
		ParamCheck.checkString(toUserName, 10, "收款账户不能为空");
		ParamCheck.checkString(payPassWord, 16, "支付密码不能为空");
		
		if(param==null){
			param = "";
		}
		Gcuser fromgcuser = gcuserDao.getUser(fromUserName);
		if(fromgcuser==null){
			throw new ServiceException(6, "扣款用户名不存在！");
		}
        if(fromgcuser.getTxlb()==3||fromgcuser.getJb()==5){
            throw new ServiceException(19,"商户或商家账号不能转账！");
		}
		
		
		Gcuser togcuser = gcuserDao.getUser(toUserName);
		if(togcuser==null){
			throw new ServiceException(11, "收款用户名不存在！");
		}
		
		
		 if(togcuser.getTxlb()!=3 && togcuser.getJb()!=5){
	         throw new ServiceException(20,"收款用户名非商户或商家账号！");
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
		SameUserProperty fromsameUserProperty = sameUserPropertyDao.getSameUserProperty(fromgcuser.getName()+fromgcuser.getUserid());
		if(fromsameUserProperty==null || fromsameUserProperty.getAppPayPassword()==null){
			throw new ServiceException(17, "扣款账户没有设置支付密码！");
		}
		if(!fromsameUserProperty.getAppPayPassword().equals(MD5Security.md5_16_Small(payPassWord))){
			throw new ServiceException(18, "支付密码不正确！");
		}
		
		String signStr = appId+fromUserName+toUserName+amount+productOrder+productDesc+param;
		String mySign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为["+signStr+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		
		//查询订单是否存在，不存在增加并且扣款
		if(appPayRecordDao.get(productOrder)!=null){
			throw new ServiceException(12, "扣款已经成功，请勿重复提交！");
		}
		
		AppPayRecord appPayRecord = new AppPayRecord();
		appPayRecord.setAmount(yb);
		appPayRecord.setAppId(appId);
		appPayRecord.setCreatedTime(new Date());
		appPayRecord.setFromUserName(fromUserName);
		appPayRecord.setToUserName(toUserName);
		appPayRecord.setParam(param);
		appPayRecord.setProductDesc(productDesc.trim());
		appPayRecord.setProductOrder(productOrder.trim());
		appPayRecord.setStatus(1);
		int orderId = appPayRecordDao.addBackKey(appPayRecord);
		if(orderId<0){
			throw new ServiceException(15, "支付失败！");
		}
		
		boolean fromresult = userService.changeYb(fromUserName, -yb, "订单号："+orderId+"-"+productDesc+"("+productOrder+")", YbChangeType.AGENTTYPE, null, 0, YbChangeType.APPTRASACTIONREDUCE);
		if(!fromresult){
			throw new ServiceException(13, "扣款账户余额不足！");
		}
		boolean toresult = userService.changeYb(toUserName, yb, "订单号："+orderId+"-"+productDesc+"("+productOrder+")", YbChangeType.AGENTTYPE, null, 0, YbChangeType.APPTRASACTIONADD);
		if(!toresult){
			throw new ServiceException(14, "收款账户不存在！");
		}
		
		return orderId+"";
		
	}

	public String getUserPaypassword(String user) {
		
		Gcuser gcuser = gcuserDao.getUser(user);
		if(gcuser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		SameUserProperty fromsameUserProperty = sameUserPropertyDao.getSameUserProperty(gcuser.getName()+gcuser.getUserid());
		if(fromsameUserProperty==null || fromsameUserProperty.getAppPayPassword()==null){
			return "false";
		}
		return "true";
	}

	@Transactional
	public String updatePayPassword(String appId, String user, String payPassword, String oldPayPassword, String smsCode,String call,String sign,String password,String secondPassword,String param) {
		ParamCheck.checkString(user, 1, "用户名不能为空");
		/*ParamCheck.checkString(password, 2, "登录密码不能为空");
		ParamCheck.checkString(secondPassword, 3, "二级密码不能为空");*/
		ParamCheck.checkString(payPassword, 4, "支付密码不能为空");
		ParamCheck.checkString(smsCode, 5, "验证码不能为空");
		ParamCheck.checkString(sign, 6, "签名不能为空");
		ParamCheck.checkString(oldPayPassword, 11, "原支付密码不能为空");
		
		if(param==null){
			param = "";
		}
		Gcuser guser=gcuserDao.getUser(user);
		if(guser==null){
			throw new ServiceException(1, "用户名不存在！");
		}
		
		

		if(!smsCode.equals(guser.getVipsq())){
			throw new ServiceException(10, "验证码有误!");
		}
		
		//获得app
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appId");
		}
		String signStr = appId+user+payPassword+oldPayPassword+smsCode+param;
		String mySign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为["+signStr+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		
		
		String nameUserid=guser.getName() + guser.getUserid();
		SameUserProperty userProperty = sameUserPropertyDao.getSameUserProperty(nameUserid);
		if(userProperty!=null){
			if(userProperty.getAppPayPassword()==null){
				throw new ServiceException(13, "您没有设置过支付密码！");
			}else if(!MD5Security.md5_16_Small(oldPayPassword).equals(userProperty.getAppPayPassword())){
				throw new ServiceException(12, "原支付密码错误！");
			}else{
				boolean flag = sameUserPropertyDao.updatePayPassword(nameUserid,MD5Security.md5_16_Small(payPassword));
				if(!flag){
					throw new ServiceException(10, "修改失败！");
				}
				LogSystem.info("玩家：["+user+"],设置支付密码成功！");
			}
		}else{
			throw new ServiceException(13, "您没有设置过支付密码！");
		}
		gcuserDao.updateSmsCode(user, Global.INIT_SMS_CODE);
		
		if(oldPayPassword!=null){
			return "修改成功";
		}else{
			return "设置成功";
		}
	}

	public void checkParamAndSign(String user, String passWord, String secondPassWord, String call, int i) {
		// TODO Auto-generated method stub
		
	}

	public String queryTrasactionOder(String appId, String productOrder, String param, String sign) {
		//检测客户端传过来的参数是否为空
		ParamCheck.checkString(productOrder, 1, "订单号不能为空");
		//ParamCheck.checkString(sign, 5, "签名不能为空");
		if(param==null){
			param = "";
		}
		//获得app
		AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", appId));
		if(agentApp==null){
			throw new ServiceException(7, "无效的appId");
		}
		String signString = appId+productOrder+param;
		
		String mySign = MacShaUtils.doEncryptBase64(signString, agentApp.getAppKey());
		if(!mySign.equals(sign)){
			LogSystem.warn("加密串为:["+signString+"],key=["+agentApp.getAppKey()+"],服务器的签名为["+mySign+"],客户端的签名为["+sign+"]");
			throw new ServiceException(9, "签名不正确！");
		}
		
		AppPayRecord appPayRecord= appPayRecordDao.get(productOrder);
		if(appPayRecord==null){
			return "订单不存在";
		}
		return appPayRecord.getProductOrder();
	}

	
	
	
	
	
	
}
