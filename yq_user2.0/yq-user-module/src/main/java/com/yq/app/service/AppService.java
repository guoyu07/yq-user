package com.yq.app.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.module.utils.JedisUtils;
import com.sr178.module.web.session.Session;
import com.yq.common.utils.ParamCheck;
import com.yq.user.bo.Gcuser;
import com.yq.user.dao.GcuserDao;

public class AppService {
//	private Cache<String,String> userToken = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
	@Autowired
	private GcuserDao gcuserDao;
	
	
	
  	private static final String APP_SESSION_CACHE_PRE = "app_session_";
  	private static final int SESSION_EXPERI_SECONDS = 24*3600;
  	
  	public String generatorCacheKey(String sessionId){
  		return APP_SESSION_CACHE_PRE+sessionId;
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
//		return userToken.getIfPresent(tokenId);
	}
	/**
	 * 登录
	 * 
	 * @param userName
	 * @param passWord
	 */
	public String login(String userName, String passWord) {
		ParamCheck.checkString(userName, 1, "用户名不能为空");
		ParamCheck.checkString(passWord, 2, "密码不能为空");
		Gcuser gcUser = gcuserDao.getUser(userName);
		//登录成功
		if(gcUser!=null && gcUser.getPassword().equals(passWord)){
			String tokenId = UUID.randomUUID().toString();
			Session appSession = new Session(userName, System.currentTimeMillis(), tokenId);
			setSession(tokenId, appSession);
//			userToken.put(tokenId, gcUser.getUsername());
			LogSystem.info(userName+"APP登录成功");
			return tokenId;
		}else{
			throw new ServiceException(3, "用户名或密码错误！");
		}
	}
	/**
	 * 获取用户信息
	 * @param userName
	 * @return
	 */
	public Gcuser getUserInfo(String userName){
		return gcuserDao.getUser(userName);
	}
}
