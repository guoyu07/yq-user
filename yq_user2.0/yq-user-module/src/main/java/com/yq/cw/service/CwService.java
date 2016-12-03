package com.yq.cw.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Lists;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.module.web.session.Session;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.MD5Security;
import com.yq.cw.bean.DatepayCw;
import com.yq.cw.bean.DatepayForDc;
import com.yq.cw.bean.DayOfYb;
import com.yq.cw.bean.SearchDayOfYb;
import com.yq.cw.bean.StatBean;
import com.yq.cw.bean.VipCjbLogBean;
import com.yq.cw.bean.VipCjbOfDay;
import com.yq.cw.bean.VipCjglForDc;
import com.yq.cw.bean.VipSearchLogBean;
import com.yq.cw.bean.VipServiceFee;
import com.yq.cw.bo.ConfYbChangeType;
import com.yq.cw.bo.CwUser;
import com.yq.cw.bo.VipDownTemp;
import com.yq.cw.dao.ConfYbChangeTypeDao;
import com.yq.cw.dao.CwUserDao;
import com.yq.cw.dao.VipDownTempDao;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Sgxt;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.constant.YbChangeType;
import com.yq.user.dao.DatePayDao;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.SgxtDao;
import com.yq.user.dao.VipcjglDao;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

public class CwService {
	
  	private Cache<String,Session> cwUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();

  	private static final String ADMIN = "cwadmin";
  	private static final String originTypeKey="originType_Key";
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
  	@Autowired
  	private AdminService adminService;
  	@Autowired
  	private SgxtDao sgxtDao;
  	@Autowired
  	private VipDownTempDao vipDownTempDao;
  	@Autowired
  	private ConfYbChangeTypeDao confYbChangeTypeDao;
  	
  	
  	private Cache<String,List<String>> downVipList = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
  	
  	private Cache<String,List<ConfYbChangeType>> confOriginTypeList = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
  	
  	
  	
  	public Session getLoginCwUserName(String sessionId){
  		Session cwSession = cwUserMap.getIfPresent(sessionId);
  		return cwSession;
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
			Session cwSession = new Session(userName, System.currentTimeMillis(), sessionId);
			cwUserMap.put(sessionId, cwSession);
			List<String> downList = getNowDownVipList(userName);
			downVipList.put(userName, downList);
			List<ConfYbChangeType> origintypeList=confYbChangeTypeDao.getAllList();
			confOriginTypeList.put(originTypeKey, origintypeList);
			return true;
		}else{
			//普通vip登录
			userName = userName.toLowerCase();
			Gcuser gcUser = gcuserDao.getUser(userName);
			String md5pass = MD5Security.md5_16(password).toLowerCase();
			//登录成功
			if(gcUser!=null && gcUser.getPassword().equals(md5pass)&&gcUser.getVip()==2){//大vip才能登陆  小vip不能登陆
				Session cwSession = new Session(gcUser.getUsername(), System.currentTimeMillis(), sessionId);
				cwUserMap.put(sessionId, cwSession);
				//查询其下小vip列表
				List<String> downList = getNowDownVipList(userName);
				downVipList.put(userName, downList);
				List<ConfYbChangeType> origintypeList=confYbChangeTypeDao.getAllList();
				confOriginTypeList.put(originTypeKey, origintypeList);
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
	/**
	 * 从缓存中获取
	 * @param userName
	 * @return
	 */
	public List<String> getMyDownVip(String userName){
		return downVipList.getIfPresent(userName);
	}
	
	/**
	 * 生成大vip下小vip的纪录
	 */
	public void vipDownTempRun(){
		List<Gcuser> list = gcuserDao.getAllBigVip();
		for(Gcuser gcuser:list){
			List<String> mydownVips = getCurrentNowDownVipList(gcuser.getUsername());
			List<VipDownTemp> downTemps = Lists.newArrayList();
			for(String downVip:mydownVips){
				downTemps.add(new VipDownTemp(gcuser.getUsername(), downVip));
			}
			vipDownTempDao.delete(new SqlParamBean("user_name", gcuser.getUsername()));
			vipDownTempDao.insertBatch(downTemps);
		}
	}
	
	
	private List<String> getNowDownVipList(String userName) {
		List<String> result = Lists.newArrayList();
		if (userName.equals(ADMIN)) {
			result = adminService.getAllVipName();
		} else {
			List<VipDownTemp> list = vipDownTempDao.getList(new SqlParamBean("user_name", userName));
			for (VipDownTemp vip : list) {
				result.add(vip.getDownVip());
			}
		}
		return result;
	}
	/**
	 * 即时查询当前用户下的小vip列表
	 * @param userName
	 * @return
	 */
	private List<String> getCurrentNowDownVipList(String userName){
		List<String> vipList = Lists.newArrayList();
		if (userName.equals(ADMIN)) {
			vipList = adminService.getAllVipName();
		} else {
			Gcuser gcuser = gcuserDao.getUser(userName);
			if(gcuser!=null){
				vipList.add(userName);
				if(gcuser.getVip()==2){//大vip 查询其下的小vip
					generatorDownList(userName, vipList);
				}
			}
		}
		return vipList;
	}
	
	public void generatorDownList(String userName,List<String> vipList){
		Sgxt sgxt = sgxtDao.get(userName);
		if(sgxt==null){
			return;
		}
		if(!Strings.isNullOrEmpty(sgxt.getAuid())){
			Gcuser gcuser = gcuserDao.getUser(sgxt.getAuid());
			if(gcuser.getVip()==3){//小vip添加
				vipList.add(sgxt.getAuid());
			}else if(gcuser.getVip()==2){//大vip中断
				return;
			}
			//继续往下找
			generatorDownList(sgxt.getAuid(), vipList);
		}
		
		if(!Strings.isNullOrEmpty(sgxt.getBuid())){
			Gcuser gcuser = gcuserDao.getUser(sgxt.getBuid());
			if(gcuser.getVip()==3){//小vip添加
				vipList.add(sgxt.getBuid());
			}else if(gcuser.getVip()==2){//大vip中断
				return;
			}
			//继续往下找
			generatorDownList(sgxt.getBuid(), vipList);
		}
		
		
	}
	
	/**
	 * 查询当前用户下的小vip列表 
	 * @param userName
	 * @return
	 */
	public List<VipDownTemp> getDownVipList(String userName){
		return vipDownTempDao.getDownVipList(userName);
	}
	
	
	public SearchDayOfYb getSearchDayOfYb(String searchUserName, String startTime, String endTime) {
		UserService userService = ServiceCacheFactory.getService(UserService.class);
	    Gcuser gcuser = userService.getUserByUserName(searchUserName);
	   
	    if(Strings.isNullOrEmpty(startTime)||Strings.isNullOrEmpty(endTime)){
	    	throw new ServiceException(4,"开始时间或结束时间不能为空！");
	    }
	    if(gcuser==null){
			throw new ServiceException(1,"玩家不存在！");
		}
		if(DateUtils.compareDateStr(startTime,endTime)==1){
			throw new ServiceException(2,"结束时间要大于开始时间！");
		}
		if(searchUserName==null){
			throw new ServiceException(3,"玩家不能为空！");
		}
		
		SearchDayOfYb result = new SearchDayOfYb();
		
		String startDate = startTime+" 00:00:00";
		Datepay datepay =  datePayDao.getDateLastDatePay(searchUserName, startDate);
		
		//期初结余
		if(datepay!=null){
			result.setStartNum(datepay.getPay());
		}
		result.setDayofybList(getDayOfYbList(searchUserName, startTime, endTime));
		return result;
	}
	
	/**
	 * 从缓存中获取
	 * @param userName
	 * @return
	 */
	public List<ConfYbChangeType> getOrigintypeList(){
		return confOriginTypeList.getIfPresent(originTypeKey);
	}
	/**
	 * 得到玩家一币日志列表
	 * @param searchUserName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<DayOfYb> getDayOfYbList(String searchUserName, String startTime, String endTime) {
		
		UserService userService = ServiceCacheFactory.getService(UserService.class);
	    Gcuser gcuser = userService.getUserByUserName(searchUserName);
		
	    if(Strings.isNullOrEmpty(startTime)||Strings.isNullOrEmpty(endTime)){
		    	throw new ServiceException(4,"开始时间或结束时间不能为空！");
	    }
	    if(gcuser==null){
			throw new ServiceException(1,"玩家不存在！");
		}
		if(DateUtils.compareDateStr(startTime,endTime)==1){
			throw new ServiceException(2,"结束时间要大于开始时间！");
		}
		if(searchUserName==null){
			throw new ServiceException(3,"玩家不能为空！");
		}
		List<ConfYbChangeType> origintypeList = this.getOrigintypeList();
		List<String> datelist = DateUtils.separateDateStr(startTime, endTime, DateUtils.DAY_MSELS, DateUtils.YYYY_MM_DD_SDF);
		List<DayOfYb> dayOfYbList = new ArrayList<DayOfYb>();
		DayOfYb dayofyb= null;
		
		for (int i = 0; i < datelist.size(); i++) {
			String today = datelist.get(i);
			String startDate =today + " 00:00:00";
			String endDate = today + " 23:59:59";
			
			Datepay startNumdatepay =  datePayDao.getDateLastDatePay(searchUserName, startDate);
			int startNum=0;
			//期初结余
			if(startNumdatepay!=null){
				startNum = startNumdatepay.getPay();
			}
			
			double otherin = 0;
			double otherout = 0;
			for (ConfYbChangeType origintype : origintypeList) {
				
				if(origintype.getOrigintype()!=0){
					List<DayOfYb> datepayList=datePayDao.getDayOfYbList(searchUserName, startDate, endDate, origintype.getOrigintype());
					
					for (DayOfYb getdayofyb : datepayList) {
						double in = getdayofyb.getIn();
						double out = getdayofyb.getOut();
						dayofyb= new DayOfYb();
						dayofyb.setDate(today);
						dayofyb.setOrigin(origintype.getOrigin());
						dayofyb.setDesc(getdayofyb.getDesc());
						if(in!=0){
							dayofyb.setIn(in);
							dayofyb.setInprice(getdayofyb.getInprice());
							if(getdayofyb.getInprice()!=0){
								dayofyb.setInjine(in*getdayofyb.getInprice());
							}else{
								dayofyb.setInjine(in);
							}
							
						}
						if(out!=0){
							dayofyb.setOut(out);
							dayofyb.setOutprice(getdayofyb.getOutprice());
							if(getdayofyb.getOutprice()!=0){
								dayofyb.setOutjine(out*getdayofyb.getOutprice());
							}else{
								dayofyb.setOutjine(out);
							}
						}
						dayofyb.setPay(startNum+in-out);
						dayOfYbList.add(dayofyb);
						if(dayofyb!=null){
							startNum=(int) dayofyb.getPay();
						}
					}
				}
				if(origintype.getOrigintype()==0){
					List<DayOfYb> datepayList=datePayDao.getDayOfYbList(searchUserName, startDate, endDate, 0);
					for (DayOfYb getdayofyb : datepayList) {
						otherin=+getdayofyb.getIn();
						otherout=+getdayofyb.getOut();
					}
					
					dayofyb= new DayOfYb();
					if(otherin==0&&otherout==0){
						dayofyb.setOrigin(today+"_结余数");
						dayofyb.setDesc("其他");
					}else{
						dayofyb.setOrigin("其他");
						dayofyb.setDesc("其他");
					}
					dayofyb.setDate(today);
					dayofyb.setPay(startNum+otherin-otherout);
					dayofyb.setIn(otherin);
					dayofyb.setOut(otherout);
					dayOfYbList.add(dayofyb);
				}
				
			}
			
		}
		return dayOfYbList;
	}
	
	public List<VipServiceFee> getByserviceFeeList(String searchUserName, String startTime, String endTime) {

		UserService userService = ServiceCacheFactory.getService(UserService.class);
	    Gcuser gcuser = userService.getUserByUserName(searchUserName);
		
	    if(Strings.isNullOrEmpty(startTime)||Strings.isNullOrEmpty(endTime)){
		    	throw new ServiceException(4,"开始时间或结束时间不能为空！");
	    }
	    if(gcuser==null){
			throw new ServiceException(1,"玩家不存在！");
		}
		if(DateUtils.compareDateStr(startTime,endTime)==1){
			throw new ServiceException(2,"结束时间要大于开始时间！");
		}
		if(searchUserName==null){
			throw new ServiceException(3,"玩家不能为空！");
		}
		String startDate =startTime + " 00:00:00";
		String endDate = endTime + " 23:59:59";
		
		
		List<VipServiceFee> result = Lists.newArrayList();
		VipServiceFee vipfee=null;
		List<VipDownTemp> vipdown=vipDownTempDao.getDownVipList(searchUserName);
		for (VipDownTemp vipDownTemp : vipdown) {
			List<Datepay> datepayList = datePayDao.getSaleYbBeiYongList(vipDownTemp.getDownVip(), startDate, endDate, YbChangeType.ZHUANRU);
			for (Datepay datepay : datepayList) {
				  Gcuser vipDown = userService.getUserByUserName(vipDownTemp.getDownVip());
				  if(datepay.getJc()!=0){
					  if(vipDown.getVip()==2){
						vipfee = new VipServiceFee();
						vipfee.setUsername(datepay.getUsername());
						vipfee.setDate(datepay.getAbdate());
						vipfee.setDesc(datepay.getRegid());
						vipfee.setIn(datepay.getJc());
						vipfee.setServicefee(0);
						vipfee.setServicejine(0);
						result.add(vipfee);
					  }else{
						vipfee = new VipServiceFee();
						vipfee.setUsername(datepay.getUsername());
						vipfee.setDate(datepay.getAbdate());
						vipfee.setDesc(datepay.getRegid());
						vipfee.setIn(datepay.getJc());
						vipfee.setServicefee(0.05);
						vipfee.setServicejine(datepay.getJc()*0.05);
						result.add(vipfee);
					  }
				}
			}
		}
		
		return result;
	}
	
	public List<VipCjbOfDay> vipCjbOfDayList(String searchUserName, String startTime, String endTime) {
		
		

		UserService userService = ServiceCacheFactory.getService(UserService.class);
	    Gcuser gcuser = userService.getUserByUserName(searchUserName);
		
	    if(searchUserName==null){
			throw new ServiceException(3,"玩家不能为空！");
		}
	    
	    if(Strings.isNullOrEmpty(startTime)||Strings.isNullOrEmpty(endTime)){
		    	throw new ServiceException(4,"开始时间或结束时间不能为空！");
	    }
	    if(gcuser==null){
			throw new ServiceException(1,"玩家不存在！");
		}
		if(DateUtils.compareDateStr(startTime,endTime)==1){
			throw new ServiceException(2,"结束时间要大于开始时间！");
		}
		
		
		List<String> datelist = DateUtils.separateDateStr(startTime, endTime, DateUtils.DAY_MSELS, DateUtils.YYYY_MM_DD_SDF);
		List<VipCjbOfDay> dayOfYbList = new ArrayList<VipCjbOfDay>();
		
		for (int i = 0; i < datelist.size(); i++) {
			String today = datelist.get(i);
			String startDate =today + " 00:00:00";
			String endDate = today + " 23:59:59";
			double zc = vipcjglDao.getSumVipZc(searchUserName, startDate, endDate);
			double sr = vipcjglDao.getSumVipSr(searchUserName, startDate, endDate);
			if(sr!=0){
				VipCjbOfDay vipCjbOfDay= new VipCjbOfDay();
				vipCjbOfDay.setDate(today);
				vipCjbOfDay.setSrCount(sr);
				vipCjbOfDay.setSrdesc("认购充值币");
				dayOfYbList.add(vipCjbOfDay);
			}
			if(zc!=0){
				VipCjbOfDay vipCjbOfDay= new VipCjbOfDay();
				vipCjbOfDay.setDate(today);
				vipCjbOfDay.setZcCount(zc);
				vipCjbOfDay.setSrdesc("销售充值币");
				dayOfYbList.add(vipCjbOfDay);
			}
				
			
		}
		return dayOfYbList;
	}
	
}
