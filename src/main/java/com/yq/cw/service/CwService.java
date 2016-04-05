package com.yq.cw.service;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.MD5Security;
import com.yq.cw.bean.DatepayCw;
import com.yq.cw.bean.DatepayForDc;
import com.yq.cw.bean.StatBean;
import com.yq.cw.bean.VipCjbLogBean;
import com.yq.cw.bean.VipCjglForDc;
import com.yq.cw.bean.VipSearchLogBean;
import com.yq.cw.bo.CwUser;
import com.yq.cw.dao.CwUserDao;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.dao.DatePayDao;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.VipcjglDao;
import com.yq.user.service.LogService;

public class CwService {
	
  	private Cache<String,String> cwUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();

  	@Autowired
  	private CwUserDao cwUserDao;
  	@Autowired
  	private GcuserDao gcuserDao;
  	@Autowired
  	private LogService logService;
  	@Autowired
  	private DatePayDao datePayDao;
  	@Autowired
  	private VipcjglDao vipcjglDao;
  	
  	public String getLoginCwUserName(String sessionId){
		return cwUserMap.getIfPresent(sessionId);
	}
	/**
	 * 财务人员登录
	 * @param userName
	 * @param password
	 * @param sessionId
	 */
	public boolean cwLogin(String userName,String password,String sessionId){
//		String md5pass = MD5Security.md5_16(password);
		//管理员登录
		CwUser cwUser = cwUserDao.getCwUser(userName);
		if(cwUser!=null&&cwUser.getPassWord().equals(password)){
			cwUserMap.put(sessionId, userName);
			return true;
		}else{
			//普通vip登录
			userName = userName.toLowerCase();
			Gcuser gcUser = gcuserDao.getUser(userName);
			String md5pass = MD5Security.md5_16(password).toLowerCase();
			//登录成功
			if(gcUser!=null && gcUser.getPassword().equals(md5pass)&&gcUser.getVip()!=0){
				cwUserMap.put(sessionId, gcUser.getUsername());
				return true;
			}
			return false;
		}
	}
//	/**
//	 * 获取vip一币日志
//	 * @param userName
//	 * @param startTime
//	 * @return
//	 */
//	public List<VipSearchLogBean> getVipSearchList(String userName,String startTime){
//		List<VipSearchLogBean> result = Lists.newArrayList();
//		result.add(getVipSearchBean(userName, startTime));
//		return result;
//	}
	
	public VipSearchLogBean getVipSearchBean(String userName,String startTime){
		VipSearchLogBean result = new VipSearchLogBean();
		Date start = DateUtils.StringToDate(startTime, DateStyle.YYYY_MM_DD);
//		Date start_1 = DateUtils.addDay(start, -1);
		String startDate = startTime+" 00:00:00";
		String endDate = startTime+" 23:59:59";
		List<DatepayCw> logs = logService.getCwDatePayLisByVipUserNameAndDate(userName, startDate, endDate, null);
//		String yesterday = DateUtils.DateToString(start_1, DateStyle.YYYY_MM_DD);
//		String yesterday_s = yesterday+" 00:00:00";
//		for(DatepayCw dc:logs){
//			if(dc.getNewbz()==2){
//				if(dc.getSyjz()<1000){
//					dc.setInPrice(0.85);
//				}else{
//					dc.setInPrice(0.9);
//				}
//				dc.setOutPrice(1d);
//			}else if(dc.getNewbz()==3){
//				if(dc.getJc()<1000){
//					dc.setOutPrice(0.85);
//				}else{
//					dc.setOutPrice(0.9);
//				}
//				dc.setInPrice(1d);
//			}else{
//				dc.setInPrice(1d);
//				dc.setOutPrice(1d);
//			}
			
//		}
		Datepay datepay =  datePayDao.getDateLastDatePay(userName, startDate);
		
		int dayLeave = 0;
		int monthLeave = 0;
		int yearLeave = 0;
		//期初结余
		if(datepay!=null){
			result.setStartNum(datepay.getPay());
			dayLeave = datepay.getPay();
		}
		//日志列表
		result.setLogList(logs);
		//今日累积
		StatBean dayStat = new StatBean();
		dayStat.in = datePayDao.getSumSyjz(userName, startDate, endDate);
		dayStat.out = datePayDao.getSumjc(userName, startDate, endDate);
		dayStat.remaind = dayStat.in - dayStat.out+dayLeave;
		
		
		
		dayStat.inRmb = datePayDao.getSumSyjzByCw(userName, startDate, endDate);
		dayStat.outRmb = datePayDao.getSumjcByCw(userName, startDate, endDate);
		dayStat.remaindRmb = dayStat.inRmb - dayStat.outRmb;
		result.setDayStat(dayStat);
		//本月累积
		
		String monthStr = DateUtils.DateToString(start, DateStyle.YYYY_MM);
		String monthStartDate = monthStr+"-01 00:00:00";
		String monthEndDate = monthStr+"-31 23:59:59";
		StatBean monthStat = new StatBean();
		
		Datepay datepayMonth =  datePayDao.getDateLastDatePay(userName, monthStartDate);
		if(datepayMonth!=null){
			monthLeave = datepayMonth.getPay();
		}
		
		monthStat.in = datePayDao.getSumSyjz(userName, monthStartDate, monthEndDate);
		monthStat.out = datePayDao.getSumjc(userName, monthStartDate, monthEndDate);
		monthStat.remaind = monthStat.in - monthStat.out+monthLeave;
		
		monthStat.inRmb = datePayDao.getSumSyjzByCw(userName, monthStartDate, monthEndDate);
		monthStat.outRmb = datePayDao.getSumjcByCw(userName, monthStartDate, monthEndDate);
		monthStat.remaindRmb = monthStat.inRmb - monthStat.outRmb;
		
		result.setMonthStat(monthStat);
		//本年累积
		String yearStr = DateUtils.getYear(start)+"";
		String yearStartDate = yearStr+"-01-01 00:00:00";
		String yearEndDate = yearStr+"-12-31 23:59:59";
		StatBean yearStat = new StatBean();
		
		Datepay datepayYear =  datePayDao.getDateLastDatePay(userName, yearStartDate);
		if(datepayYear!=null){
			yearLeave = datepayYear.getPay();
		}
		
		yearStat.in = datePayDao.getSumSyjz(userName, yearStartDate, yearEndDate);
		yearStat.out = datePayDao.getSumjc(userName, yearStartDate, yearEndDate);
		yearStat.remaind = yearStat.in - yearStat.out+yearLeave;
		
		yearStat.inRmb = datePayDao.getSumSyjzByCw(userName, yearStartDate, yearEndDate);
		yearStat.outRmb = datePayDao.getSumjcByCw(userName, yearStartDate, yearEndDate);
		yearStat.remaindRmb = yearStat.inRmb - yearStat.outRmb;
		result.setYearStat(yearStat);
		return result;
	}
	
	public VipCjbLogBean getVipCjbBean(String userName,String startTime){
		VipCjbLogBean result = new VipCjbLogBean();
		Date start = DateUtils.StringToDate(startTime, DateStyle.YYYY_MM_DD);
		String startDate = startTime+" 00:00:00";
		String endDate = startTime+" 23:59:59";
		List<Vipcjgl> logs = vipcjglDao.getVipcjglListAsc(userName, startDate, endDate);
		Vipcjgl vipcjgl =  vipcjglDao.getOneBeforeTime(userName, startDate);
		
		int dayLeave = 0;
		int monthLeave = 0;
		int yearLeave = 0;
		//期初结余
		if(vipcjgl!=null){
			result.setStartNum(vipcjgl.getSycjb());
			dayLeave = vipcjgl.getSycjb();
		}
		//日志列表
		result.setLogList(logs);
		//今日累积
		StatBean dayStat = new StatBean();
		dayStat.in = vipcjglDao.getSumVipSr(userName, startDate, endDate);
		dayStat.out = vipcjglDao.getSumVipZc(userName, startDate, endDate);
		dayStat.remaind = dayStat.in - dayStat.out+dayLeave;
		
		result.setDayStat(dayStat);
		//本月累积
		
		String monthStr = DateUtils.DateToString(start, DateStyle.YYYY_MM);
		String monthStartDate = monthStr+"-01 00:00:00";
		String monthEndDate = monthStr+"-31 23:59:59";
		StatBean monthStat = new StatBean();
		
		Vipcjgl datepayMonth =  vipcjglDao.getOneBeforeTime(userName, monthStartDate);
		if(datepayMonth!=null){
			monthLeave = datepayMonth.getSycjb();
		}
		
		monthStat.in = vipcjglDao.getSumVipSr(userName, monthStartDate, monthEndDate);
		monthStat.out = vipcjglDao.getSumVipZc(userName, monthStartDate, monthEndDate);
		monthStat.remaind = monthStat.in - monthStat.out+monthLeave;
		
		result.setMonthStat(monthStat);
		//本年累积
		String yearStr = DateUtils.getYear(start)+"";
		String yearStartDate = yearStr+"-01-01 00:00:00";
		String yearEndDate = yearStr+"-12-31 23:59:59";
		StatBean yearStat = new StatBean();
		
		Vipcjgl datepayYear =  vipcjglDao.getOneBeforeTime(userName, yearStartDate);
		if(datepayYear!=null){
			yearLeave = datepayYear.getSycjb();
		}
		
		yearStat.in = vipcjglDao.getSumVipSr(userName, yearStartDate, yearEndDate);
		yearStat.out = vipcjglDao.getSumVipZc(userName, yearStartDate, yearEndDate);
		yearStat.remaind = yearStat.in - yearStat.out+yearLeave;
		
		result.setYearStat(yearStat);
		return result;
	}
	
	
	public List<DatepayForDc> getCwDatePayLisByVipUserNameAndDateForDc(String username,String startDate,String endDate,Integer newbz){
		return datePayDao.getListByVipUserNameAndDateForDc(username, startDate, endDate, newbz);
	}
	
	public List<VipCjglForDc> getVipcjglListForDcAsc(String userName,String startTime,String endTime){
		return vipcjglDao.getVipcjglListForDcAsc(userName, startTime, endTime);
	}
}
