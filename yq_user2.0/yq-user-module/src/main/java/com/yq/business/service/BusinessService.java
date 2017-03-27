package com.yq.business.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.module.web.session.Session;
import com.yq.business.bean.YbDetail;
import com.yq.business.dao.YbDao;
import com.yq.common.utils.MD5Security;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.dao.AdminOperateLogDao;
import com.yq.manage.dao.ManageUserDao;
import com.yq.manage.util.AdminGlobal;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.dao.GcuserDao;

public class BusinessService {
	
	@Autowired
	private ManageUserDao manageDao;
	@Autowired
	private AdminOperateLogDao adminOperateLogDao;
	@Autowired
	private YbDao ybDao;
	@Autowired
	private GcuserDao userDao;
	
	private Cache<String,Session> businessUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
  	
    public static boolean isClose = ConfigLoader.getIntValue("is_stop_jf_mc",0)==0?false:true;
    
	public Session getLoginBusinessUserName(String sessionId){
		Session adminSession = businessUserMap.getIfPresent(sessionId);
		return adminSession;
	}
	/**
	 * 管理员登录
	 * @param userName
	 * @param password
	 * @param sessionId
	 */
	public boolean businessLogin(String userName,String password,String sessionId){
		String md5pass = MD5Security.md5_16(password).toLowerCase();
		//ManageUser admin = manageDao.getByUserNameAndPassword(userName, md5pass);
		Gcuser admin = userDao.getUser(userName);
		if(admin!=null && admin.getPassword().equals(md5pass)){
			Session session = new Session(userName, System.currentTimeMillis(), sessionId);
			businessUserMap.put(sessionId, session);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean businessUserLogin(String adminUserName, String passWord, HttpSession session, String ip) {
		AdminOperateLog log= new AdminOperateLog(adminUserName,ip , new Date(), AdminGlobal.LOGIN_EVENT, "后台登录");
		adminOperateLogDao.addLog(log);
		return businessLogin(adminUserName, passWord, session.getId());
	}
	
	public void logout(String sessionId){
		businessUserMap.invalidate(sessionId);
	}
	public IPage<Datepay> getYbDetail(String userName,int pageIndex, int pageSize,String queryStartDate, String queryEndDatet) {
		return ybDao.getpageList(userName, pageIndex, pageSize,queryStartDate, queryEndDatet);
	}
	public List<YbDetail> getYbList(String userName, String queryStartDate, String queryEndDatet) {
		List<Datepay> dateList = ybDao.getList(userName,queryStartDate, queryEndDatet);
		List<YbDetail> result = new ArrayList<YbDetail>();
		for (Datepay datepay : dateList) {
			YbDetail ybchange=new YbDetail();
			ybchange.setUsername(datepay.getUsername());
			ybchange.setAbdate(datepay.getAbdate());
			ybchange.setSyjz(datepay.getSyjz());
			ybchange.setJc(datepay.getJc());
			ybchange.setPay(datepay.getPay());
			ybchange.setRegid(datepay.getRegid());
			result.add(ybchange);
		}
		return result;
	}

}
