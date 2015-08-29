package com.yq.manager.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.utils.MD5Security;
import com.yq.manager.dao.SgtjDao;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.Sgtj;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.GpjyDao;

public class AdminService {
	@Autowired
	private FcxtDao fcxtDao;
	@Autowired
	private SgtjDao sgtjDao;
	@Autowired
	private BdbDateDao bdbDateDao;
	@Autowired
	private GpjyDao gpjyDao;

	private Map<String,String> adminUserMap = new HashMap<String,String>();
	
	public String getLoginAdminUserName(String sessionId){
		return adminUserMap.get(sessionId);
	}
	/**
	 * 管理员登录
	 * @param userName
	 * @param password
	 * @param sessionId
	 */
	public boolean adminLogin(String userName,String password,String sessionId){
		String md5pass = MD5Security.md5_16(password);
		Fcxt fcxt = fcxtDao.getByUserNameAndPassword(userName, md5pass);
		if(fcxt!=null){
			adminUserMap.put(sessionId, userName);
			return true;
		}else{
			return false;
		}
	}
	
	public void logout(String sessionId){
		adminUserMap.remove(sessionId);
	}
	
	public IPage<Sgtj> getSgtjPageList(int pageIndex,int pageSize){
		return sgtjDao.getPageList(pageIndex, pageSize);
	}
	
	public IPage<Bdbdate> getBdbdatePageList(int pageIndex,int pageSize){
		return bdbDateDao.getALLPageList(pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getGpjyPageList(int pageIndex,int pageSize){
		return gpjyDao.getPageList(pageIndex, pageSize);
	}
}
