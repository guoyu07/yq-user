package com.yq.cservice.service;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.MD5Security;
import com.yq.cservice.bean.ChargeStat;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Fcxt;
import com.yq.user.dao.DatecjDao;
import com.yq.user.dao.FcxtDao;

public class CsService {
	@Autowired
	private FcxtDao fcxtDao;
	@Autowired
	private DatecjDao datecjDao;

  	private Cache<String,String> csUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();

  	public String getLoginCsUserName(String sessionId){
		return csUserMap.getIfPresent(sessionId);
	}
	/**
	 * 管理员登录
	 * @param userName
	 * @param password
	 * @param sessionId
	 */
	public boolean csLogin(String userName,String password,String sessionId){
		String md5pass = MD5Security.md5_16(password);
		Fcxt fcxt = fcxtDao.getByUserNameAndNcjud(userName, md5pass);
		if(fcxt!=null){
			csUserMap.put(sessionId, userName);
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 获取客服充值记录列表
	 * @param cz
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Datecj> getCsRecordList(String cz,int pageIndex,int pageSize){
		return datecjDao.getDatecjPageListByCz(cz, pageIndex, pageSize);
	}
	/**
	 * 获取客服信息
	 * @param csName
	 * @return
	 */
	public Fcxt getCsAdminUser(String csName){
		return fcxtDao.getCsAdminUser(csName);
	}
	/**
	 * dqu
	 * @param dqu
	 * @return
	 */
	public Fcxt getByDqu(int dqu){
		return fcxtDao.getFcxtByDqu(dqu);
	}
	/**
	 * 统计信息
	 * @param cz
	 * @return
	 */
	public ChargeStat getChargeStat(String cz){
		ChargeStat chargeStat = new ChargeStat();
		String todayStr = DateUtils.getDate(new Date());
		String todayStart = todayStr+" 00:00:00";
		String todayEnd = todayStr+" 23:59:59";
		String yesterdayStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -1));
		String yesterdayStart = yesterdayStr+" 00:00:00";
		String yesterdayEnd = yesterdayStr+" 23:59:59";
		String beforyesterdayStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -2));
		String beforyesterdayStart = beforyesterdayStr+" 00:00:00";
		String beforyesterdayEnd = beforyesterdayStr+" 23:59:59";
		chargeStat.setTodaySum(datecjDao.getSumDqcj(cz, todayStart, todayEnd));
		chargeStat.setYesterdaySum(datecjDao.getSumDqcj(cz, yesterdayStart, yesterdayEnd));
		chargeStat.setOldYesterdaySum(datecjDao.getSumDqcj(cz, beforyesterdayStart, beforyesterdayEnd));
		chargeStat.setAll(datecjDao.getSumDqcj(cz));
		return chargeStat;
	}
}
