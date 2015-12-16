package com.yq.app.service;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.exception.ServiceException;
import com.yq.common.utils.ParamCheck;
import com.yq.user.bo.Gcuser;
import com.yq.user.dao.GcuserDao;

public class AppService {
	private Cache<String,String> userToken = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
	@Autowired
	private GcuserDao gcuserDao;
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
		return userToken.getIfPresent(tokenId);
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
			userToken.put(tokenId, gcUser.getUsername());
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
