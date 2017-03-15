package com.yq.manager.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Lists;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.Page;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.config.ConfigLoader;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.module.web.session.Session;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.FileCreatUtil;
import com.yq.common.utils.Global;
import com.yq.common.utils.MD5Security;
import com.yq.cservice.bean.SqDayAddBean;
import com.yq.manage.bean.AdminOperateLog;
import com.yq.manage.bean.ManageUser;
import com.yq.manage.dao.AdminOperateLogDao;
import com.yq.manage.dao.ManageUserDao;
import com.yq.manage.util.AdminGlobal;
import com.yq.manager.bean.Performance;
import com.yq.manager.bean.UserPerformanceSearch;
import com.yq.manager.bean.UserStatBean;
import com.yq.manager.bean.YbCjbBean;
import com.yq.manager.bo.BackCountBean;
import com.yq.manager.bo.DateBean;
import com.yq.manager.bo.GcfhBean;
import com.yq.manager.bo.PmmltBean;
import com.yq.manager.bo.PointsChangeLog;
import com.yq.manager.bo.UserVipLog;
import com.yq.manager.bo.W10Bean;
import com.yq.manager.bo.Zq2016stat;
import com.yq.manager.bo.ZqStat;
import com.yq.manager.dao.AddShengDao;
import com.yq.manager.dao.FhdateDao;
import com.yq.manager.dao.MqfhDao;
import com.yq.manager.dao.MtfhtjDao;
import com.yq.manager.dao.PointsChangeLogDao;
import com.yq.manager.dao.SgtjDao;
import com.yq.manager.dao.UserVipLogDao;
import com.yq.manager.dao.Zq2016statDao;
import com.yq.user.bean.TopReward;
import com.yq.user.bo.AbsModifyUserLog;
import com.yq.user.bo.Addsheng;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Cpuser;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Dateip;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Dgag;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Fhdate;
import com.yq.user.bo.Gcfh;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.GcuserForExcel;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.ModifyUserLog;
import com.yq.user.bo.Mtfhtj;
import com.yq.user.bo.Sgtj;
import com.yq.user.bo.Sgxt;
import com.yq.user.bo.SysBiLog;
import com.yq.user.bo.Tduser;
import com.yq.user.bo.Txpay;
import com.yq.user.bo.TxpayIndex;
import com.yq.user.bo.UserExtinfo;
import com.yq.user.bo.UserPerformance;
import com.yq.user.bo.UserProperty;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.bo.Vipxtgc;
import com.yq.user.bo.YouMingxi;
import com.yq.user.bo.ZuoMingxi;
import com.yq.user.constant.GpjyChangeType;
import com.yq.user.constant.YbChangeType;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.CpuserDao;
import com.yq.user.dao.DatePayDao;
import com.yq.user.dao.DatecjDao;
import com.yq.user.dao.DateipDao;
import com.yq.user.dao.DgagDao;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.GcfhDao;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.GpjyDao;
import com.yq.user.dao.InterRegionCodeDao;
import com.yq.user.dao.JfcpDao;
import com.yq.user.dao.ModifyUserLogDao;
import com.yq.user.dao.SgxtDao;
import com.yq.user.dao.SysBiLogDao;
import com.yq.user.dao.TduserDao;
import com.yq.user.dao.TxPayDao;
import com.yq.user.dao.TxifokDao;
import com.yq.user.dao.UserExtinfoDao;
import com.yq.user.dao.UserPerformanceDao;
import com.yq.user.dao.UserPropertyDao;
import com.yq.user.dao.VipcjglDao;
import com.yq.user.dao.VipxtgcDao;
import com.yq.user.dao.YouMingXiDao;
import com.yq.user.dao.ZuoMingxiDao;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;
import com.yq.user.utils.Ref;
import com.yq.user.utils._99douInterface;

public class AdminService {
	@Autowired
	private FcxtDao fcxtDao;
	@Autowired
	private SgtjDao sgtjDao;
	@Autowired
	private BdbDateDao bdbDateDao;
	@Autowired
	private GpjyDao gpjyDao;
	@Autowired
	private GcfhDao gcfhDao;
	@Autowired
	private TxPayDao txPayDao;
	@Autowired
	private FhdateDao fhDateDao;
	@Autowired
	private MqfhDao mqfhDao;
	@Autowired
	private AddShengDao addShengDao;
	@Autowired
	private GcuserDao gcuserDao;
	@Autowired
	private LogService logService;
	@Autowired
	private DatecjDao datecjDao;
	@Autowired
	private SgxtDao sgxtDao;
	@Autowired
	private ZuoMingxiDao zuoMingxiDao;
	@Autowired
	private YouMingXiDao youMingXiDao;
	@Autowired
	private TxifokDao txifokDao;
	@Autowired
	private MtfhtjDao mtfhtjDao;
	@Autowired
	private DateipDao dateipDao;
	@Autowired
	private CpuserDao cpuserDao;
	@Autowired
	private JfcpDao jfcpDao;
	@Autowired
	private DgagDao dgagDao;
	@Autowired
	private DatePayDao datePayDao;
	@Autowired
	private UserService userService;
	@Autowired
	private VipcjglDao vipcjglDao;
	@Autowired
	private TduserDao tduserDao;
	@Autowired
	private TxPayDao txpayDao;
	@Autowired
	private VipxtgcDao vipxtgcDao;
	@Autowired
	private UserPerformanceDao userPerformanceDao;
	@Autowired
	private UserExtinfoDao userExtinfoDao;
	@Autowired
	private PointsChangeLogDao pointsChangeLogDao;
	@Autowired
	private UserVipLogDao userVipLogDao;
	@Autowired
	private SysBiLogDao sysBiLogDao;
	@Autowired
	private UserPropertyDao userPropertyDao;
	@Autowired
	private InterRegionCodeDao interRegionCodeDao;	
	@Autowired
	private ModifyUserLogDao modifyUserLogDao;
	@Autowired
	private AdminOperateLogDao adminOperateLogDao;
	@Autowired
	private ManageUserDao manageDao;
	@Autowired
	private Zq2016statDao zq2016statDao;
	
	
  	private Cache<String,Session> adminUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();
  	
    public static boolean isClose = ConfigLoader.getIntValue("is_stop_jf_mc",0)==0?false:true;
    
	public Session getLoginAdminUserName(String sessionId){
		Session adminSession = adminUserMap.getIfPresent(sessionId);
		return adminSession;
	}
	/**
	 * 管理员登录
	 * @param userName
	 * @param password
	 * @param sessionId
	 */
	public boolean adminLogin(String userName,String password,String sessionId){
		String md5pass = MD5Security.md5_16(password);
		ManageUser admin = manageDao.getByUserNameAndPassword(userName, md5pass);
		if(admin!=null){
			Session session = new Session(userName, System.currentTimeMillis(), sessionId);
			adminUserMap.put(sessionId, session);
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * @param adminUserName
	 * @param passWord
	 * @param sessionId
	 * @return
	 */
	public boolean adminUserLogin(String adminUserName, String passWord, HttpSession session, String ip) {
		AdminOperateLog log= new AdminOperateLog(adminUserName,ip , new Date(), AdminGlobal.LOGIN_EVENT, "后台登录");
		adminOperateLogDao.addLog(log);
		return adminLogin(adminUserName, passWord, session.getId());
	}
	
	public IPage<Gcfh> getAllGcfhPage(int pageIndex,int pageSize){
		return gcfhDao.getAllPageList(pageSize, pageIndex);
	}
	
	public GcfhBean getGcfhBean(){
		GcfhBean result = new GcfhBean();
		result.setTotalIn(gcfhDao.getSumSyfhIn());
		result.setTotalOut(gcfhDao.getSumSyfhOut());
		String todayStr = DateUtils.getDate(new Date());
		String todayStart = todayStr+" 00:00:00";
		String todayEnd = todayStr+" 23:59:59";
		
		String yesterdayStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -1));
		String yesterdayStart = yesterdayStr+" 00:00:00";
		String yesterdayEnd = yesterdayStr+" 23:59:59";
		
		result.setTodayIn(gcfhDao.getDateSumSyfhIn(todayStart, todayEnd));
		result.setTodayOut(gcfhDao.getDateSumSyfhOut(todayStart, todayEnd));
		
		result.setYesterdayIn(gcfhDao.getDateSumSyfhIn(yesterdayStart, yesterdayEnd));
		result.setYeaterdayOut(gcfhDao.getDateSumSyfhOut(yesterdayStart, yesterdayEnd));
		return result;
	}
	
	public Double getSumpayNumOfTxpay(){
		return txPayDao.getSumPayNum();
	}
	
	public IPage<Txpay> getTxpayPageList(int pageIndex,int pageSize){
		return txPayDao.getPageListOrder(pageIndex, pageSize);
	}
	
	public void logout(String sessionId){
		adminUserMap.invalidate(sessionId);
	}
	
	public IPage<Sgtj> getSgtjPageList(int pageIndex,int pageSize){
		return sgtjDao.getPageList(pageIndex, pageSize);
	}
	
	public IPage<Bdbdate> getBdbdatePageListByUserNameAndDate(String zuser,String startDate,String endDate,int pageIndex,int pageSize){
		return bdbDateDao.getPageListByUserNameAndDate(zuser, startDate, endDate, pageSize, pageIndex);
	}
	
	public List<Bdbdate> getBdbdateListByUserNameAndDate(String zuser,String startDate,String endDate){
		return bdbDateDao.getListByUserNameAndDate(zuser, startDate, endDate);
	}
	
	public IPage<Bdbdate> getBdbdatePageList(int pageIndex,int pageSize){
		return bdbDateDao.getALLPageList(pageSize, pageIndex);
	}
	public IPage<Gpjy> getGpjyPageList(int pageIndex,int pageSize){
		return gpjyDao.getPageList(pageIndex, pageSize);
	}
	
	public IPage<Gpjy> getAdminMcPageList(int pageIndex,int pageSize){
		return gpjyDao.getAdminMcPage(pageIndex, pageSize);
	}
	
	public IPage<Gpjy> getAdminMyPageList(int pageIndex,int pageSize){
		return gpjyDao.getAdminMrPage(pageIndex, pageSize);
	}
	
	public IPage<Fhdate> getFhdatePageList(int pageIndex,int pageSize){
		return fhDateDao.getPageList(pageIndex, pageSize);
	}
	
	public IPage<Gpjy> searchGpjyPageList(String field,String value,int pageIndex,int pageSize){
		return gpjyDao.getSearchResultPageDetailsList(field, value, pageIndex, pageSize);
	}
	
	public Double getTodaySumpdlj(){
		String todayStr = DateUtils.getDate(new Date());
		String todayStart = todayStr+" 00:00:00";
		String todayEnd = todayStr+" 23:59:59";
		return mqfhDao.getSumpdlb(todayStart, todayEnd);
	}
	
	public Fhdate getFirstFhdate(){
		return fhDateDao.get();
	}
	/**
	 * 计算昨日收益
	 */
	public void countYesterday(){
		mqfhDao.update();
		
		String yesterdayStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -1));
		String yesterdayStart = yesterdayStr+" 00:00:00";
		String yesterdayEnd = yesterdayStr+" 23:59:59";
		
		Double yesterdaySumPdlj = mqfhDao.getSumpdlb(yesterdayStart, yesterdayEnd);
		
		Double beforeYesterdaySumPdlj = mqfhDao.getSumpdlb("1970-1-1 00:00:00", yesterdayStart);
		
		Double mqPaySum = mqfhDao.getSumMqpay();
		
		Fhdate fhdate = new Fhdate();
		fhdate.setAbdate(DateUtils.addDay(new Date(), -1));
		fhdate.setZly(yesterdaySumPdlj);
		int cjt = (int)(yesterdaySumPdlj+beforeYesterdaySumPdlj);
		fhdate.setFhk(cjt);
		fhdate.setTjmq(mqPaySum);
		fhdate.setVipfhpay(0.005);
		fhdate.setFhpay(0.001);
		fhDateDao.add(fhdate);
		
		
		Addsheng addsheng = new Addsheng();
		addsheng.setDate(DateUtils.addDay(new Date(), -1));
		
		
		addsheng.setCg(yesterdaySumPdlj.intValue());
		addsheng.setBj(mqfhDao.getSumpdlbByArea("北京市", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setTj(mqfhDao.getSumpdlbByArea("天津市", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setHb(mqfhDao.getSumpdlbByArea("河北省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setSx(mqfhDao.getSumpdlbByArea("山西省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setNmg(mqfhDao.getSumpdlbByArea("内蒙古自治区", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setLn(mqfhDao.getSumpdlbByArea("辽宁省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setJl(mqfhDao.getSumpdlbByArea("吉林省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setHlj(mqfhDao.getSumpdlbByArea("黑龙江省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setSh(mqfhDao.getSumpdlbByArea("上海市", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setJs(mqfhDao.getSumpdlbByArea("江苏省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setZz(mqfhDao.getSumpdlbByArea("浙江省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setNf(mqfhDao.getSumpdlbByArea("安徽省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setFz(mqfhDao.getSumpdlbByArea("福建省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setZx(mqfhDao.getSumpdlbByArea("江西省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setHn(mqfhDao.getSumpdlbByArea("河南省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setHbs(mqfhDao.getSumpdlbByArea("湖北省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setHns(mqfhDao.getSumpdlbByArea("湖南省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setGd(mqfhDao.getSumpdlbByArea("广东省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setGx(mqfhDao.getSumpdlbByArea("广西壮族自治区", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setNn(mqfhDao.getSumpdlbByArea("海南省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setCq(mqfhDao.getSumpdlbByArea("重庆市", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setXc(mqfhDao.getSumpdlbByArea("四川省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setGz(mqfhDao.getSumpdlbByArea("贵州省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setUn(mqfhDao.getSumpdlbByArea("云南省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setXz(mqfhDao.getSumpdlbByArea("西藏自治区", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setSxs(mqfhDao.getSumpdlbByArea("陕西省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setJs(mqfhDao.getSumpdlbByArea("甘肃省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setQh(mqfhDao.getSumpdlbByArea("青海省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setNs(mqfhDao.getSumpdlbByArea("宁夏回族自治区", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setSj(mqfhDao.getSumpdlbByArea("新疆维吾尔自治区", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setTw(mqfhDao.getSumpdlbByArea("台湾省", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setSg(mqfhDao.getSumpdlbByArea("香港特别行政区", yesterdayStart, yesterdayEnd).intValue());
		addsheng.setOm(mqfhDao.getSumpdlbByArea("澳门特别行政区", yesterdayStart, yesterdayEnd).intValue());
		addShengDao.add(addsheng);
	}
	/**
	 * 双区用户分红
	 * @param pdid
	 */
	public void sendDoubleArea(int pdid){
		Fhdate fhdate = fhDateDao.getById(pdid);
		if(fhDateDao.updateBz(pdid, 1)){
			String todayStr = DateUtils.getDate(new Date());
			String todayStart = todayStr+" 00:00:00";
			mqfhDao.updateDoubleAreaFh(fhdate.getVipfhpay(), todayStart);
		}
	}
	/**
	 * 普通用户分红
	 * @param pdid
	 */
	public void sendCommonUser(int pdid){
		Fhdate fhdate = fhDateDao.getById(pdid);
		if(fhDateDao.updateBz(pdid, 2)){
			String todayStr = DateUtils.getDate(new Date());
			String todayStart = todayStr+" 00:00:00";
			mqfhDao.updateCommonUserFh(fhdate.getFhpay(), todayStart);
		}
	}
	/**
	 * 搜索用户
	 * @param param
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> searchUser(String param,int pageIndex,int pageSize){
		return gcuserDao.searchPage(param, pageIndex, pageSize);
	}
	/**
	 * 更新用户信息
	 * @param userName
	 * @param password3
	 * @param card
	 * @param bank
	 * @param name
	 * @param call
	 * @param email
	 * @param qq
	 * @param userid
	 * @param payok
	 * @param jcname
	 * @param jcuserid
	 * @param password
	 * @param pwdate
	 * @param cxt
	 * @param ip
	 * @param updateDownPayOk
	 * @param areaCode
	 * @param operator
	 * @return
	 */
	@Transactional
	public boolean updateUser(String userName,String password3,String card, String bank,  String name, String call,String  email,String qq,String userid,int payok,String jcname,String jcuserid,String password,String pwdate,int cxt,String ip,String updateDownPayOk,int areaCode,String operator){
		Gcuser gcuser = gcuserDao.getUser(userName);
		Date date = null;
		if(!Strings.isNullOrEmpty(pwdate)){
			try {
				date = DateUtils.StringToDate(pwdate, DateStyle.YYYY_MM_DD_HH_MM_SS);
			} catch (Exception e) {
				throw new ServiceException(1, "机票限制时间格式不对 请使用 如:'2015-10-12 21:10:00' ！");
			}
		}
		String md5Password = null;
		if(!Strings.isNullOrEmpty(password)){
			md5Password = MD5Security.md5_16(password);
		}
		
		String beforUserId = gcuser.getUserid()==null?"":gcuser.getUserid();
		String nowUserId = userid==null?"":userid;
		String beforName = gcuser.getName()==null?"":gcuser.getName();
		String nowName = name==null?"":name;
		
		
		
		if(gcuserDao.updateUserByAdmin(userName,password3, card, bank, nowName, call, email, qq, nowUserId, payok, jcname, jcuserid, md5Password,date,cxt)){
			dateipDao.addDateIpLog(userName, "修改资料sy-"+userName, ip);
		}
		int oldareaCode=86;
		if(areaCode!=0&&interRegionCodeDao.isHasByRegioncode(areaCode)){
			if(userPropertyDao.isHasUserpropertyByName(userName)){
				oldareaCode =userPropertyDao.getPorpertyByName(userName).getRegion_code();
				userPropertyDao.updateUserAreaCodeByName(userName,areaCode);
			}else{
				UserProperty userproperty= new UserProperty();
				userproperty.setRegion_code(areaCode);
				userproperty.setUsername(userName);
				userPropertyDao.insertUserProperty(userproperty);
			}
			
		}
		
		//增加用户更新日志 
		ModifyUserLog modifyUserLog = new ModifyUserLog(userName, password3, card, bank, nowName, call, email, qq, nowUserId, payok, jcname, jcuserid, md5Password, date, cxt, areaCode, gcuser.getUsername(), gcuser.getPassword3(), gcuser.getCard(), gcuser.getBank(), gcuser.getName(), gcuser.getCall(), gcuser.getEmail(), gcuser.getQq(), gcuser.getUserid(), gcuser.getPayok(), gcuser.getJcname(), gcuser.getJcuserid(), gcuser.getPassword(), gcuser.getPwdate(), gcuser.getCxt(), oldareaCode, new Date(), operator);
		
		modifyUserLogDao.add(modifyUserLog);
		
		 AdminOperateLog log= new AdminOperateLog(operator,"", new Date(), AdminGlobal.OP_MODIFYVIP, "修改资料"+userName);
		 adminOperateLogDao.addLog(log);
		
		if(!beforUserId.equals(nowUserId)||!beforName.equals(nowName)){
			//写身份证和名字修改日志
			Tduser tduser = new Tduser();
			tduser.setGainame(gcuser.getName());
			tduser.setTdname(name);
			tduser.setGaiuserid(gcuser.getUserid());
			tduser.setTduserid(userid);
			tduser.setTduser(userName);
			tduser.setTdqq(qq);
			tduser.setTdcall(call);
			tduser.setGai(1);
			tduserDao.add(tduser);
		}else{
			gcuserDao.updateThenSameUserInfo(beforUserId, beforName, md5Password, password3, card, bank, call, email, qq);
		}
		
		if(md5Password!=null){
			dateipDao.addDateIpLog("admin", "修改密码sy-"+userName, ip);
		}
		//更新其下所有同名用户的信息
		if("ok".equals(updateDownPayOk)){
			gcuserDao.updatePayOk(nowName, nowUserId, payok);
			LogSystem.log("修改"+userName+",下所有同名账号的payok,name="+nowName+",nowUserId="+nowUserId+",payok="+payok);
		}
		
		return true;
	}
	/**
	 * 给用户充值
	 * @param chargeUser
	 * @param amount
	 * @param bank
	 * @param operator
	 */
	@Transactional
	public void chargeToUser(String chargeUser,int amount,String bank,String operator,String ip){
		Gcuser gcuser = gcuserDao.getUser(chargeUser);
		if(gcuser==null){
			throw new ServiceException(1, "该会员不存在，请检查输入是否正确！");
		}
		Fcxt fcxt = fcxtDao.getFcxt(operator);
		if(fcxt==null){
			throw new ServiceException(2, "操作员不存在，请检查输入是否正确！");
		}
		
		if(!gcuserDao.updateCjtj(chargeUser, amount)){
			throw new ServiceException(3000, "更新失败");
		}
		boolean result = false;
 
		if(amount==5000&&gcuser.getSyep()>4999){
			result = updateSybdbByManager(chargeUser, 5000, 10000, 10000, "充值5000与EP5000生效");
		}else if(amount==10000&&gcuser.getSyep()==5000){
			result = updateSybdbByManager(chargeUser, 5000, 15000, 15000, "充值10000与EP5000生效");
		}else if(amount==10000&&gcuser.getSyep()>9999){
			result = updateSybdbByManager(chargeUser, 10000, 20000, 20000, "充值10000与EP10000生效");
		}else if(amount==15000&&gcuser.getSyep()==5000){
			result = updateSybdbByManager(chargeUser, 5000, 20000, 20000, "充值15000与EP5000生效");
		}else if(amount==15000&&gcuser.getSyep()==10000){
			result = updateSybdbByManager(chargeUser, 10000, 25000, 25000, "充值15000与EP10000生效");
		}else if(amount==15000&&gcuser.getSyep()>14999){
			result = updateSybdbByManager(chargeUser, 15000, 30000, 30000, "充值15000与EP15000生效");
		}else if(amount==20000&&gcuser.getSyep()==5000){
			result = updateSybdbByManager(chargeUser, 5000, 25000, 25000, "充值20000与EP5000生效");
		}else if(amount==20000&&gcuser.getSyep()==10000){
			result = updateSybdbByManager(chargeUser, 10000, 30000, 30000, "充值20000与EP10000生效");
		}else if(amount==20000&&gcuser.getSyep()>19999){
			result = updateSybdbByManager(chargeUser, 20000, 40000, 40000, "充值20000与EP20000生效");
		}else if(amount>4999){
			result = updateSybdbByManager(chargeUser, 0, amount, amount, "充值");
		}else{
			result = gcuserDao.addOnlyYb(chargeUser, amount);
			gcuser = gcuserDao.getUser(chargeUser);
			Datepay datepay = new Datepay();
			datepay.setUsername(chargeUser);
			datepay.setRegid("充值");
			datepay.setSyjz(amount);
			datepay.setPay(gcuser.getPay());
			datepay.setJydb(gcuser.getJydb());
			datepay.setOrigintype(YbChangeType.SYSTEM_CHONZHI);
			logService.addDatePay(datepay);
		}
		if(!result){
			throw new ServiceException(3000, "更新失败");
		}
		
		gcuser = gcuserDao.getUser(chargeUser);
		Datecj datecj = new Datecj();
		datecj.setCjuser(chargeUser);
		datecj.setDqcj(amount);
		datecj.setLjcj(gcuser.getCjtj());
		datecj.setCjfs(bank);
		datecj.setCz(operator);
		datecj.setIp(ip);
		datecjDao.add(datecj);
	}
	
	public void pmToUser(String chargeUser,int amount,String operator){
		Gcuser gcuser = gcuserDao.getUser(chargeUser);
		if(gcuser==null||gcuser.getSjb()>0){
			throw new ServiceException(1, "该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！");
		}
		Fcxt fcxt = fcxtDao.getFcxt(operator);
		if(fcxt==null){
			throw new ServiceException(2, "操作员不存在，请检查输入是否正确！");
		}
		
		int sjb = amount/500;
		gcuserDao.updateSjb(chargeUser, sjb);
		
	}
	
	
	public PmmltBean pmmlt(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		int sjb = gcuser.getSjb();
		int fd=0;
		int cfd=0;
		if (sjb==1){
			fd=2000;cfd=20;
		}else if(sjb==2){
			fd=4000;cfd=40;
		}else if(sjb==4){
			fd=8000;cfd=60;
		}else if(sjb==10){
			fd=20000;cfd=80;
		}else if(sjb==20){
			fd=40000;cfd=100;
		}else if(sjb==40){
			fd=80000;cfd=150;
		}else if(sjb==100){
			fd=200000;cfd=200;
		}
		
		Sgxt last = sgxtDao.getLast();
		
		Gcuser rs10 = gcuserDao.getUser(gcuser.getUp());
		
		Gcuser rs11 = gcuserDao.getUser(rs10.getUp());
		
		Gcuser rs12 = gcuserDao.getUser(rs11.getUp());
		
		Gcuser rs13 = gcuserDao.getUser(rs12.getUp());
		
		Gcuser rs14 = gcuserDao.getUser(rs13.getUp());
		
		String myup = "";
		if(rs10.getSjb()>0){
			myup = rs10.getUsername();
		}else if(rs11.getSjb()>0){
			myup = rs11.getUsername();
		}else if(rs12.getSjb()>0){
			myup = rs12.getUsername();
		}else if(rs13.getSjb()>0){
			myup = rs13.getUsername();
		}else if(rs14.getSjb()>0){
			myup = rs14.getUsername();
		}else{
			myup = last.getUsername();
		}
		
		PmmltBean result = generatorPmmltBean(userName,myup);
		
		Sgxt sgxt = new Sgxt();
		sgxt.setUsername(userName);
		sgxt.setSjb(sjb);
		sgxt.setFdpay(fd);
		sgxt.setCfd(cfd);
		sgxt.setXxnew(3);
		sgxt.setFhbl(0.005);
		sgxt.setZfh(sjb*250);
		sgxt.setBddate(new Date());
		sgxtDao.add(sgxt);
		
		return result;
	}
	/**
	 * 
	 * @param userName
	 * @return
	 */
	public PmmltBean bsReg(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		Sgxt rs2 = sgxtDao.get(userName);
		if(rs2==null){
			throw new ServiceException(4, "报单人还没有登记双轨系统，没办法补选，请检查输入是否正确！");
		}
		
		Sgxt rs1 = sgxtDao.getByAOrBuid(userName);
		if(rs1!=null){
			throw new ServiceException(2, "报单人已安置好，不能重复，请检查输入是否正确！");
		}
		Sgxt last = sgxtDao.getLast();
		Gcuser rs10 = gcuserDao.getUser(gcuser.getUp());
		Gcuser rs11 = gcuserDao.getUser(rs10.getUp());
		Gcuser rs12 = gcuserDao.getUser(rs11.getUp());
		Gcuser rs13 = gcuserDao.getUser(rs12.getUp());
		Gcuser rs14 = gcuserDao.getUser(rs13.getUp());
		
		String myup = "";
		if(rs10.getSjb()>0){
			myup = rs10.getUsername();
		}else if(rs11.getSjb()>0){
			myup = rs11.getUsername();
		}else if(rs12.getSjb()>0){
			myup = rs12.getUsername();
		}else if(rs13.getSjb()>0){
			myup = rs13.getUsername();
		}else if(rs14.getSjb()>0){
			myup = rs14.getUsername();
		}else{
			myup = last.getUsername();
		}
		PmmltBean result = generatorPmmltBean(userName,myup);
		return result;
	}
	
	public PmmltBean mlt(String userName,String myup){
		Sgxt rs0 = sgxtDao.get(userName);
		if(rs0==null){
			throw new ServiceException(1, "报单人不存在，请检查输入是否正确！");
		}
		Sgxt rs1 = sgxtDao.getByAOrBuid(userName);
		if(rs1!=null){
			throw new ServiceException(2, "报单人已安置好，不能重复，请检查输入是否正确！");
		}
		Sgxt rs = sgxtDao.get(myup);
		if(rs==null){
			throw new ServiceException(3, "上级不存在，请检查输入是否正确！");
		}
		return generatorPmmltBean(userName, myup);
	}
	
	/**
	 * 
	 * @param userName
	 * @param myup
	 * @return
	 */
	private PmmltBean generatorPmmltBean(String userName,String myup){
		Sgxt rs = sgxtDao.get(myup);
		String rsauid = null;
		String rsbuid = null;
		String rs21auid = null;
		String rs21buid = null;
		String rs22auid = null;
		String rs22buid = null;
		String rs31auid = null;
		String rs31buid = null;
		String rs32auid = null;
		String rs32buid = null;
		String rs33auid = null;
		String rs33buid = null;
		String rs34auid = null;
		String rs34buid = null;
		if(rs!=null){
			if(!Strings.isNullOrEmpty(rs.getAuid())){
				rsauid = rs.getAuid();
				Sgxt rs21 = sgxtDao.get(rsauid);
				if(rs21!=null){
					if(!Strings.isNullOrEmpty(rs21.getAuid())){
						rs21auid = rs21.getAuid();
					}
					if(!Strings.isNullOrEmpty(rs21.getBuid())){
						rs21buid = rs21.getBuid();
					}
				}
			}
			if(!Strings.isNullOrEmpty(rs.getBuid())){
				rsbuid = rs.getBuid();
				Sgxt rs22 = sgxtDao.get(rsbuid);
				if(rs22!=null){
					if(!Strings.isNullOrEmpty(rs22.getAuid())){
						rs22auid = rs22.getAuid();
					}
					if(!Strings.isNullOrEmpty(rs22.getBuid())){
						rs22buid = rs22.getBuid();
					}
				}
			}
			
			if(rs21auid!=null){
				Sgxt rs31 = sgxtDao.get(rs21auid);
				if(rs31!=null){
					if(!Strings.isNullOrEmpty(rs31.getAuid())){
						rs31auid = rs31.getAuid();
					}
					if(!Strings.isNullOrEmpty(rs31.getBuid())){
						rs31buid = rs31.getBuid();
					}
				}
			}
			if(rs21buid!=null){
				Sgxt rs32 = sgxtDao.get(rs21buid);
				if(rs32!=null){
					if(!Strings.isNullOrEmpty(rs32.getAuid())){
						rs32auid = rs32.getAuid();
					}
					if(!Strings.isNullOrEmpty(rs32.getBuid())){
						rs32buid = rs32.getBuid();
					}
				}
			}
			if(rs22auid!=null){
				Sgxt rs33 = sgxtDao.get(rs22auid);
				if(rs33!=null){
					if(!Strings.isNullOrEmpty(rs33.getAuid())){
						rs33auid = rs33.getAuid();
					}
					if(!Strings.isNullOrEmpty(rs33.getBuid())){
						rs33buid = rs33.getBuid();
					}
				}
			}
			if(rs22buid!=null){
				Sgxt rs34 = sgxtDao.get(rs22buid);
				if(rs34!=null){
					if(!Strings.isNullOrEmpty(rs34.getAuid())){
						rs34auid = rs34.getAuid();
					}
					if(!Strings.isNullOrEmpty(rs34.getBuid())){
						rs34buid = rs34.getBuid();
					}
				}
			}
		}
		return new PmmltBean(userName, myup, rsauid, rsbuid, rs21auid, rs21buid, rs22auid, rs22buid, rs31auid, rs31buid, rs32auid, rs32buid, rs33auid, rs33buid, rs34auid, rs34buid);
	}
	
	/**
	 * 更新报单币
	 * @param userName
	 * @param changeNum
	 * @param desc
	 * @return
	 */
	private boolean updateSybdbByManager(String userName,int syep,int ljbdb,int sybdb,String desc){
		if(syep>=0){
			boolean result = gcuserDao.updateSyepLjbdbSybdb(userName, syep,ljbdb,sybdb);
			if(result){
				Gcuser gcuser = gcuserDao.getUser(userName);
				Bdbdate bdbdate = new Bdbdate();
				bdbdate.setZuser(userName);
				bdbdate.setBz(desc);
				bdbdate.setSy(sybdb);
				bdbdate.setSybdb(gcuser.getSybdb());
				bdbdate.setLjbdb(gcuser.getLjbdb());
				bdbDateDao.add(bdbdate);
			}
			return result;
		}else{
//			changeNum = Math.abs(changeNum);
//			boolean result = gcuserDao.reduceSybdb(userName, changeNum);
//			if(result){
//				Gcuser gcuser = gcuserDao.getUser(userName);
//				Bdbdate bdbdate = new Bdbdate();
//				bdbdate.setZuser(userName);
//				bdbdate.setBz(desc);
//				bdbdate.setSy(changeNum);
//				bdbdate.setSybdb(gcuser.getSybdb());
//				bdbdate.setLjbdb(gcuser.getLjbdb());
//				bdbDateDao.add(bdbdate);
//			}
			throw new ServiceException(3000,"暂时不支持负数");
		}
	}
	/**
	 * 修改股份和积分
	 * @param userName
	 * @param addGfAmount
	 * @param addJfAmount
	 */
	public void editGfAndJf(String userName,int addGfAmount,int addJfAmount){
		gpjyDao.update(userName, addJfAmount, "系统配送");
		gcfhDao.update(userName, "系统配送", addGfAmount);
	}
	
	public Gcfh getGcfh(String userName,String bz){
		return gcfhDao.get(userName, bz);
	}
	public Gpjy getGpjy(String userName,String dfuser){
		return gpjyDao.get(userName, dfuser);
	}
	/**
	 * 修改积分
	 * @param userName
	 * @param addAmount
	 */
	public void addJf(String userName,int addAmount){
		if (!gcuserDao.updateJyg(userName, - addAmount)) {
			throw new ServiceException(3000, "未知错误");
		}
        
		Gcuser gcuser = gcuserDao.getUser(userName);
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(userName);
		gpjy.setMysl(new Double(addAmount));
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setBz("成功");
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setDfuser("系统");
		gpjyDao.add(gpjy);
	}
	/**
	 * 添加金币
	 * @param userName
	 * @param addAmount
	 */
	public void addJb(String userName,int addAmount){
		gcuserDao.addOnlyJB(userName, addAmount);
		Gcuser gcuser = gcuserDao.getUser(userName);
		Datepay datePay1 = new Datepay();
		datePay1.setUsername(userName);
		datePay1.setPay(gcuser.getPay());
		datePay1.setJydb(gcuser.getJydb());
		datePay1.setJyjz(addAmount);
		datePay1.setRegid("系统补");
		datePay1.setAbdate(new Date());
		logService.addDatePay(datePay1);
	}
	/**
	 * 修改成国内或国外玩家
	 * @param userName
	 * @param sjid
	 */
	public void changeArea(String userName,int sjid, String oparetor){
		gcuserDao.updateGwuid(userName, sjid);
		AdminOperateLog log=null;
		if(sjid==0){
			log= new AdminOperateLog(oparetor,"", new Date(), AdminGlobal.OP_SETOVERSEAS, userName+"被设置成国内玩家");
		}
		if(sjid==1){
			log= new AdminOperateLog(oparetor,"", new Date(), AdminGlobal.OP_SETOVERSEAS, userName+"被设置成海外玩家");
		}
		adminOperateLogDao.addLog(log);
	}
	
	@Transactional
	public void Sgreg(String my,String up){
		if(sgxtDao.getByAOrBuid(my)!=null){
			throw new ServiceException(1, "报单人已安置好，不能重复，请检查输入是否正确！");
		}
		
		Gcuser rs_my = gcuserDao.getUser(my);
		if(rs_my==null){
			throw new ServiceException(3000, "未知错误");
		}
		int zjjb = 0 ;
		int cjpay = 0;		
		if(rs_my.getSjb()==1){
			   zjjb=200;cjpay=500;
		}else if(rs_my.getSjb()==2){
			   zjjb=450;cjpay=1000;
		}else if(rs_my.getSjb()==4){
			   zjjb=960;cjpay=2000;
		}else if(rs_my.getSjb()==10){
			   zjjb=2500;cjpay=5000;
		}else if(rs_my.getSjb()==20){
			   zjjb=5000;cjpay=10000;
		}else if(rs_my.getSjb()==40){
			   zjjb=11000;cjpay=20000;
		}else if(rs_my.getSjb()==100){
			   zjjb=30000;cjpay=50000;
		}
		
		gcuserDao.addOnlyJB(my, zjjb);
		gcuserDao.updateGmdate(my, new Date());
		rs_my = gcuserDao.getUser(my);
		Datepay datepay = new Datepay();
		datepay.setUsername(my);
		datepay.setRegid("消费"+cjpay+"送"+zjjb+"金币-"+rs_my.getUp());
		datepay.setJyjz(zjjb);
		datepay.setPay(rs_my.getPay());
		datepay.setJydb(rs_my.getJydb());
		logService.addDatePay(datepay);
		
		Sgxt sgxtUp = sgxtDao.get(up);
		if(sgxtUp==null){
			throw new ServiceException(2, "上层不存在，没法放置，请检查是否正确！");
		}
		if(Strings.isNullOrEmpty(sgxtUp.getAuid())){
			sgxtDao.updateAuid(up, my);
		}else if(Strings.isNullOrEmpty(sgxtUp.getBuid())){
			sgxtDao.updateBuid(up, my);
		}else{
			throw new ServiceException(3, "位置已被占用，请重新选择！");
		}
		
		Sgxt sgxtMy = sgxtDao.get(my);
		int sjb = sgxtMy.getSjb();
		//不知道在干嘛
		cupUser(my,my,1,sjb);
		//不知道在干嘛
		List<ZuoMingxi> zList = zuoMingxiDao.getDownList(my);
		if(zList!=null&&!zList.isEmpty()){
			for(ZuoMingxi zuoMingxi:zList){
				int sjtjzb = zuoMingxiDao.getSumSjb(zuoMingxi.getTjuser(), zuoMingxi.getCount());
				sgxtDao.updateZ(zuoMingxi.getTjuser(), sjtjzb-sjb, zuoMingxi.getCount());
			}
		}
		//不知道在干嘛
		List<YouMingxi> yList = youMingXiDao.getDownList(my);
		if(yList!=null&&!yList.isEmpty()){
			for(YouMingxi youMingxi:yList){
				int sjtjzb = youMingXiDao.getSumSjb(youMingxi.getTjuser(), youMingxi.getCount());
				sgxtDao.updateY(youMingxi.getTjuser(), sjtjzb-sjb, youMingxi.getCount());
			}
		}
		//更加不知道在干嘛
		CalculateQ(my, sjb);
	}
	
	private void CalculateQ(String userName,int sjb){
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(userName);
		if(sgxtBd!=null){
			if(userName.equals(sgxtBd.getAuid())){
				sgxtDao.updateZaq(sgxtBd.getUsername(), sjb);
				CalculateQ(sgxtBd.getUsername(),sjb);
			}else{
				sgxtDao.updateZbq(sgxtBd.getUsername(), sjb);
				CalculateQ(sgxtBd.getUsername(),sjb);
			}
		}
	}
	
	private void cupUser(String my,String constUp,int count,int constSjb){
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(my);
		if(sgxtBd!=null){
			if(my.equals(sgxtBd.getAuid())){
				zuoMingxiDao.delete(sgxtBd.getUsername(), constUp, count);
				ZuoMingxi zuoMingxi = new ZuoMingxi();
				zuoMingxi.setTjuser(sgxtBd.getUsername());
				zuoMingxi.setSjb(constSjb);
				zuoMingxi.setDown(constUp);
				zuoMingxi.setCount(count);
				zuoMingxiDao.add(zuoMingxi);
			}else{
				youMingXiDao.delete(sgxtBd.getUsername(), constUp, count);
				YouMingxi youMingxi = new YouMingxi();
				youMingxi.setCount(count);
				youMingxi.setDown(constUp);
				youMingxi.setTjuser(sgxtBd.getUsername());
				youMingxi.setSjb(constSjb);
				youMingXiDao.add(youMingxi);
			}
			count = count+1;
			cupUser(sgxtBd.getUsername(),constUp,count,constSjb);
		}
	}
	
	public void delUser(String userName){
		
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(gcuser!=null&&(gcuser.getJb()>0||gcuser.getSjb()>0||gcuser.getPay()>0||gcuser.getJyg()>0)){
			throw new ServiceException(1, "已经是正式玩家，不能删除！！");
		}
		gcuserDao.delete(userName);
		txifokDao.delete(userName);
	}
	
	public IPage<Txpay> getTranserRecordList(int pageIndex,int pageSize){
		return txPayDao.getAdminPageList(pageIndex, pageSize);
	}
	
	public IPage<Mtfhtj> getMtfhtjPageList(int pageIndex,int pageSize){
		return mtfhtjDao.getPageList(pageIndex, pageSize, "order by fhdate desc");
	}
	
	public boolean isCanBackCount(){
		Mtfhtj mtfhtj = mtfhtjDao.getFirstOne("order by tjid desc");
		if(mtfhtj!=null){
			if(DateUtils.getIntervalDays(new Date(), mtfhtj.getFhdate())!=1){
				return true;
			}else{
				return false;
			}
		}
		return true;
	}
	
	public BackCountBean getBackCountBean(){
		BackCountBean backCountBean = new BackCountBean();
		String todayStr = DateUtils.getDate(new Date());
		String todayStart = todayStr+" 00:00:00";
		String todayEnd = todayStr+" 23:59:59";
		backCountBean.setRs_nd(sgxtDao.getSumSjbByTime(todayStart, todayEnd));
//		backCountBean.setRs_cb(sgxtDao.getSumZfh());
//		backCountBean.setRs_mq(sgxtDao.getSumMqfh());
		backCountBean.setRs_zd(sgxtDao.getSumSjb());
		String monthStr = DateUtils.DateToString(new Date(),DateStyle.YYYY_MM);
		String startMonthStr = monthStr+"-01 00:00:00";
		String endMonthStr = monthStr+"-31 23:59:59";
		backCountBean.setRs_month(sgxtDao.getSumSjbByTime(startMonthStr, endMonthStr));
		
		Calendar c = Calendar.getInstance();
		c.set(Calendar.MONTH, c.get(Calendar.MONTH)-1);
		String upMonthStr = DateUtils.DateToString(c.getTime(),DateStyle.YYYY_MM);
		String startUpMonthStr = upMonthStr+"-01 00:00:00";
		String endUpMonthStr = upMonthStr+"-31 23:59:59";
		backCountBean.setRs_up_month(sgxtDao.getSumSjbByTime(startUpMonthStr, endUpMonthStr));
		
		return backCountBean;
	}
	
	/**
	 * 执行双区计算
	 */
	public synchronized void doubelAreaCount(){
		Fcxt fcxt = fcxtDao.get(2);
		int mqbz = fcxt.getPayadd();
//		int sqbz = fcxt.getPayadd()-1;
		String lastname = fcxt.getLname();
		if(System.currentTimeMillis()<fcxt.getJsdate().getTime()){
			throw new ServiceException(1, "还没有到结算的日期（每星期二22点后）！");
		}
		IPage<Sgxt> page = null;
		Collection<Sgxt> tempData = null;
		int pageIndex = 0;
		int pageSize = 100;
		while(true){
			page = sgxtDao.getDoubleAreaCountPageList(pageIndex, pageSize);
			tempData = page.getData();
			if(tempData!=null&&tempData.size()>0){
				for(Sgxt sgxt:tempData){
					dealDoubleAreaCount(sgxt,fcxt);
				}
				
			}else{
				break;
			}
//			pageIndex++;
		}
		
		Double rs_sgaq = sgxtDao.getSumField("aq");
		Double rs_sgbq = sgxtDao.getSumField("bq");
		Double rs_mq = datePayDao.getSumSyjz(mqbz);
//		Sgtj sgtj = sgtjDao.get(sqbz);
//		Date jsdate = sgtj.getJsdate();
		Double rs_zd = sgxtDao.getSumField("sjb");
		Sgxt sgxt = sgxtDao.get(lastname);
		int lastid =sgxt.getId();
		Double rs_nd = sgxtDao.getSumSjbById(lastid);
		Double rs_cb = gcuserDao.getSumByField("cbpay");
		Double rs_pa = gcuserDao.getSumByField("pay");
		Double rs_tx = gcuserDao.getSumByField("txpay");
		Double rs_db = gcuserDao.getSumByField("jydb");
		Double rs_xt = gcuserDao.getSumByField("jyg");
		Double rs_fhg = gcuserDao.getSumByField("gdgc");
		Double rs_zfh = gcuserDao.getSumByField("ljfh");
		Double rs_ztx = txPayDao.getSumpayNumNoCondition();
		Sgtj sgtj2 = new Sgtj();
		
		sgtj2.setZd(rs_zd.intValue());
		sgtj2.setNd(rs_nd.intValue());
		sgtj2.setAq(rs_sgaq.intValue());
		sgtj2.setBq(rs_sgbq.intValue());
		sgtj2.setZpay(rs_mq.intValue());
		sgtj2.setAbp(rs_mq.intValue()/50);
		sgtj2.setLdpay((int)(rs_mq*0.1));
		sgtj2.setJsdate(new Date());
		sgtj2.setLjcb(rs_cb);
		sgtj2.setLjpa(rs_pa);
		sgtj2.setLjtx(rs_tx.intValue());
		sgtj2.setLjztx(rs_ztx.intValue());
		sgtj2.setLjdb(rs_db);
		sgtj2.setLjyg(rs_xt);
		sgtj2.setLjfhg(rs_fhg);
		sgtj2.setLjzfh(rs_zfh);
		sgtjDao.add(sgtj2);
		Sgxt rs_last = sgxtDao.getLast();
		Date jsDate = DateUtils.addDay(fcxt.getJsdate(), 7);
		fcxtDao.updateDoubleAreaCount(jsDate, rs_last.getUsername(), 2);
	}
	@Transactional
	private void dealDoubleAreaCount(Sgxt sgxt,Fcxt fcxt){
		int jsq = 0 ;
		if(sgxt.getAq()==sgxt.getBq()){
			jsq = sgxt.getBq();
		}else if(sgxt.getAq()<sgxt.getBq()){
			jsq = sgxt.getAq();
		}else if(sgxt.getAq()>sgxt.getBq()){
			jsq = sgxt.getBq();
		}
		int sgxtPay = 0;
		if(jsq*50>sgxt.getFdpay()){
			sgxtDao.updateDoubleCount(sgxt.getId(), sgxt.getFdpay(), sgxt.getFdpay()+sgxt.getCbpay(), 0, 0);
			sgxtPay = sgxt.getFdpay();
		}else{
			sgxtDao.updateDoubleCount(sgxt.getId(),jsq*50, jsq*50+sgxt.getCbpay(), sgxt.getAq()-jsq, sgxt.getBq()-jsq);
			sgxtPay = jsq*50;
		}
		
		Gcuser gcuser = gcuserDao.getUser(sgxt.getUsername());
		
		if(gcuser!=null){
			gcuserDao.addYbForDoubleAreaCount(gcuser.getUsername(), sgxtPay);
			Datepay datepay = new Datepay();
			datepay.setUsername(sgxt.getUsername());
			datepay.setRegid("游戏业务"+jsq+"平衡奖金");
			datepay.setPay(gcuser.getPay()+sgxtPay);
			datepay.setSyjz(sgxtPay);
			datepay.setJydb(gcuser.getJydb());
			datepay.setBz(fcxt.getPayadd());
			datepay.setNewbz(1);
			datepay.setOrigintype(YbChangeType.BALANCE_AWARD);
			logService.addDatePay(datepay);
			
			if(gcuser.getCxt()<3&&(gcuser.getCxdate()!=null&&gcuser.getCxdate().getTime()>System.currentTimeMillis())){
				gcuserDao.reduceYbForDoubleAreaCount(gcuser.getUsername(), sgxtPay);
				Datepay datepay2 = new Datepay();
				datepay2.setUsername(sgxt.getUsername());
				datepay2.setRegid("扣星期间不享受平衡奖金");
				datepay2.setPay(gcuser.getPay());
				datepay2.setJc(sgxtPay);
				datepay2.setJydb(gcuser.getJydb());
				datepay2.setBz(fcxt.getPayadd());
				datepay2.setNewbz(1);
				datepay2.setOrigintype(YbChangeType.BALANCE_AWARD_REDUCE);
				logService.addDatePay(datepay2);
			}
			
			//给他的上级处理
			Gcuser upUser = gcuserDao.getUser(gcuser.getUp());
			if(upUser!=null&&upUser.getSjb()>0){
				int addNum =  (int)(sgxtPay*0.1);
				gcuserDao.addYbForDoubleAreaCountJypay(upUser.getUsername(),addNum);
				Datepay datepay3 = new Datepay();
				datepay3.setUsername(upUser.getUsername());
				datepay3.setRegid(gcuser.getUsername()+"游戏业务"+jsq+"辅导奖");
				datepay3.setPay(upUser.getPay()+addNum);
				datepay3.setSyjz(addNum);
				datepay3.setJydb(upUser.getJydb());
				datepay3.setNewbz(8);
				datepay3.setOrigintype(YbChangeType.COUNSELING_AWARD);
				logService.addDatePay(datepay3);
				
				if(upUser.getCxt()<2&&(gcuser.getCxdate()!=null&&upUser.getCxdate().getTime()>System.currentTimeMillis())){
					gcuserDao.reduceYbForDoubleAreaCountJypay(upUser.getUsername(),addNum);
					Datepay datepay4 = new Datepay();
					datepay4.setUsername(upUser.getUsername());
					datepay4.setRegid("扣星期间不享受辅导奖金");
					datepay4.setPay(upUser.getPay());
					datepay4.setJc(addNum);
					datepay4.setJydb(upUser.getJydb());
					datepay4.setBz(fcxt.getPayadd());
					datepay4.setNewbz(8);
					datepay4.setOrigintype(YbChangeType.COUNSELING_AWARD_REDUCE);
					logService.addDatePay(datepay4);
				}
			}
			
		}
	}
	
	/**
	 * 执行计算
	 */
	public void backCount(Date date){
//		if(!isCanBackCount()){
//			throw new ServiceException(1, "还没有到结算时间！");
//		}
//		String todayStr = DateUtils.getDate(date);
//		String todayStart = todayStr+" 00:00:00";
//		IPage<Sgxt> page = null;
//		Collection<Sgxt> tempData = null;
//		int pageIndex = 0;
//		while(true){
//			page = sgxtDao.backCountPage(todayStart, pageIndex, 100);
//			tempData = page.getData();
//			if(tempData!=null&&tempData.size()>0){
//				for(Sgxt sgxt:tempData){
//					int addAmount = (int)(sgxt.getFhbl()*sgxt.getSjb()*500);
//					if(gcuserDao.addYbByBackCount(sgxt.getUsername(),addAmount )){
//						Gcuser gcuser = gcuserDao.getUser(sgxt.getUsername());
//						Datepay datepay = new Datepay();
//						datepay.setUsername(sgxt.getUsername());
//						datepay.setRegid("游戏收益");
//						datepay.setSyjz(addAmount);
//						datepay.setPay(gcuser.getPay());
//						datepay.setJydb(gcuser.getJydb());
//						logService.addDatePay(datepay);
//					}
//				}
//			}else{
//				break;
//			}
//			pageIndex++;
//		}
//		sgxtDao.backCount(todayStart);
		
		String yesterdayStr =  DateUtils.getDate(DateUtils.addDay(date, -1));
		String yesterdayStart = yesterdayStr+" 00:00:00";
		String yesterdayEnd = yesterdayStr+" 23:59:59";
		Double rs_nd = sgxtDao.getSumSjbByTime(yesterdayStart, yesterdayEnd);
		Double rs_cb = sgxtDao.getSumZfhBigMqfh();
		Double rs_mq = sgxtDao.getSumMqfh();
		
		Mtfhtj mtfhtj = new Mtfhtj();
		mtfhtj.setFhdate(DateUtils.addDay(date, -1));
		mtfhtj.setNewd((int)(rs_nd*500));
		mtfhtj.setZfh(rs_cb);
		mtfhtj.setMqfh(rs_mq);
		mtfhtjDao.add(mtfhtj);
	}
	
	public DateBean getDateBean(){
		DateBean result = new DateBean();
		result.setRs(fcxtDao.get(2));
		result.setRs_cb(gcuserDao.getSumCbpay());
		result.setRs_pa(gcuserDao.getSumPay());
		result.setRs_pal(gcuserDao.getSumPayIdRange());
		result.setRs_tx(gcuserDao.getSumTxpay());
		result.setRs_db(gcuserDao.getSumJydb());
		result.setRs_xt(gcuserDao.getSumJyg());
		result.setRs_xtl(gcuserDao.getSumJygIdRange());
		result.setRs_fhg(gcuserDao.getSumGdgc());
		result.setRs_fhgl(gcuserDao.getSumGdgcIdRange());
		result.setRs_zfh(gcuserDao.getSumLjfh());
		result.setRs_ztx(txPayDao.getSumpayNumNoCondition());
		result.setRslj1(gpjyDao.getSumMcsl());
		result.setRslj2(gpjyDao.getSumMysl());
		String todayStr = DateUtils.getDate(new Date());
		String todayStart = todayStr+" 00:00:00";
		String todayEnd = todayStr+" 23:59:59";
		result.setRsjt1(gpjyDao.getSumMcslByDate(todayStart, todayEnd));
		result.setRsjt2(gpjyDao.getSumMyslByDate(todayStart, todayEnd));
		
		String yesterdayStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -1));
		String yesterdayStart = yesterdayStr+" 00:00:00";
		String yesterdayEnd = yesterdayStr+" 23:59:59";
		result.setRszt1(gpjyDao.getSumMcslByDate(yesterdayStart, yesterdayEnd));
		result.setRszt2(gpjyDao.getSumMyslByDate(yesterdayStart, yesterdayEnd));
		
		String ctStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -2));
		String ctStart = ctStr+" 00:00:00";
		String ctEnd = ctStr+" 23:59:59";
		result.setRsct1(gpjyDao.getSumMcslByDate(ctStart, ctEnd));
		result.setRsct2(gpjyDao.getSumMyslByDate(ctStart, ctEnd));
		return result;
	}
	
	/**
	 * 根据玩家查询所有的登录日志
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Dateip> getAllDateIp(String username, int pageIndex,int pageSize){
		return dateipDao.getAllPageList(username, pageIndex, pageSize);
	}
	
	public IPage<Cpuser> getCpuserPageList(int pageIndex,int pageSize){
		return cpuserDao.getPageList(pageIndex, pageSize);
	}
	/**
	 * 产品恢复
	 * @param cpId
	 */
	public void recoverGoods(int cpId){
		if(!jfcpDao.recoverDqjf(cpId)){
			throw new ServiceException(1, "还没抢购完成，暂时不可以恢复，");
		}
	}
	/**
	 * 发货录入
	 * @param cgId
	 */
	public void fwDate(int cgId){
		cpuserDao.updateFwdate(cgId);
	}
	
	public IPage<Dgag> getNoticePageList(int pageIndex,int pageSize){
		return dgagDao.getAllPage(pageIndex, pageSize);
	}
	/**
	 * 客服充值报单币
	 * @param csUser
	 * @param toUserName
	 * @param amount
	 * @param ip
	 * @param cjfs
	 */
	@Transactional
	public void chargeBdbByAdmin(String csUser,String toUserName,int amount,String ip,String cjfs){
		Gcuser toUser = gcuserDao.getUser(toUserName);
		if(toUser==null){
			throw new ServiceException(1, "该用户名不存在，请检查输入是否正确！");
		}
		if(toUser.getGmdate()!=null&&toUser.getGmdate().getTime()+2*60*1000>System.currentTimeMillis()){
			throw new ServiceException(2, "两分钟内只能充值一次，请稍后再试！");
		}
		
		if((amount==5000&&toUser.getPay()<45000)||amount>5000){
			if(toUser.getSyep()<amount){
				throw new ServiceException(4, "实行一半一币一半充值，本次充值"+amount+"可报单币小于"+amount+"，请先补充报单币！");
			}
			gcuserDao.updateCjtj(toUserName, amount);
			if(!this.updateSybdbByManager(toUserName, amount, amount*2, amount*2, "充值"+amount+"与"+amount+"报单币生效")){
				throw new ServiceException(4, "实行一半一币一半充值，本次充值"+amount+"可报单币小于"+amount+"，请先补充报单币！");
			}
		}else{
			if(toUser.getPay()<9*amount){
				throw new ServiceException(3, "本次充值"+amount+"可一币小于"+9*amount+"，请先补充一币！");
			}
			gcuserDao.updateCjtj(toUserName, amount);
			
			if(!userService.changeYb(toUserName, -9*amount, "转为报单币", 0, null,0,YbChangeType.CUSTOMSERVICERECHARGETOUSER)){
				throw new ServiceException(3, "本次充值"+amount+"可一币小于"+9*amount+"，请先补充一币！");
			}
			userService.updateSybdb(toUserName, amount*10, "充值"+amount+"与一币"+9*amount+"生效",0);
		}
		
		Datecj datecj = new Datecj();
		datecj.setCjuser(toUserName);
		datecj.setDqcj(amount);
		datecj.setLjcj(toUser.getCjtj()+amount);
		datecj.setCjfs(cjfs);
		datecj.setCz(csUser);
		datecj.setIp(ip);
		datecj.setQldate(new Date());
		datecjDao.add(datecj);
	}
	/**
	 * 充值奖金购物
	 * @param csUser
	 * @param toUserName
	 * @param amount
	 * @param ip
	 * @param cjfs
	 */
	public void chargeGw(String csUser,String toUserName,int amount,String ip,String cjfs){
		
		Gcuser toUser = gcuserDao.getUser(toUserName);
		if(toUser==null){
			throw new ServiceException(1, "该用户名不存在，请检查输入是否正确！");
		}
		
		gcuserDao.updateCjtjForGw(toUserName, amount);
		
		Gcfh gcfh = new Gcfh();
		gcfh.setUserid(toUserName);
		gcfh.setSyfh(amount);
		gcfh.setLjfhtj(toUser.getJjsy()+amount);
		gcfh.setBz("充值消费");
		gcfh.setSf(1);
		gcfh.setAbdate(new Date());
		gcfhDao.add(gcfh);
		
		Datecj datecj = new Datecj();
		datecj.setCjuser(toUserName);
		datecj.setDqcj(amount);
		datecj.setLjcj(toUser.getCjtj()+amount);
		datecj.setCjfs(cjfs);
		datecj.setCz(csUser);
		datecj.setIp(ip);
		datecj.setQldate(new Date());
		datecjDao.add(datecj);
	}
	/**
	 * 获取管理员账号信息
	 * @param userName
	 * @return
	 */
	public Fcxt getAdminUser(String userName){
		return fcxtDao.getAdminUser(userName);
	}
	/**
	 * 添加备用报单币
	 * 
	 * @param userName
	 * @param addAmount
	 * @param operator
	 */
	@Transactional
	public void addSyep(String userName,int addAmount, String operator){
		if (gcuserDao.addSyep(userName, addAmount)) {
			Gcuser gcuser=gcuserDao.getUser(userName);
			//增加备用白单币日志
			SysBiLog sysBi=new SysBiLog();
			sysBi.setUsername(userName);
			sysBi.setCurrentamount(gcuser.getSyep());
			sysBi.setRechargedate(new Date());
			sysBi.setAmount(addAmount);
			sysBi.setOperator("系统");
			sysBiLogDao.add(sysBi);
			
			
//			Gcuser gcuser = gcuserDao.getUser(userName);
//			Bdbdate bdbdate = new Bdbdate();
//			bdbdate.setZuser(userName);
//			bdbdate.setSy(addAmount);
//			bdbdate.setSybdb(gcuser.getSybdb());
//			bdbdate.setLjbdb(gcuser.getLjbdb());
//			bdbDateDao.add(bdbdate);
		}else{
			throw new ServiceException(1, "该用户名不存在，请检查输入是否正确！");
		}
	}
	/**
	 * vip充值
	 * @param userName
	 * @param addAmount
	 */
	public void addVipcjb(String userName,int addAmount, String oparetor){
//		if(addAmount<1000||addAmount%1000!=0){
//			throw new ServiceException(1, "充值必须是1000的倍整数如：2000，3000，4000，5000，6000，7000，8000，请检查输入是否正确！");
//		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser==null||!isCanUseVipCjb(gcuser)){
			throw new ServiceException(2, "本功能只能VIP玩家开放！");
		}
        if(addAmount>0){
            if(gcuserDao.addVipcjcjb(userName, addAmount)){
                Vipcjgl vipcjgl = new Vipcjgl();
                vipcjgl.setCjuser("系统");
                vipcjgl.setCjjo(addAmount);
                vipcjgl.setSycjb(gcuser.getVipcjcjb()+addAmount);
                vipcjgl.setVipuser(userName);
                vipcjgl.setBz("入账");
                vipcjgl.setCjdate(new Date());
                vipcjglDao.add(vipcjgl);
        		AdminOperateLog log= new AdminOperateLog(oparetor,"", new Date(), AdminGlobal.OP_VIPCZJ, userName+"入账："+addAmount);
        		adminOperateLogDao.addLog(log);
            }
        }else{
            if(gcuserDao.reduceVipcjcjb(userName, addAmount*-1)){
                Vipcjgl vipcjgl = new Vipcjgl();
                vipcjgl.setCjuser("系统");
                vipcjgl.setCjjo(addAmount);
                vipcjgl.setSycjb(gcuser.getVipcjcjb()+addAmount);
                vipcjgl.setVipuser(userName);
                vipcjgl.setBz("扣除");
                vipcjgl.setCjdate(new Date());
                vipcjglDao.add(vipcjgl);
                AdminOperateLog log= new AdminOperateLog(oparetor,"", new Date(), AdminGlobal.OP_VIPCZJ, userName+"扣除："+addAmount);
        		adminOperateLogDao.addLog(log);
            }
        }
	}
	
	private boolean isCanUseVipCjb(Gcuser gcuser){
		//是否能使用vip充值币相关功能，只有大vip才能使用相关功能
			if(gcuser.getVip()==2){
				return true;
			}else{
				return false;
			}
	}
	/**
	 * 一币补贴
	 * @param userName
	 * @param addAmount
	 */
	public void addBtPay(String userName,int addAmount){
		if(gcuserDao.addWhenOtherPersionBuyJbCard(userName, addAmount)){
			Gcuser gcuser = gcuserDao.getUser(userName);
			Datepay datePay = new Datepay();
			datePay.setUsername(gcuser.getUsername());
			datePay.setSyjz(addAmount);
			datePay.setPay(gcuser.getPay());
			datePay.setJydb(gcuser.getJydb());
			datePay.setRegid("系统");
			datePay.setNewbz(0);
			datePay.setAbdate(new Date());
			datePay.setOrigintype(YbChangeType.SYSTEM_BUTIE);
			logService.addDatePay(datePay);
		}
	}
	/**
	 * 修改管理级别
	 * @param userName
	 * @param jb
	 * @param dqDate
	 */
	public void changeDldate(String userName,int jb,String dlDate,String dqDate){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser.getDldate()!=null||gcuser.getDqdate()!=null){
			Date dldate = DateUtils.StringToDate(dlDate, DateStyle.YYYY_MM_DD_HH_MM_SS);
			Date dqdate = DateUtils.StringToDate(dqDate, DateStyle.YYYY_MM_DD_HH_MM_SS);
			gcuserDao.updateAdminLevel(userName, jb,dldate,dqdate);
		}else{
			throw new ServiceException(1, "还不是正式管理不可以修改！");
		}
	}
	/**
	 * 设置省级管理
	 * @param userName
	 */
	public void changeSheng(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		String sheng = gcuser.getAddsheng();
		if(gcuserDao.getByAddress("addsheng", sheng, 2)!=null){
			throw new ServiceException(2, "省级管理已被占用了！");
		}
		Date now = new Date();
		gcuserDao.updateAdminLevel(userName, 2,now , DateUtils.addDay(now, 180));
	}
	/**
	 * 设置市级管理
	 * @param userName
	 */
	public void changeShi(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		String addshi = gcuser.getAddshi();
		if(gcuserDao.getByAddress("addshi", addshi, 3)!=null){
			throw new ServiceException(3, "市级管理已被占用了！");
		}
		Date now = new Date();
		gcuserDao.updateAdminLevel(userName, 3,now , DateUtils.addDay(now, 90));
	}
	
	/**
	 * 设置区级管理
	 * @param userName
	 */
	public void changeArea(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		String addqu = gcuser.getAddqu();
		if(gcuserDao.getByAddress("addqu", addqu, 4)!=null){
			throw new ServiceException(4, "区级管理已被占用了！");
		}
		Date now = new Date();
		gcuserDao.updateAdminLevel(userName, 4,now , DateUtils.addDay(now, 60));
	}
	
	/**
	 * 设置区级管理
	 * @param userName
	 */
	public void changeBigArea(String userName){
		Gcuser gcuser = gcuserDao.getUser(userName);
		Integer dqu = gcuser.getDqu();
		if(gcuserDao.getByAddress("dqu", dqu, 1)!=null){
			throw new ServiceException(5, "大区级管理已被占用了！");
		}
		Date now = new Date();
		gcuserDao.updateAdminLevel(userName, 1,now , DateUtils.addDay(now, 180));
	}
	/**
	 * 管理员绑定用户
	 * @param bdUser
	 * @param sjb
	 */
	@Transactional
	public void adminBdUser(String bduser,int sjb){
        Gcuser bdGUser = gcuserDao.getUser(bduser);
        if(bdGUser==null||bdGUser.getSjb()==0){
        	throw new ServiceException(1,"该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！");
        }
        Sgxt sgxt = sgxtDao.get(bduser);
        if(sgxt==null){
        	throw new ServiceException(2,"报单人不存在，请检查输入是否正确！");
        }
        
        List<ZuoMingxi> zList = zuoMingxiDao.getDownList(bduser);
		if(zList!=null&&!zList.isEmpty()){
			for(ZuoMingxi zuoMingxi:zList){
				int sjtjzb = zuoMingxiDao.getSumSjb(zuoMingxi.getTjuser(), zuoMingxi.getCount());
				if(sjtjzb>0){
					if(zuoMingxi.getCount()>0&&zuoMingxi.getCount()<=16){
						sgxtDao.updateZOrYfiled(zuoMingxi.getTjuser(), "z"+zuoMingxi.getCount(), sjtjzb);
					}
				}
			}
		}
		
		List<YouMingxi> yList = youMingXiDao.getDownList(bduser);
		if(yList!=null&&!yList.isEmpty()){
			for(YouMingxi youMingxi:yList){
				int sjtjzb = youMingXiDao.getSumSjb(youMingxi.getTjuser(), youMingxi.getCount());
				if(sjtjzb>0){
					if(youMingxi.getCount()>0&&youMingxi.getCount()<=16){
						sgxtDao.updateZOrYfiled(youMingxi.getTjuser(), "y"+youMingxi.getCount(), sjtjzb);
					}
				}
			}
		}

        
        
		List<Bdbdate> logList = Lists.newArrayList();
		userService.CalculateQ(bduser, sjb, bduser,logList);
		bdbDateDao.batchInsert(logList);
	}
	/**
	 * 查询用户修改记录
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Tduser> getTduserPage(String userName,int pageIndex,int pageSize){
		return tduserDao.getPage(userName, pageIndex, pageSize);
	}
	/**
	 * 获取每日对比
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @param day
	 * @return
	 */
	public IPage<Gcuser> getSqDayAddUsers(int pageIndex,int pageSize,Integer day){
		String[] strArray = new String[2];
		if(day!=null){
			strArray =  getTime(day);
		}
		return gcuserDao.getSqDayAddUserPages(pageIndex, pageSize, strArray[0], strArray[1],null);
	}
	
	public IPage<Gcuser> getSqDayAddUsersByTime(int pageIndex,int pageSize,String startTime,String endTime,String sheng){
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime +" 00:00:00";
			endTime = endTime+" 23:59:59";
		}else{
			return null;
		}
		return gcuserDao.getSqDayAddUserPages(pageIndex, pageSize, startTime, endTime,sheng);
	}
	
	public List<GcuserForExcel> getSqdayAddUsersForExcel(Integer day){
		String[] strArray = new String[2];
		if(day!=null){
			strArray =  getTime(day);
		}
		return gcuserDao.getSqDayAddUserList(strArray[0], strArray[1],null);
	}
	
	public List<GcuserForExcel> getSqdayAddUsersForExcelByTime(String startTime,String endTime,String sheng){
		
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime +" 00:00:00";
			endTime = endTime+" 23:59:59";
		}else{
			return new ArrayList<GcuserForExcel>(0);
		}
		return gcuserDao.getSqDayAddUserList(startTime, endTime,sheng);
	}
	
	private String[] getTime(int day){
		String startTime = null;
		String endTime = null;
		String baseStr = null;
		if(day==0){
			baseStr = DateUtils.getDate(new Date());
		}else{
			baseStr = DateUtils.getDate(DateUtils.addDay(new Date(), day));
		}
		startTime = baseStr +" 00:00:00";
		endTime = baseStr +" 23:59:59";
		return new String[]{startTime,endTime};
	}
	
	public SqDayAddBean getSqDayAddBean(){
		SqDayAddBean result = new SqDayAddBean();
		String[] jt = getTime(0);
		String[] zt = getTime(-1);
		String[] qt = getTime(-2);
		String[] dqt = getTime(-3);
		result.setJt(gcuserDao.getSumSjbByTime(jt[0], jt[1]));
		result.setZt(gcuserDao.getSumSjbByTime(zt[0], zt[1]));
		result.setQt(gcuserDao.getSumSjbByTime(qt[0], qt[1]));
		result.setDqt(gcuserDao.getSumSjbByTime(dqt[0], dqt[1]));
		return result;
	}
	
	public IPage<W10Bean> getTxpayPage(int pageIndex,int pageSize,String uid,String uname,String riqi){
//	    String baseStr = DateUtils.DateToString(DateUtils.addDay(new Date(), 9),DateStyle.YYYY_MM_DD_HH_MM_SS);
		String startTime = null;
		String endTime = null;
		if(!Strings.isNullOrEmpty(riqi)){
//			Date date = DateUtils.StringToDate(riqi, DateStyle.YYYY_MM_DD_EN);
//			String baseStr = DateUtils.DateToString(date,DateStyle.YYYY_MM_DD);
			startTime = riqi+" 00:00:00";
			endTime = riqi+" 23:59:59";
		}
		return txpayDao.getPageListW10(pageIndex, pageSize,uid,uname,startTime,endTime);
	}
	
	public void syusers(int payId,int op){
		txpayDao.updateTxvip(payId, op);
		txpayDao.updateIndexTxvip(payId, op);
	}
	/**
	 * 查询tduser
	 * @param tdId
	 * @return
	 */
	public Tduser getTduser(Integer tdId){
		if(null!=tdId){
			return tduserDao.get(new SqlParamBean("id", tdId));
		}
		return null;
	}
	/**
	 * 根据任意变量搜索记录
	 * @param pageIndex
	 * @param pageSize
	 * @param param
	 * @return
	 */
	public IPage<Tduser> getTduserPageList(int pageIndex,int pageSize,String param){
		return tduserDao.getTduserPageList(param, pageIndex, pageSize);
	}
	/**
	 * 添加tduser
	 * @param tdname
	 * @param tduserid
	 * @param tduser
	 * @param tdcall
	 * @param tdqq
	 */
	public void addTduser(String tdname,String tduserid,String tduser,String tdcall,String tdqq){
		if(tduserDao.get(new SqlParamBean("tduserid", tduserid))!=null){
			throw new ServiceException(1, "身份证号码["+tduserid+"]已经存在，不能重复！");
		}
		Tduser t = new Tduser();
		t.setTdname(tdname);
		t.setTduserid(tduserid);
		t.setTduser(tduser);
		t.setTdqq(tdqq);
		t.setTdcall(tdcall);
		tduserDao.add(t);
	}
	/**
	 * 更新tduser
	 * @param id
	 * @param tdname
	 * @param tduserid
	 * @param tduser
	 * @param tdcall
	 * @param tdqq
	 */
	public void updateTduser(Integer id,String tdname,String tduserid,String tduser,String tdcall,String tdqq){
		if(!tduserDao.update(id, tdname, tduserid, tduser, tdcall, tdqq)){
			throw new ServiceException(2, "不存在该记录"+id);
		}
	}
	/**
	 * 退户
	 * @param fromUser
	 * @param toUser
	 */
	public void transferUserInfo(String fromUser,String toUser){
		Gcuser from = gcuserDao.getUser(fromUser);
		Gcuser to = gcuserDao.getUser(toUser);
		
		if(from==null){
			throw new ServiceException(3, "被转用户不存在"+fromUser);
		}
		if(to==null){
			throw new ServiceException(4, "接收用户不存在"+toUser);
		}
		
		if(zuoMingxiDao.get(toUser, fromUser)==null&&youMingXiDao.get(toUser, fromUser)==null){
			throw new ServiceException(7, "接收账户必须是被转账户的上级");
		}
		
		String tduserid = from.getUserid();
		String tdname = from.getName();
		
		if(tduserDao.getTdUserRecord(tduserid)!=null){
			throw new ServiceException(5, "身份证号码["+tduserid+"]已经退户了，不能重复退户！");
		}
		
		if(from.getUserid().equals(to.getUserid())||from.getName().equals(to.getName())){
			throw new ServiceException(6, "已属于同一同名账号，无法退户，误操作？"+toUser);
		}
		
		gcuserDao.updateUserInfoToOtherUser(tduserid, tdname, toUser);
		
		Tduser t = new Tduser();
		t.setTdname(tdname);
		t.setTduserid(tduserid);
		t.setTduser(fromUser);
		t.setTdqq(from.getQq());
		t.setTdcall(from.getCall());
		tduserDao.add(t);
	}
	/**
	 * 后台执行xxxx
	 */
	@Transactional
	public void man123(){

		Fcxt fcxt = fcxtDao.get(2);
		int ration = 30000000;
		try {
			ration  = Integer.valueOf(fcxt.getCz04());
		} catch (Exception e) {
			LogSystem.warn("cz04转换出错！~~~");
		}
		if (fcxtDao.updateJy5w(ration)) {
			try {
				PointsChangeLog changeLog = new PointsChangeLog();
				changeLog.setCreatedTime(new Date());
				String oldPrice = fcxt.getJygj() + "";
				oldPrice = StringUtils.substring(oldPrice, 0, 5);
				changeLog.setOldPrice(oldPrice);
				String newPrice = (fcxt.getJygj() + 0.01) + "";
				newPrice = StringUtils.substring(newPrice, 0, 5);
				changeLog.setNewPrice(newPrice);
				changeLog.setCurrentNum(fcxt.getJy5w() + "");
				changeLog.setUpRation(ration + "");
				pointsChangeLogDao.add(changeLog);
			} catch (Exception e) {
				LogSystem.error(e, "插入积分上涨日志报错！");
			}
		}
		
		gcuserDao.updateAbdateAndDbtl(">30", 0, new Date(), 1);
		gcuserDao.updateAbdateAndDbtl("<=30", 1, null, 0);
		
		
		double jyj = fcxt.getJygj()+0.2;
		int pageIndex = 0;
		int pageSize = 100;
		Collection<Gcuser> tempList = null;
		IPage<Gcuser> page = null;
	    String endTime = DateUtils.DateToString(DateUtils.addDay(new Date(), -7),DateStyle.YYYY_MM_DD_HH_MM_SS);
	    //第一遍循环
	    while(true){
			page= gcuserDao.getBatchUser(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
	    			for(Gcuser gcuser:tempList){
	    				String clname = gcuser.getUsername();
	    				int dbjc = gcuser.getJydb()-30;
	    				double jc30 = dbjc*0.3;
	    				int hs30 = (int)jc30;
	    				if(hs30>0){
	    					gcuserDao.reduceOnlyJB(clname, hs30);
		    				adddatepay(clname, hs30, gcuser.getJydb()-hs30, gcuser.getPay(), "超出"+dbjc+"系统回收30%");
	    				}
	    			}
	    		}else{
	    			break;
	    		}
	    	}else{
	    		break;
	    	}
	    	pageIndex++;
	    }
	    
	    
	    pageIndex = 0;
	    //第二遍循环
	    int buyPerGold = 500;
	    while(true){
			page= gcuserDao.getBatchUser(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
	    			for(Gcuser gcuser:tempList){
	    				String clname=gcuser.getUsername();
	    				int jydball=gcuser.getJydb();
	    				int jydbnumber=gcuser.getJydb()-30;
	    				int	ForCount=(int)(jydbnumber/buyPerGold);
	    				int lasenumber=jydbnumber%buyPerGold;
	    				if(ForCount>0){
	    					for(int j=1;j<=ForCount;j++){
	    						int insertid = adddatepay(clname,buyPerGold,jydball-j*buyPerGold,gcuser.getPay(),"买入挂牌中(系统代)");
	    						addGpjy(clname,buyPerGold,(jydball-j*buyPerGold)*1d,insertid,jyj);
	    					}
	    				}
	    				if(lasenumber>1){
	    					 int insertid=adddatepay(clname,lasenumber,jydball-ForCount*buyPerGold-lasenumber,gcuser.getPay(),"买入挂牌中(系统代)");
	    					 addGpjy(clname,lasenumber,(jydball-ForCount*buyPerGold-lasenumber)*1d,insertid,jyj);
	    				}
	    				gcuserDao.updateMan1234(clname, 30, null, 0);
	    			}
	    		}else{
	    			break;
	    		}
	    	}else{
	    		break;
	    	}
	    	pageIndex++;
	    }
	}
	
	private int adddatepay(String clname,int jo,int jydb,int pay,String regId){
		Datepay datepay = new Datepay();
		datepay.setUsername(clname);
		datepay.setDbjc(jo);
		datepay.setPay(pay);
		datepay.setJydb(jydb);
		datepay.setRegid(regId);
		datepay.setOrigintype(YbChangeType.SYSRECYCLE);
		return datePayDao.addDatePay(datepay);
	}
	
	private void addGpjy(String clname,int mysl,double jyg,int jyid,double jyj){
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(clname);
		gpjy.setMysl((int)(mysl/jyj+0.1)/1d);
		gpjy.setSysl(jyg);
		gpjy.setPay(jyj);
		gpjy.setBz("买入挂牌中(系统代)");
		gpjy.setJypay((int)(mysl+0.1)/1d);
		gpjy.setJyid(jyid);
		gpjy.setNewjy(GpjyChangeType.BUY_BY_SYSTEM);
		gpjyDao.add(gpjy);
	}
	@Transactional
	public void managequeren(){
		gcuserDao.updateJygdateAndJygt1(">50000", 0, new Date(), 1);
		gcuserDao.updateJygdateAndJygt1("<=50000", 1, null, 0);
		int pageIndex = 0;
		int pageSize = 100;
		Collection<Gcuser> tempList = null;
		IPage<Gcuser> page = null;
	    String endTime = DateUtils.DateToString(DateUtils.addDay(new Date(), -7),DateStyle.YYYY_MM_DD_HH_MM_SS);
	    //第一遍循环
	    LogSystem.info("开始进行30%的扣除~！");
	    int dmSize = 0;
	    int loseSize = 0;
	    while(true){
			page= gcuserDao.getManageQueren(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
	    			for(Gcuser gcuser:tempList){
						try {
							String clname = gcuser.getUsername();
							double mcsl = gcuser.getJyg() - 50000;
							double mc30 = mcsl * 0.3;
							int hs30 = (int) (mc30 / 1);
							if (hs30 > 0) {
								dmSize++;
								if (gcuserDao.updateJyg(clname, hs30)) {
									Gpjy gpjy = new Gpjy();
									gpjy.setUsername(clname);
									gpjy.setMcsl(hs30 * 1d);
									gpjy.setSysl((gcuser.getJyg() - hs30) * 1d);
									gpjy.setBz("超出" + mcsl + "回收30%");
									gpjy.setDfuser("系统管理员");
									gpjy.setCgdate(new Date());
									gpjy.setJy(1);
									gpjyDao.add(gpjy);
								}
							}
						} catch (Exception e) {
							loseSize++;
							LogSystem.error(e, "userName="+gcuser.getUsername()+",处理回收30%的时候出错！");
							throw new ServiceException(8888,"userName="+gcuser.getUsername()+",处理回收30%的时候出错！");
						}
	    			}
	    		}else{
	    			break;
	    		}
	    	}else{
	    		break;
	    	}
	    	pageIndex++;
	    }
	    LogSystem.info("30%的扣除结束！一共处理用户个数="+dmSize+",其中处理失败用户数为"+loseSize);
	    
	    
	    pageIndex = 0;
	    Fcxt fcxt = fcxtDao.get(2);
	    LogSystem.info("开始进行积分的代卖~！");
	     dmSize= 0;
	     loseSize = 0;
	    //第一遍循环
	    while(true){
			page= gcuserDao.getManageQueren(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
					for (Gcuser gcuser : tempList) {
						try {
							dmSize++;
							dealOnePerson(gcuser,fcxt);
						} catch (Exception e) {
							loseSize++;
							LogSystem.error(e, "userName="+gcuser.getUsername()+",处理代卖的时候出错！");
							throw new ServiceException(8888,"userName="+gcuser.getUsername()+",处理回收30%的时候出错！");
						}
					}
	    		}else{
	    			break;
	    		}
	    	}else{
	    		break;
	    	}
	    }
	    LogSystem.info("积分代卖结束！处理人数为="+dmSize+",其中处理失败用户数为"+loseSize);
	}
	
	public void dealOnePerson(Gcuser gcuser,Fcxt fcxt){
		String clname = gcuser.getUsername();
		int jygall = gcuser.getJyg();
		int jygnumber = gcuser.getJyg() - 50000;
		int ForCount = (int) (jygnumber / 200);
		int lasenumber = jygnumber % 200;
		if (gcuserDao.updateManageQueren(clname, 50000, null, 0)) {
			if (ForCount > 0) {
				for (int j = 1; j <= ForCount; j++) {
					addGpjyForManageQueren(clname, 200, jygall - j * 200, fcxt.getZdj());
				}
			}
			if (lasenumber > 0) {
				addGpjyForManageQueren(clname, lasenumber, jygall - ForCount * 200 - lasenumber, fcxt.getZdj());
			}
		}
		
	}
	
	private void addGpjyForManageQueren(String clname,double mcsl,double jyg,double jg){
		double jypay = (int)(mcsl*jg*1+0.1)*1d;
		if(jypay>0){
			Gpjy gpjy = new Gpjy();
			gpjy.setUsername(clname);
			gpjy.setMcsl(mcsl);
			gpjy.setSysl(jyg);
			gpjy.setPay(jg);
			gpjy.setJy(0);
			gpjy.setBz("卖出挂牌中(系统代)");
			gpjy.setJypay(jypay);
			gpjy.setNewjy(3);
			gpjyDao.add(gpjy);
		}
	}
	
	private List<YouMingxi> yList = Lists.newArrayList();
	private List<ZuoMingxi> zList = Lists.newArrayList();
	private final String Y_FILE_NAME = "//Users//dogdog//Desktop//data//youmingxi.sql";
	private final String Z_FILE_NAME = "//Users//dogdog//Desktop//data//zuomingxi.sql";
	public void resetUserDownInfo(){
		long allStartTime = System.currentTimeMillis();
		LogSystem.info("开启重置z y明细表功能---");
		int pageIndex = 0;
		final int pageSize = 500;
		IPage<Sgxt> page = null;
		Collection<Sgxt> tempList = null;
		
		yList = Lists.newArrayList();
		zList = Lists.newArrayList();
		
		FileCreatUtil.creatNewFile(Y_FILE_NAME);
		FileCreatUtil.creatNewFile(Z_FILE_NAME);
		//删除2张表
//		youMingXiDao.deleteAll();
//		zuoMingxiDao.deleteAll();
		while(true){
			long startTime = System.currentTimeMillis();
			long programeEndTime = System.currentTimeMillis();
			page = sgxtDao.getPageList(pageIndex, pageSize);
			if(page!=null){
				tempList = page.getData();
				if(tempList!=null&&tempList.size()>0){
					for(Sgxt sgxt:tempList){
						cupUserForReset(sgxt.getUsername(),sgxt.getUsername(),1,sgxt.getSjb());
					}
					programeEndTime = System.currentTimeMillis();
				}else{
					break;
				}
			}else{
				break;
			}
			executeInsertSql();
			long endTime = System.currentTimeMillis();
			LogSystem.info("第("+(pageIndex+1)+")页数据处理完毕，一共("+page.getTotalPage()+"),总耗时"+(endTime-startTime)+"毫秒！===="+(endTime-startTime)/1000+"秒，其中递归循环耗时"+(programeEndTime-startTime)/1000+"秒，插入数据耗时="+(endTime-programeEndTime)/1000+"秒！");
			pageIndex++;
		}
		
		LogSystem.info("完成-----------重置z y明细表功能---完成--总计耗时"+(System.currentTimeMillis()-allStartTime)/1000+"秒！~");
	}
	
	private void cupUserForReset(String my,String constUp,int count,int sjb){
		Sgxt sgxtBd = sgxtDao.getByAOrBuid(my);
		if(sgxtBd!=null){
			if(my.equals(sgxtBd.getAuid())){
				ZuoMingxi zuoMingxi = new ZuoMingxi();
				zuoMingxi.setTjuser(sgxtBd.getUsername());
				zuoMingxi.setSjb(sjb);
				zuoMingxi.setDown(constUp);
				zuoMingxi.setCount(count);
				zList.add(zuoMingxi);
			}else{
				YouMingxi youMingxi = new YouMingxi();
				youMingxi.setCount(count);
				youMingxi.setDown(constUp);
				youMingxi.setTjuser(sgxtBd.getUsername());
				youMingxi.setSjb(sjb);
				yList.add(youMingxi);
			}
			count = count+1;
			cupUserForReset(sgxtBd.getUsername(),constUp,count,sjb);
		}
	}
	
	private final String preYouMingXI = "INSERT INTO `you_mingxi` VALUES ";
	private final String preZuoMingXI = "INSERT INTO `zuo_mingxi` VALUES ";

	private void executeInsertSql(){
		if(yList.size()>0){
			StringBuffer yBuffer = new StringBuffer();
			yBuffer.append(preYouMingXI);
			int y=0;
			for(YouMingxi youMingxi:yList){
				if(y==0){
					yBuffer.append(youMingxi.insertStr());
				}else{
					yBuffer.append(","+youMingxi.insertStr());
				}
				y++;
			}
			yBuffer.append(";\r\n");
			//youMingXiDao.batchInsert(yList);
			FileCreatUtil.appendFile(Y_FILE_NAME, yBuffer.toString());
			LogSystem.info("youMingxi表中插入数据("+yList.size()+")条");
		}else{
			LogSystem.info("zList无数据！不执行插入操作");
		}
		if(zList.size()>0){
			StringBuffer zBuffer = new StringBuffer();
			zBuffer.append(preZuoMingXI);
			int z=0;
			for(ZuoMingxi zuoMingxi:zList){
				if(z==0){
					zBuffer.append(zuoMingxi.insertStr());
				}else{
					zBuffer.append(","+zuoMingxi.insertStr());
				}
				z++;
			}
			zBuffer.append(";\r\n");
			//youMingXiDao.batchInsert(yList);
			FileCreatUtil.appendFile(Z_FILE_NAME, zBuffer.toString());
			//zuoMingxiDao.batchInsert(zList);
			LogSystem.info("zuoMingxi表中插入数据("+zList.size()+")条");
		}else{
			LogSystem.info("yList无数据！不执行插入操作");
		}
		yList = Lists.newArrayList();
		zList = Lists.newArrayList();
	}
	
	public void executeSynNameSql(){
		int pageIndex = 0;
		final int pageSize = 1000;
		IPage<Gcuser> page = null;
		Collection<Gcuser> tempList = null;
		final String FILEName = "E://temp//name_update.sql";
		FileCreatUtil.creatNewFile(FILEName);
		while(true){
			page = gcuserDao.getPageList(pageIndex, pageSize);
			tempList = page.getData();
			StringBuffer buffer = new StringBuffer();
			if(tempList!=null&&tempList.size()>0){
				for(Gcuser gcuser:tempList){
					buffer.append("update gcuser set name='"+gcuser.getName()+"' where id="+gcuser.getId()+" and username='"+gcuser.getUsername()+"';\r\n");
				}
				FileCreatUtil.appendFile(FILEName, buffer.toString());
			}else{
				break;
			}
			pageIndex++;
		}
	}
	
	public void resetZaqAndZbq(){
		long allStartTime = System.currentTimeMillis();
		LogSystem.info("开启重置zaq zbq表功能---"+new Date());
		int pageIndex = 0;
		final int pageSize = 500;
		IPage<Sgxt> page = null;
		Collection<Sgxt> tempList = null;
		//重置数据
		sgxtDao.resetZaqAndZbq();
		while(true){
			long startTime = System.currentTimeMillis();
			long programeEndTime = System.currentTimeMillis();
			page = sgxtDao.getPageList(pageIndex, pageSize);
			if(page!=null){
				tempList = page.getData();
				if(tempList!=null&&tempList.size()>0){
					for(Sgxt sgxt:tempList){
						CalculateQ(sgxt.getUsername(), sgxt.getSjb());
					}
					programeEndTime = System.currentTimeMillis();
				}else{
					break;
				}
			}else{
				break;
			}
			long endTime = System.currentTimeMillis();
			LogSystem.info("第("+(pageIndex+1)+")页数据处理完毕，一共("+page.getTotalPage()+"),总耗时"+(endTime-startTime)+"毫秒！===="+(endTime-startTime)/1000+"秒，其中递归循环耗时"+(programeEndTime-startTime)/1000+"秒，插入数据耗时="+(endTime-programeEndTime)/1000+"秒！");
			pageIndex++;
		}
		
		LogSystem.info("完成-----------重置zaq zbq表功能---完成-总计耗时"+(System.currentTimeMillis()-allStartTime)/1000+"秒！~");
	}
	
	public void resetUserZaqAndZbq(String userName){
		long allStartTime = System.currentTimeMillis();
		LogSystem.info("开启重置zaq zbq表功能---["+userName+"]"+new Date());
		//重置数据
		if(sgxtDao.resetZaqAndZbq(userName)){
			Sgxt sgxt = sgxtDao.get(userName);
			if (sgxt != null) {
				if (!Strings.isNullOrEmpty(sgxt.getAuid())) {
					CalculateUserLeftZaq(userName, sgxt.getAuid());
				}
				if (!Strings.isNullOrEmpty(sgxt.getBuid())) {
					CalculateUserRightZbq(userName, sgxt.getBuid());
				}
			}
		}
		LogSystem.info("完成-----------重置zaq zbq表功能---完成-总计耗时["+userName+"]"+(System.currentTimeMillis()-allStartTime)/1000+"秒！~");
	}
	
	private void CalculateUserLeftZaq(String constantUserName,String auid){
		Sgxt sgxt = sgxtDao.get(auid);
		if(sgxt!=null){
			sgxtDao.updateZaq(constantUserName, sgxt.getSjb());
			if(!Strings.isNullOrEmpty(sgxt.getAuid())){
				CalculateUserLeftZaq(constantUserName, sgxt.getAuid());
			}
			if(!Strings.isNullOrEmpty(sgxt.getBuid())){
				CalculateUserLeftZaq(constantUserName, sgxt.getBuid());
			}
		}
	}
	
	private void CalculateUserRightZbq(String constantUserName,String buid){
		Sgxt sgxt = sgxtDao.get(buid);
		if(sgxt!=null){
			sgxtDao.updateZbq(constantUserName, sgxt.getSjb());
			if(!Strings.isNullOrEmpty(sgxt.getAuid())){
				CalculateUserRightZbq(constantUserName, sgxt.getAuid());
			}
			if(!Strings.isNullOrEmpty(sgxt.getBuid())){
				CalculateUserRightZbq(constantUserName, sgxt.getBuid());
			}
		}
	}
	
	public boolean callRemoteCharge(String call,int amount,String ip,String userName, String oparetor){
		LogSystem.info("手动--用户充值话费开始,用户名【"+userName+"】"+"，充值手机号【"+call+"】"+",金额【"+amount+"】,ip【"+ip+"】");
		_99douInterface _99dou = new _99douInterface();
		String out_trade_id = userName+"-"+DateUtils.DateToString(new Date(),DateStyle.YYYY_MM_DD_HH_MM_SS_EN);
		String account = call;
		String account_info = "";
		int quantity=1;
		String value = amount+"";
		String client_ip = ip;
		int expired_mini = 5;
		Ref<String> msg = new Ref<String>();
		int result = -1;
        try {
        	result =_99dou.Huafei(out_trade_id, account, account_info, quantity, value, client_ip, expired_mini, msg);
		} catch (Exception e) {
			LogSystem.error(e, "");
			throw new ServiceException(100, "充值话费失败！稍后再试");
		}
        LogSystem.info("话费充值返回 :"+result+" 消息:"+msg);
        AdminOperateLog log= new AdminOperateLog(oparetor,"", new Date(), AdminGlobal.OP_MOBILEFEE, userName+":手机号："+call+"充值："+amount);
		adminOperateLogDao.addLog(log);
        if(result==0){//成功
        	return true;
        }
        return false;
	}
	
	public IPage<Vipxtgc> getVipxtgcPageList(String userName,String startDate,String endDate,int pageIndex,int pageSize){
		return vipxtgcDao.getPage(userName, startDate, endDate, pageIndex, pageSize);
	}
	/**
	 * 设置用户为vip
	 * @param userName
	 * @param vipType   0取消vip   2大vip  3小vip
	 * @param vipuser
	 * @param vipgh
	 * @param vipnh
	 * @param vipzh
	 * @param phone
	 * @param qq
	 */
	@Transactional
	public void updateUserVipInfo(String adminUserName,String userName,int vipType,String vipuser,String vipgh,String vipnh,String vipzh,String vipjh,String phone,String qq,String ip){
		String commitParam = userName+":"+vipType+":"+vipuser+":"+vipgh+":"+vipnh+":"+vipjh+":"+vipzh+":"+phone+":"+qq;
		 if(vipType==0){ // 取消vip
			 gcuserDao.updateVip(userName, 0);
			 sgxtDao.updateVip(userName, 0);
			 userVipLogDao.add(new UserVipLog(userName, 2, adminUserName, ip, commitParam, new Date()));
		 }else{   //修改vip信息
			 gcuserDao.updateVip(userName, vipType);
			 sgxtDao.updateVip(userName, 1);
			 gcuserDao.updateVipInfo(userName, vipuser, vipgh, vipjh, vipnh, vipzh, phone, qq);
			 userVipLogDao.add(new UserVipLog(userName, 1, adminUserName, ip, commitParam, new Date()));
		 }
	}
	
	/**
	 * 一键修改某用户下的所有用户的payok值
	 * @param userName
	 * @param payok
	 * @param regTime
	 * @return
	 */
	@Transactional
	public String updateUserPayOk(String userName,Integer payok,String regTime,String password3End){
		Date date = null;
		if(regTime!=null){
			date = DateUtils.StringToDate(regTime,DateStyle.YYYY_MM_DD);
		}
		StringBuffer result = new StringBuffer();
		batchUpdateDownPayok(userName, result, date, payok,password3End);
		return result.toString();
	}
	
	private void batchUpdateDownPayok(String userName,StringBuffer stringBuffer,Date date,Integer payok,String password3End){
		Sgxt sgxt = sgxtDao.get(userName);
		if(sgxt!=null){
			if(!Strings.isNullOrEmpty(sgxt.getAuid())){
				updateUserPayOk(sgxt.getAuid(), stringBuffer,date,payok,password3End);
				batchUpdateDownPayok(sgxt.getAuid(), stringBuffer, date, payok,password3End);
			}
			if(!Strings.isNullOrEmpty(sgxt.getBuid())){
				updateUserPayOk(sgxt.getBuid(), stringBuffer,date,payok,password3End);
				batchUpdateDownPayok(sgxt.getBuid(), stringBuffer, date, payok,password3End);
			}
		}
	}
	
	private void updateUserPayOk(String userName,StringBuffer stringBuffer,Date date,Integer payok,String password3End){
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(date==null||gcuser.getRegtime().getTime()>date.getTime()){
//			LogSystem.info("设置用户["+userName+"]pend="+password3End);
			gcuserDao.updatePayOkAndPassword3End(gcuser.getName(), gcuser.getUserid(), payok,password3End);
			stringBuffer.append("["+gcuser.getUsername()+"]");
		}
	}
	
	
	
	public List<String>  getAllVipName(){
		List<Gcuser> list = gcuserDao.getAllVip();
		List<String> result = Lists.newArrayList();
		for(Gcuser gcuser:list){
			result.add(gcuser.getUsername());
		}
		return result;
	}
	
	public void editYbSale(String userName,String opPass,int fhpay,int vippay){
        if(!opPass.equals("yc201scvs")){
			throw new ServiceException(1, "操作密码错误！");
		}
		if(!gcuserDao.updateFhpayAndVippay(userName, fhpay, vippay)){
			throw new ServiceException(2, "用户不存在！");
		}
	}
	
//	private String[] arrayRandomName = new String[]{"sineg","siwnrw","aneing","064300","uie168","shs888","8515mycq","abc888888a","742ymjc","kuang888","niw168"};
	
	private String getRadomUserName(List<Gcuser> gcuser){
		int random = new Random().nextInt(gcuser.size());
		return gcuser.get(random).getUsername();
	}
	
	public static AtomicBoolean dealJfLock = new AtomicBoolean(false);
	//当前已处理的数量
	public static int currentNum = 0;
	//当前需要处理的数量
	public static int needDealNum = 0;
	public void dealJfMrOrder(int num){
		if(num<=0){
			throw new ServiceException(1,"次数不能小于0");
		}
		if(!dealJfLock.compareAndSet(false, true)){
			throw new ServiceException(2,"已有线程在执行，不能同时开启多个线程");
		}
		needDealNum = num;
		currentNum = 0;
		LogSystem.log("开始成交所有求购积分的信息,num="+num);
		final int pageSize = 500;
		List<Gpjy> page = null;
		List<Gcuser> listRandomUserName = gcuserDao.getCompanlyUser();
		while(true){
			page = gpjyDao.getMrPageForSystemOrderByPay(pageSize);
			if(page!=null&&page.size()>0&&currentNum<num){
				LogSystem.info("处理第一页，有数量 ="+page.size()+",共[]页");
				long sigleStartTime = System.currentTimeMillis();
				for(Gpjy gpjy:page){
					if(currentNum<num){
						try {
							mcJfForSystem(getRadomUserName(listRandomUserName), gpjy);
							currentNum++;
						} catch (Exception e) {
							LogSystem.error(e, "[这条记录出错了]---gpgy="+gpjy);
						}
					}else{
						break;
					}
				}
				long sigleEndTime = System.currentTimeMillis();
				LogSystem.info("处理完毕，有数量 ="+page.size()+",时长="+(sigleEndTime-sigleStartTime)+"毫秒");
			}else{
				break;
			}
		}
		dealJfLock.compareAndSet(true, false);
		LogSystem.log("成交所有积分求购信息结束,一共处理订单数量"+currentNum);
	}
	/**
	 * 批量处理积分买入
	 */
	public synchronized void dealJfMrOrderForChaiFen(String date){
		if(Strings.isNullOrEmpty(date)){
			LogSystem.info("date为空，结束执行");
			return;
		}
		LogSystem.info("开始成交所有求购积分的信息,date="+date);
		final int pageSize = 500;
		List<Gpjy> page = null;
		List<Gcuser> listRandomUserName = gcuserDao.getCompanlyUser();
		while(true){
			page = gpjyDao.getMrPageForSystem(pageSize,date);
			if(page!=null&&page.size()>0){
				LogSystem.info("处理第一页，有数量 ="+page.size()+",共[]页");
				long sigleStartTime = System.currentTimeMillis();
				for(Gpjy gpjy:page){
					try {
						mcJfForSystem(getRadomUserName(listRandomUserName), gpjy);
					} catch (Exception e) {
						LogSystem.error(e, "[这条记录出错了]---gpgy="+gpjy);
					}
				}
				long sigleEndTime = System.currentTimeMillis();
				LogSystem.info("处理完毕，有数量 ="+page.size()+",时长="+(sigleEndTime-sigleStartTime)/1000+"秒");
			}else{
				break;
			}
		}
		LogSystem.info("成交所有积分求购信息结束");
	}
	
	private void mcJfForSystem(String userName,Gpjy gpjy1){
		
		//重置数量和价格
		Fcxt fcxt = fcxtDao.get(2);
		double price = fcxt.getJygj();
		if(gpjy1.getNewjy()!=GpjyChangeType.BUY_BY_SYSTEM){
			gpjy1.setPay(price);
			gpjy1.setMysl(Double.valueOf(gpjy1.countNum(price)));		
		}
		
        Gcuser dfuser = gcuserDao.getUser(gpjy1.getUsername());
		if (!gpjyDao.updateBuySuccess(gpjy1.getId(), userName, "买入成功",(int)(dfuser.getJyg()+gpjy1.getMysl()),gpjy1.getPay(),gpjy1.getMysl(),gpjy1.getJypay())) {
			throw new ServiceException(2, "该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！");
		}
		gpjyDao.deleteIndex(gpjy1.getId());
		gcuserDao.updateJyg(gpjy1.getUsername(), -gpjy1.getMysl().intValue());
		String mydj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();
		String d = DateUtils.DateToString(gpjy1.getCgdate(), DateStyle.YYYY_MM_DD_HH_MM_SS);
		String dStr = d==null?"":d;
		logService.updateRegId(gpjy1.getJyid(),dStr 
				+ "支出成功到" + userName + "-积分" + gpjy1.getMysl() + "-单价" + mydj);
//		fcxtDao.update(2, gpjy1.getMysl().intValue());
	}
	
	/**
	 * 积分拆分
	 */
	public static final String beishu = "2.3";//拆分倍数
	private final double dijia = 0.78;//底价
	
	public synchronized void JygChaifen(){
		Fcxt fcxt = fcxtDao.get(10);
		Date d = DateUtils.addDay(fcxt.getJsdate(), 3);
		int updateNum = gcuserDao.updateJfChaifen(beishu, d);
		int insertNum = gcuserDao.insertIntoChaifenLog(beishu, d);
		fcxtDao.updateChaiFen(2, dijia);
		
		gcuserDao.updateJygdateAndJygt1(">50000", 0, new Date(), 1);
		gcuserDao.updateJygdateAndJygt1("<=50000", 1, null, 0);
		
		LogSystem.info("执行拆分At【"+DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD_HH_MM_SS)+"】，拆分注册日期最小值为:【"+DateUtils.DateToString(d, DateStyle.YYYY_MM_DD_HH_MM_SS)+"】,倍数为【"+beishu+"】,底价为【"+dijia+"】,更新gcuser表数据条数为【"+updateNum+"】,插入gpjy日志条数为:【"+insertNum+"】");
	}
	/**
	 * 拆分满3次自动卖70%
	 */
	public synchronized void jfdm(){
		int maxId = gcuserDao.getMaxId();
		int startId = 1;
		int endId = 500;
		int cap = 500;
		List<Gcuser> list = null;
		while(true){
			long start = System.currentTimeMillis();
			LogSystem.info("开始--执行id号为：start="+startId+",end="+endId+",最大Id为="+maxId);
			list = gcuserDao.getByIdDistance(startId, endId);
			if(list!=null&&list.size()>0){
				LogSystem.info("总数目为"+list.size());
				for(Gcuser gcuser:list){
					int blsl = getBlsl(gcuser.getSjb());
					int kmcsl = gcuser.getJyg()-blsl;
					if(kmcsl>0){
						int mcbs = getMcbs(kmcsl);
						String clname = gcuser.getUsername();
						int jygall = gcuser.getJyg();
						int jygnumber = gcuser.getJyg()-blsl;
						int ForCount = (int)(jygnumber/mcbs);
						int lasenumber=jygnumber % mcbs;
						if(ForCount>0){
							for(int j=1;j<=ForCount;j++){
								addGpjyForChaiFeng(clname,mcbs,jygall-j*mcbs);
							}
						}
						if(lasenumber>0){
							addGpjyForChaiFeng(clname,lasenumber,jygall-ForCount*mcbs-lasenumber);
						}
						gcuserDao.resetCfc(gcuser.getUsername(), blsl);
					}
				}
			}
			long end = System.currentTimeMillis();
			LogSystem.info("完毕--执行id号为：start="+startId+",end="+endId+"执行时间为="+(end-start)/1000+"秒");
			if(endId>=maxId){
				break;
			}
			startId = endId+1;
			endId = endId+cap;
		}
		
		gcuserDao.updateJygdateAndJygt1(">50000", 0, new Date(), 1);
		gcuserDao.updateJygdateAndJygt1("<=50000", 1, null, 0);
	}
	
	
	/**
	 * 重置cfb
	 */
	
	public void resetCfb(){
		int maxId = gcuserDao.getMaxId();
		int startId = 1;
		int endId = 500;
		int cap = 500;
		List<Gcuser> list = null;
		while(true){
			long start = System.currentTimeMillis();
			LogSystem.info("开始执行充值cfb--执行id号为：start="+startId+",end="+endId+",最大Id为="+maxId);
			list = gcuserDao.getByIdDistanceForResetCfb(startId, endId);
			if(list!=null&&list.size()>0){
				LogSystem.info("总数目为"+list.size());
				for(Gcuser gcuser:list){
					if(gcuser.getCfa()<=10){
						double cfb = getBs(gcuser.getCfa());
						gcuserDao.updateCfb(gcuser.getUsername(), cfb);
					}
				}
			}
			long end = System.currentTimeMillis();
			LogSystem.info("完毕充值cfb--执行id号为：start="+startId+",end="+endId+"执行时间为="+(end-start)/1000+"秒");
			if(endId>=maxId){
				break;
			}
			startId = endId+1;
			endId = endId+cap;
		}
	}
	
	private static final double[] bs = new double[]{2.30,1.60,1.80,1.79,1.23,1.46,1.31,1.29,1.58,1.50};
	public static double getBs(int cfc){
		double result = 1;
		for(int i=0;i<cfc;i++){
			result = result*bs[i];
		}
		BigDecimal   b   =   new   BigDecimal(result);
		double   f1   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
		return f1;
	}
	
	private void addGpjyForChaiFeng(String clname,int mcsl,double jyg){
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(clname);
		gpjy.setMcsl(mcsl*1d);
		gpjy.setSysl(jyg);
		gpjy.setPay(dijia);
		gpjy.setJy(0);
		gpjy.setBz("卖出挂牌中(系统代)");
		gpjy.setJypay((int)(mcsl*dijia+0.1)/1d);
		gpjy.setNewjy(3);
		gpjyDao.add(gpjy);
	}
	private int getBlsl(int sjb){
		if(sjb==100){
			return 25000;
		}else if(sjb==40){
			return 15000;
		} else if(sjb==20){
			return 10000;
		}else if(sjb==10){
			return 5000;
		}else if(sjb==4){
			return 2000;
		}else if(sjb==2){
			return 1000;
		}
		return 0;
	}
	
	private int getMcbs(int kmcsl){
		if(kmcsl>30000){
			return 2000;
		}else if(kmcsl>20000){
			return 1500;
		}else if(kmcsl>10000){
			return 1200;
		}else if(kmcsl>5000){
			return 800;
		}else if(kmcsl>3000){
			return 500;
		}
		return kmcsl;
	}
	/**
	 * 个人业绩查询  及注册的时候选的推荐人 业绩总和
	 * @param userName
	 * @param startYear
	 * @param endYear
	 * @return
	 */
	private int getUserThisYearSiglePerformance(String userName,String startTime,String endTime){
		if(startTime!=null&&endTime!=null){
			startTime = startTime + " 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		return gcuserDao.getUserSigleSumSjbByTime(userName,gcuser.getUserid(), startTime, endTime);
	}
	/**
	 * 获取用户下 所有同名账号的个人业绩总和
	 * @param userName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	private int getMyAllUserThisYearSignlePerformance(String userName,String startTime,String endTime){
		if(startTime!=null&&endTime!=null){
			startTime = startTime + " 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		LogSystem.info("查询用户:"+userName+",startTime="+startTime+",endTime="+endTime);
		Gcuser gcuser = gcuserDao.getUser(userName);
		List<Gcuser> list = gcuserDao.getUserByIdCard(gcuser.getUserid());
		int result = 0;
		if(list!=null&&list.size()>0){
			for(Gcuser gc:list){
				int num = gcuserDao.getUserSigleSumSjbByTime(gc.getUsername(),gc.getUserid(), startTime, endTime);
				result = result + num;
				LogSystem.info(gc.getUsername()+"="+num+",result="+result);
			}
		}
		return result;
	}
	/**
	 * 个人总业绩查询
	 * @param userName
	 * @param startYear
	 * @param endYear
	 * @return
	 */
//	private int getUserThisYearAllPerformance(String userName,String startTime,String endTime){
//		
//		int zAll = zuoMingxiDao.getZUserAllPerformanceByTime(userName, startTime, endTime);
//		int yAll = youMingXiDao.getYUserAllPerformanceByTime(userName, startTime, endTime);
//		return zAll+yAll;
//	}
	/**
	 * 是否5层全满
	 * @param userName
	 * @return
	 */
	private boolean isFiveStepFull(String userName){
		for(int i=1;i<=5;i++){
			if(zuoMingxiDao.getDownCountByStep(userName,i)<Math.pow(2, i)/2||youMingXiDao.getDownCountByStep(userName,i)<Math.pow(2, i)/2){
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 获取用户业绩信息
	 * @param userName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public UserPerformanceSearch getUserPerformanceSearch(String userName,String startTime,String endTime){
		UserPerformanceSearch result = new UserPerformanceSearch();
		result.setSigleAllPerformance(getUserThisYearSiglePerformance(userName, null, null));
		result.setSigleTimeAllPerformance(getUserThisYearSiglePerformance(userName, startTime, endTime));
		result.setMyAllSigleAllPerformance(getMyAllUserThisYearSignlePerformance(userName,  null, null));
		result.setMyAllSignleTimeAllPerformance(getMyAllUserThisYearSignlePerformance(userName,  startTime, endTime));
		startTime = startTime + " 00:00:00";
		endTime = endTime + " 23:59:59";
		result.setFiveLeftPerformance(zuoMingxiDao.getZUserAllPerformanceByTime(userName, null, null,5));
		result.setFiveLeftTimePerformance(zuoMingxiDao.getZUserAllPerformanceByTime(userName, startTime, endTime,5));
		result.setFiveRightPerformance(youMingXiDao.getYUserAllPerformanceByTime(userName, null, null,5));
		result.setFiveRightTimePerformance(youMingXiDao.getYUserAllPerformanceByTime(userName, startTime, endTime,5));
		result.setSgxt(sgxtDao.get(userName));
		result.setAllTimeLeftPerformance(zuoMingxiDao.getZUserAllPerformanceByTime(userName, startTime, endTime,0));
		result.setAllTimeRightPerformance(youMingXiDao.getYUserAllPerformanceByTime(userName, startTime, endTime,0));
		result.setIsFiveFull(isFiveStepFull(userName));
		result.setPerformance(getUserFiveStepPerformance(userName));
		Sgxt up = sgxtDao.getByAOrBuid(userName);
		result.setUp(up);
		return result;
	}
	
	/**
	 * 获取用户前5层 二叉树
	 * @param userName
	 * @return
	 */
	public Performance getUserFiveStepPerformance(String userName){
		Performance performance = generatorCommonPerformance(userName);
		generatorDownMap(performance,1,5);
		return performance;
	}
	
	/**
	 * 
	 * @param userName
	 * @return
	 */
	private Performance generatorCommonPerformance(String userName){
		Sgxt sgxt = sgxtDao.get(userName);
		if(sgxt!=null){
			Performance performance = new Performance();
			performance.setUserName(userName);
			performance.setBdbdate(sgxt.getBddate());
			performance.setSjb(sgxt.getSjb());
			performance.setZaq(sgxt.getZaq());
			performance.setZbq(sgxt.getZbq());
			return performance;
		}else{
			return null;
		}
	}
	/**
	 * 
	 * @param performance
	 * @param count
	 * @param max
	 */
	private void generatorDownMap(Performance performance,int count,int max){
		if(performance==null||count>max){
			return;
		}
		Sgxt sgxt = sgxtDao.get(performance.getUserName());
		if(!Strings.isNullOrEmpty(sgxt.getAuid())){
			Performance left = generatorCommonPerformance(sgxt.getAuid());
			if(left!=null){
				performance.setLeft(left);
				left.setParent(performance);
				generatorDownMap(left,count+1,max);
			}
		}
		
		if(!Strings.isNullOrEmpty(sgxt.getBuid())){
			Performance right = generatorCommonPerformance(sgxt.getBuid());
			if(right!=null){
				performance.setRight(right);
				right.setParent(performance);
				generatorDownMap(right,count+1,max);
			}
			
		}
	}
	/**
	 * 每月月底分红
	 */
	public void shareMoney(){
		Fcxt fcxt = fcxtDao.get(10);
		Date date = DateUtils.addDay(fcxt.getJsdate(), 2);
		
		long allStartTime = System.currentTimeMillis();
		LogSystem.info("开始执行分红程序---"+new Date());
		
		String dyRation = "0.12";
		String xyRation = "0.01";
		String cmRation = "0.005";
		
		LogSystem.info("开始执行分红程序第一阶段，注册日期大于---"+DateUtils.DateToString(date, DateStyle.YYYY_MM_DD_HH_MM_SS_CN)+"的会员用户"+new Date());
		executeDyRegTimeShareMoney(dyRation, date);
		LogSystem.info("结束执行分红程序第一阶段，注册日期大于---"+DateUtils.DateToString(date, DateStyle.YYYY_MM_DD_HH_MM_SS_CN)+"的会员用户"+new Date());
		
		LogSystem.info("开始执行分红程序第二阶段，注册日期小于---"+DateUtils.DateToString(date, DateStyle.YYYY_MM_DD_HH_MM_SS_CN)+"的会员用户"+new Date());
		executeXyRegTimeShareMoney(xyRation, date);
		LogSystem.info("结束执行分红程序第二阶段，注册日期小于---"+DateUtils.DateToString(date, DateStyle.YYYY_MM_DD_HH_MM_SS_CN)+"的会员用户"+new Date());
		
		
		LogSystem.info("开始执行分红程序第三阶段，普通会员用户"+new Date());
		executeCommonRegTimeShareMoney(cmRation);
		LogSystem.info("结束执行分红程序第三阶段，普通会员用户"+new Date());
		
		long allEndTime = System.currentTimeMillis();
		
		LogSystem.info("全体执行结束，耗时"+(allEndTime-allStartTime)/1000+"秒");
	}
	@Transactional
	public void executeDyRegTimeShareMoney(String ration,Date date){
		int uNum = gcuserDao.updateMemberSharePayDyDate(date, ration);
		int insertGcfhNum = gcuserDao.insertMemberShareGcfhLogDyDate(date, ration);
		int insertDatepayNum = gcuserDao.insertMemberShareDatepayLogDyDate(date, ration);
		LogSystem.info("更新数据条数["+uNum+"],gcfh插入日志条数["+insertGcfhNum+"],datepay插入日志条数["+insertDatepayNum+"]");
	}
	@Transactional
	public void executeXyRegTimeShareMoney(String ration,Date date){
		int uNum = gcuserDao.updateMemberSharePayXyDate(date, ration);
		int insertGcfhNum = gcuserDao.insertMemberShareGcfhLogXyDate(date, ration);
		int insertDatepayNum = gcuserDao.insertMemberShareDatepayLogXyDate(date, ration);
		LogSystem.info("更新数据条数["+uNum+"],gcfh插入日志条数["+insertGcfhNum+"],datepay插入日志条数["+insertDatepayNum+"]");
	}
	@Transactional
	public void executeCommonRegTimeShareMoney(String ration){
		int uNum =gcuserDao.updateCommonSharePay(ration);
		int insertGcfhNum = gcuserDao.insertCommonShareGcfhLogXyDate(ration);
		int insertDatepayNum = gcuserDao.insertCommonShareDatepayLogXyDate(ration);
		LogSystem.info("更新数据条数["+uNum+"],gcfh插入日志条数["+insertGcfhNum+"],datepay插入日志条数["+insertDatepayNum+"]");
	}
	
	@Transactional
	public synchronized void insertPosition(String userName,String zOry,String insertUser,int sjb){
		Sgxt sgxt = sgxtDao.get(userName);
		if(sgxt==null){
			throw new ServiceException(1, "被挂载用户不存在");
		}
		String  beReplaceUser = null;
		if(zOry.equals("z")){
			if(Strings.isNullOrEmpty(sgxt.getAuid())){
				throw new ServiceException(2, "被替代的用户左边不存在用户，请执行正常挂载流程");
			}
			beReplaceUser = sgxt.getAuid();
		}else if(zOry.equals("y")){
			if(Strings.isNullOrEmpty(sgxt.getBuid())){
				throw new ServiceException(3, "被替代的用户右边不存在用户，请执行正常挂载流程");
			}
			beReplaceUser = sgxt.getBuid();
		}else{
			throw new ServiceException(4, "只能填写z或者y,当前填的为"+zOry);
		}
		
		Gcuser gcuser = gcuserDao.getUser(insertUser);
		Sgxt sgxtBeReplace = sgxtDao.get(beReplaceUser);
		if(gcuser==null||sgxtBeReplace==null){
			throw new ServiceException(5, "插入用户不存在，请先注册新用户"+insertUser);
		}
		Sgxt insertUserSgx = sgxtDao.get(insertUser);
		if(insertUserSgx!=null){
			throw new ServiceException(6, "用户已开户，不能执行替换操作"+insertUser);
		}
		
		
		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("DROP TABLE IF EXISTS `sgxt1`;CREATE TABLE `sgxt1` LIKE `sgxt`;");//新建临时表，用户存放被替代位置的那条记录
		stringBuffer.append("insert into sgxt1 select * from sgxt where username='"+beReplaceUser+"';");//复制被替换用户信息至临时表
		stringBuffer.append("update sgxt1 set id=(select max(id)+1 from sgxt),username='"+insertUser+"',sjb="+sjb+" where username='"+beReplaceUser+"';");//更新成要插入的用户
		stringBuffer.append("insert into sgxt select * from sgxt1 where username='"+insertUser+"';");//生成一条插入用户的记录
		
		stringBuffer.append("update zuo_mingxi set down='"+insertUser+"',sjb="+sjb+" where down='"+beReplaceUser+"';");//复制被替代用户的左边下部分层级关系至新用户
		stringBuffer.append("update you_mingxi set down='"+insertUser+"',sjb="+sjb+" where down='"+beReplaceUser+"';");//复制被替代用户的右边下部分层级关系至新用户
		stringBuffer.append("update zuo_mingxi set tjuser='"+insertUser+"' where tjuser='"+beReplaceUser+"';");//复制被替代用户的左边上部分层级关系至新用户
		stringBuffer.append("update you_mingxi set tjuser='"+insertUser+"' where tjuser='"+beReplaceUser+"';");//复制被替代用户的右边上部分层级关系至新用户
		//开始构件替代与被替代用户之间的关系
		if(zOry.equals("z")){
			stringBuffer.append("update sgxt set auid='"+insertUser+"' where username='"+userName+"';");//设置新用户的位置
			stringBuffer.append("insert into zuo_mingxi values(null,'"+insertUser+"','"+beReplaceUser+"',"+sgxtBeReplace.getSjb()+",1);");
		}else{
			stringBuffer.append("update sgxt set buid='"+insertUser+"' where username='"+userName+"';");//设置新用户的位置
			stringBuffer.append("insert into you_mingxi values(null,'"+insertUser+"','"+beReplaceUser+"',"+sgxtBeReplace.getSjb()+",1);");
		}
		
		stringBuffer.append("update sgxt set auid='"+beReplaceUser+"',buid=null where username='"+insertUser+"';");//设置旧用户位置
		
		stringBuffer.append("insert into zuo_mingxi select null,z.tjuser,'"+beReplaceUser+"',"+sgxtBeReplace.getSjb()+",z.count+1 from zuo_mingxi z where down='"+insertUser+"';");//设置新用户的左边为被替代的用户
		stringBuffer.append("insert into you_mingxi select null,z.tjuser,'"+beReplaceUser+"',"+sgxtBeReplace.getSjb()+",z.count+1 from you_mingxi z where down='"+insertUser+"';");//设置新用户的左边为被替代的用户
		stringBuffer.append("insert into zuo_mingxi select null,'"+beReplaceUser+"',z.down,z.sjb,z.count+1 from zuo_mingxi z where tjuser='"+insertUser+"';");//复制旧用户的新的左边下部份层级关系
		stringBuffer.append("insert into you_mingxi select null,'"+beReplaceUser+"',z.down,z.sjb,z.count+1 from you_mingxi z where tjuser='"+insertUser+"';");//复制旧用户的新的右边下部分层级关系
		//给新插入用户的上层的zaq或zbq
		stringBuffer.append("update sgxt set zaq=zaq+"+sjb+" where username in(select tjuser from zuo_mingxi where down='"+insertUser+"');");
		stringBuffer.append("update sgxt set zbq=zbq+"+sjb+" where username in(select tjuser from you_mingxi where down='"+insertUser+"');");
		stringBuffer.append("update sgxt set zaq="+(sgxtBeReplace.getZaq()+sgxtBeReplace.getZbq()+sgxtBeReplace.getSjb())+" where username ='"+insertUser+"';");//自身要加上新挂入的替代对象
		stringBuffer.append("update sgxt set zbq=0,bq=0 where username ='"+insertUser+"';");//自身的右总 和右结余要清零  因为还没有右边的用户
		LogSystem.info("插入日志 执行如下sql"+stringBuffer.toString());
		String[] sqlArray = stringBuffer.toString().split(";");
		for(int i=0;i<sqlArray.length;i++){
			int result = sgxtDao.executeSql(sqlArray[i]);
			LogSystem.info("执行sql【"+sqlArray[i]+"】完成，影响条数"+result);
		}
//		sgxtDao.executeSql(stringBuffer.toString());
		gcuserDao.updateSjb(insertUser, sjb);
	}
	
	
//	public void generatorTopReward(Date date){
//		LogSystem.info("开始采集年度获奖数据日期="+DateUtils.getDate(date));
//		long startTimes = System.currentTimeMillis();
//		List<UserPerformance> searchs = Lists.newArrayList();
//		int year = DateUtils.getYear(date);
//		String startTime = year+"-01-01 00:00:00";
//		String endTimeStr = DateUtils.getDate(date);
//		String endTime = endTimeStr+" 23:59:59";
//		List<TopReward> list = gcuserDao.getUserTopReward(startTime);
//		if(list!=null&&list.size()>0){
//			for(TopReward tr:list){
//				searchs.add(getUserPerformanceBO(tr.getUp(),startTime, endTime));
//			}
//		}
//		if(searchs.size()>0){
//			userPerformanceDao.insert(searchs);
//		}
//		long endTimes = System.currentTimeMillis();
//		LogSystem.info("采集年度获奖数据结束，日期="+DateUtils.getDate(date)+",采集数据条数"+searchs.size()+",用去时间为="+(endTimes-startTimes)/1000+"秒！");
//	}
	
	public void generatorStatData(){
		List<ZqStat> listA = zq2016statDao.getAllXList("a");
		String startTimea = "2016-01-01 00:00:00";
		String endTimea =  "2016-12-31 23:59:59";
		for(ZqStat a:listA){
			int zup = getMyAllUserThisYearSignlePerformance(a.getUserName(), startTimea, endTimea);
			boolean isfivefull = isFiveStepFull(a.getUserName());
			Gcuser bigVipUser = userService.findMyBigUpVip(a.getUserName());
			int fu = isfivefull?1:0;
			zq2016statDao.updateZupAndFu(a.getUserName(), zup, fu,bigVipUser.getUsername(),bigVipUser.getName(), "a");
		}
		
		
		List<ZqStat> listB = zq2016statDao.getAllXList("b");
		String startTimeb = "2016-01-01 00:00:00";
		String endTimeb =  "2016-12-31 23:59:59";
        for(ZqStat b:listB){
			int zup = getMyAllUserThisYearSignlePerformance(b.getUserName(), startTimeb, endTimeb);
			boolean isfivefull = isFiveStepFull(b.getUserName());
			int fu = isfivefull?1:0;
			Gcuser bigVipUser = userService.findMyBigUpVip(b.getUserName());
			zq2016statDao.updateZupAndFu(b.getUserName(), zup, fu,bigVipUser.getUsername(),bigVipUser.getName(), "b");
		}
		
		
		List<ZqStat> listC = zq2016statDao.getAllXList("c");
		String startTimec = "2016-01-01 00:00:00";
		String endTimec =  "2017-02-23 23:59:59";
        for(ZqStat c:listC){
        	int zup = getMyAllUserThisYearSignlePerformance(c.getUserName(), startTimec, endTimec);
			boolean isfivefull = isFiveStepFull(c.getUserName());
			int fu = isfivefull?1:0;
			Gcuser bigVipUser = userService.findMyBigUpVip(c.getUserName());
			zq2016statDao.updateZupAndFu(c.getUserName(), zup, fu,bigVipUser.getUsername(),bigVipUser.getName(), "c");
		}
	}
	
	public List<UserPerformance> getUserPerformancePage(){
//		return userPerformanceDao.getListPage(time, pageIndex, pageSize);
		String d = "2017-01-01";
		List<UserPerformance> searchs = userPerformanceDao.getListPage(d);
//		if(searchs!=null&&searchs.size()>0){
//			return searchs;
//		}
		String startTime = "2016-01-01 00:00:00";
		String endTime =  "2016-12-31 23:59:59";
		
		//如果数据库中没有数据则进行查询
		if(searchs==null||searchs.size()==0){
			List<Zq2016stat> list = zq2016statDao.getAll();//获取所有小区业绩高于500万的用户
			for(Zq2016stat zq:list){
				UserPerformance t = getUserPerformanceBO(zq.getUserName(),startTime, endTime,d);
				if(t!=null){
					searchs.add(t);
				}
			}
		}else{
			if(searchs.get(0).getStep()>0){
				return searchs;
			}
		}

		for(UserPerformance search:searchs){
			search.setId(null);
			search.resetDescription();
		}
			//开始分析获得的奖品
			//筛选出满足前三个条件获取蒙迪欧的用户
			int W = 10000;
			LogSystem.info("开始蒙迪欧循环");
			//蒙迪欧循环
			for(UserPerformance search:searchs){
				if(conditionC(search)&&conditionD(search, 50*W, 1000*W)){
					int num = 0;
					String description = "";
					for(UserPerformance search2:searchs){
						if(!search2.getUserName().equals(search.getUserName())){
							if(zuoMingxiDao.get(search.getUserName(), search2.getUserName())!=null||youMingXiDao.get(search.getUserName(), search2.getUserName())!=null){
								description = description+","+search2.getUserName();
								num++;
							}
							if(num>=2){
								search.setStep(1);
								search.setDescription("达到蒙迪欧需要的团队下2个用户："+description);
								break;
							}
						}
					}
					if(search.getStep()!=1){
						String dStr = "升级蒙迪欧失败-团队下用户达到上一级奖励数量为:"+num+",分别为["+description+"]";
						search.setDescription(dStr);
					}
				}
			}
			
			
			
			LogSystem.info("蒙迪欧循环结束");
			//探险者循环
			LogSystem.info("开始探险者循环");
			for(UserPerformance search:searchs){
				if(conditionC(search)&&conditionD(search, 100*W, 3600*W)){
					int num = 0;
					String description = "";
					for(UserPerformance search2:searchs){
						if(!search2.getUserName().equals(search.getUserName())&&search2.getStep()>=1){
							if(zuoMingxiDao.get(search.getUserName(), search2.getUserName())!=null||youMingXiDao.get(search.getUserName(), search2.getUserName())!=null){
								description = description+","+search2.getUserName();
								num++;
							}
							if(num>=2){
								search.setStep(2);
								search.setDescription("达到探险者需要的团队下2个用户："+description);
								break;
							}
						}
					}
					
					if(search.getStep()!=2){
						String dStr = "升级探险者失败-团队下用户达到上一级奖励数量为:"+num+",分别为["+description+"]";
						search.setDescription(dStr);
					}
				}
			}
			LogSystem.info("探险者循环结束");
			
			//保时捷循环
			LogSystem.info("开始保时捷循环");
			for(UserPerformance search:searchs){
				if(conditionC(search)&&conditionD(search, 150*W, 5000*W)){
					int num = 0;
					String description = "";
					for(UserPerformance search2:searchs){
						if(!search2.getUserName().equals(search.getUserName())&&search2.getStep()>=2){
							if(zuoMingxiDao.get(search.getUserName(), search2.getUserName())!=null||youMingXiDao.get(search.getUserName(), search2.getUserName())!=null){
								description = description+","+search2.getUserName();
								num++;
							}
							if(num>=3){
								search.setStep(3);
								search.setDescription("达到保时捷需要的团队下2个用户："+description);
								break;
							}
						}
					}
					
					if(search.getStep()!=3){
						String dStr = "升级保时捷失败-团队下用户达到上一级奖励数量为:"+num+",分别为["+description+"]";
						search.setDescription(dStr);
					}
				}
			}
			LogSystem.info("保时捷循环结束");
			
			//小洋房循环
			LogSystem.info("开始小洋房循环");
			for(UserPerformance search:searchs){
				if(conditionC(search)&&conditionD(search, 200*W, 25000*W)){
					int num = 0;
					String description = "";
					for(UserPerformance search2:searchs){
						if(!search2.getUserName().equals(search.getUserName())&&search2.getStep()>=3){
							if(zuoMingxiDao.get(search.getUserName(), search2.getUserName())!=null||youMingXiDao.get(search.getUserName(), search2.getUserName())!=null){
								description = description+","+search2.getUserName();
								num++;
							}
							if(num>=5){
								search.setStep(4);
								search.setDescription("达到小洋房需要的团队下2个用户："+description);
								break;
							}
						}
					}
					if(search.getStep()!=4){
						String dStr = "升级小洋房失败-团队下用户达到上一级奖励数量为:"+num+",分别为["+description+"]";
						search.setDescription(dStr);
					}
				}
			}
			LogSystem.info("小洋房循环结束");
			userPerformanceDao.removeAll(d);
			userPerformanceDao.insert(searchs);
		return searchs;
	}
	
	/**
	 * 5层布满通用条件
	 * @param u
	 * @return
	 */
	private boolean conditionC(UserPerformance u){
		if(u.getFu()==0){
			u.setDescription("未满5层");
			return false;
		}
		if((u.getFiveLeftPerformance()+u.getFiveRightPerformance())*500<620000){
			u.setDescription("5层业绩未超过62w");
			return false;
		}
		return true;
	}
	
	private boolean conditionD(UserPerformance u,int d1,int d3){
		int d1t = d1/500;
		int d3t = d3/500;
		if(u.getSigleTimeTheSameuserAllPerformance()<d1t){
			u.setDescription("直推业绩未满"+d1);
			return false;
		}
		if(Math.min(u.getAllTimeLeftPerformance(), u.getAllTimeRightPerformance())<d3t){
			u.setDescription("小区业绩未满"+d3);
			return false;
		}
		return true;
	}
	
	private boolean condition3(UserPerformance u,List<UserPerformance> searchs){
		return false;
	}
	
	private boolean condition4(UserPerformance u,List<UserPerformance> searchs){
		return false;
	}
	
	public UserPerformance getUserPerformanceBO(String userName,String startTime,String endTime,String d){
		Date geDate = DateUtils.StringToDate(d, DateStyle.YYYY_MM_DD);
		UserPerformance result = new UserPerformance();
		result.setSigleAllPerformance(getUserThisYearSiglePerformance(userName, null, null));
		result.setSigleTimeAllPerformance(getUserThisYearSiglePerformance(userName, startTime, endTime));
		result.setSigleTheSameuserAllPerformance(getMyAllUserThisYearSignlePerformance(userName,  null, null));
		result.setSigleTimeTheSameuserAllPerformance(getMyAllUserThisYearSignlePerformance(userName,  startTime, endTime));
//		startTime = startTime + " 00:00:00";
//		endTime = endTime + " 23:59:59";
		result.setFiveLeftPerformance(zuoMingxiDao.getZUserAllPerformanceByTime(userName, null, null,5));
		result.setFiveLeftTimePerformance(zuoMingxiDao.getZUserAllPerformanceByTime(userName, startTime, endTime,5));
		result.setFiveRightPerformance(youMingXiDao.getYUserAllPerformanceByTime(userName, null, null,5));
		result.setFiveRightTimePerformance(youMingXiDao.getYUserAllPerformanceByTime(userName, startTime, endTime,5));
		Sgxt sgxt = sgxtDao.get(userName);
		result.setZaq(sgxt.getZaq());
		result.setZbq(sgxt.getZbq());
		result.setAllTimeLeftPerformance(zuoMingxiDao.getZUserAllPerformanceByTime(userName, startTime, endTime,0));
		result.setAllTimeRightPerformance(youMingXiDao.getYUserAllPerformanceByTime(userName, startTime, endTime,0));
		boolean isfivefull = isFiveStepFull(userName);
		result.setFu(isfivefull?1:0);
		result.setAddTime(geDate);
		result.setUserName(userName);
		return result;
	}
	

	
	
	public void setVerifile(String userName,int verify){
		if(verify==Global.VERIFY){//设置审核
			userExtinfoDao.updateUserExtinfo(userName, verify);
		}else{//设置成免审核
			if(!userExtinfoDao.updateUserExtinfo(userName, verify)){
				userExtinfoDao.add(new UserExtinfo(userName,verify));
			}
		}
	}
	
	public Fcxt getFcxt(int id){
		return fcxtDao.get(id);
	}
	
	public void updateJy5wRation(int ration){
		fcxtDao.updateJy5wRation(ration);
	}
	
	public void updateCz04(int cz04){
		fcxtDao.updateCz04(cz04+"");
	}
	
	public YbCjbBean getStatBean(String userName,String startDate,String endDate){
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			startDate = startDate +" 00:00:00";
			endDate = endDate+" 23:59:59";
		}
		YbCjbBean bean = new YbCjbBean();
		bean.setInCjb(vipcjglDao.getSumVipSr(userName, startDate, endDate));
		bean.setOutCjb(vipcjglDao.getSumVipZc(userName, startDate, endDate));
		bean.setInYb(datePayDao.getSumSyjz(userName, startDate, endDate));
		bean.setOutYb(datePayDao.getSumjc(userName, startDate, endDate));
		Gcuser gcuser = gcuserDao.getUser(userName);
		bean.setNowYb(gcuser.getPay());
		bean.setNowCjb(gcuser.getVipcjcjb());
		return bean;
	} 
	
	public IPage<PointsChangeLog> getPointChangeLogPage(int pageIndex,int pageSize){
		return pointsChangeLogDao.getPageList(pageIndex, pageSize, "order by id desc");
	}
	/**
	 * 无日志添加用户上层的可结算区
	 * @param userName
	 * @param sjbCount
	 * @return
	 */
	public void addAqOrBqForUserNoLog(String userName,int sjbCount,String desc){
		String tag = "["+desc+"]要求处理的,添加用户["+userName+"]上层可计算区数量为["+sjbCount+"]"+"time=["+new Date()+"]==>";
		//左区所有上级用户
		List<ZuoMingxi> zList = zuoMingxiDao.getDownList(userName);
		for(ZuoMingxi zm:zList){
			//该用户当前层的总数量
			int sumCountSjb = zuoMingxiDao.getSumSjb(zm.getTjuser(), zm.getCount());
			Sgxt sg = sgxtDao.get(zm.getTjuser());
			int canAdd = sg.getCfd()-sumCountSjb;
			if(canAdd>0){
				if(sgxtDao.updateAq(zm.getTjuser(), canAdd)){
					LogSystem.log(tag+"给左区用户["+zm.getTjuser()+"]层为["+zm.getCount()+"]增加可结算数量"+canAdd+"成功。已加数量["+sumCountSjb+"],层封顶为"+sg.getCfd());
				}else{
					LogSystem.log(tag+"给左区用户["+zm.getTjuser()+"]层为["+zm.getCount()+"]增加可结算数量"+canAdd+"失败。已加数量["+sumCountSjb+"],层封顶为"+sg.getCfd());
				}
			}else{
				LogSystem.log(tag+"左区用户["+zm.getTjuser()+"]层限制，该层["+zm.getCount()+"]已有["+sumCountSjb+"],封顶为["+sg.getCfd()+"]。不做添加");
			}
		}
		//右区所有上级用户
		List<YouMingxi> yList = youMingXiDao.getDownList(userName);
		for(YouMingxi ym:yList){
			int sumCountSjb = youMingXiDao.getSumSjb(ym.getTjuser(), ym.getCount());
			Sgxt sg = sgxtDao.get(ym.getTjuser());
			int canAdd = sg.getCfd()-sumCountSjb;
			if(canAdd>0){
				if(sgxtDao.updateAq(ym.getTjuser(), canAdd)){
					LogSystem.log(tag+"给右区用户["+ym.getTjuser()+"]层为["+ym.getCount()+"]增加可结算数量"+canAdd+"成功。已加数量["+sumCountSjb+"],层封顶为"+sg.getCfd());
				}else{
					LogSystem.log(tag+"给右区用户["+ym.getTjuser()+"]层为["+ym.getCount()+"]增加可结算数量"+canAdd+"失败。已加数量["+sumCountSjb+"],层封顶为"+sg.getCfd());
				}
			}else{
				LogSystem.log(tag+"右区用户["+ym.getTjuser()+"]层限制，该层["+ym.getCount()+"]已有["+sumCountSjb+"],封顶为["+sg.getCfd()+"]。不做添加");
			}
		}
		LogSystem.log(tag+"处理结束");
	}
	/**
	 * 更新用户
	 * @param opUser
	 * @param user
	 * @param addAq
	 * @param addBq
	 * @param ip
	 * @return
	 */
	public boolean updateUserAqOrBq(String opUser,String user,int addAq,int addBq,String ip){
		String logTag = "["+opUser+"]修改用户AQ和BQ,IP=["+ip+"],date="+new Date()+"user=["+user+"],addAq=["+addAq+"],addBq=["+addBq+"]==>";
		boolean result1 = sgxtDao.updateAq(user, addAq);
		boolean result2 = sgxtDao.updateBq(user, addBq);
		LogSystem.log(logTag+",aqResult=["+result1+"],bqResult=["+result2+"]");
		return result1&result2; 
	}
	
	/*
	 * 获取用户概览信息
	 */
	public List<UserStatBean> getUserStatBeanList(String idcardNum){
		List<UserStatBean>  result = Lists.newArrayList();
		List<Gcuser> userList = gcuserDao.getUserByIdCard(idcardNum);
		for(Gcuser gcuser: userList){
			Sgxt sgxt = sgxtDao.get(gcuser.getUsername());
			Date activeTime = null;
			if(sgxt!=null){
				activeTime = sgxt.getBddate();
			}
			UserStatBean userStatBean = new UserStatBean(gcuser.getUsername(), gcuser.getName(), activeTime, gcuser.getSjb(), gcuser.getCjtj(), gcuser.getJyg(), gcuser.getPay());
			double vipIn = datePayDao.getSumVipTranferInYb(gcuser.getUsername());
			userStatBean.setIn(vipIn+gcuser.getRgpay());
			double out = datePayDao.getSumJcNotIncludeTheSameIn(gcuser.getUsername());
			userStatBean.setOut(out);
			result.add(userStatBean);
		}
		return result;
	}
//	public static void main(String[] args) {
//		String str = "0.820000000000";
//		System.out.println(StringUtils.substring(str, 0, 5));
//	}
	
	/**
	 * 撤销卖出一币
	 * @param admin 操作人
	 * @param payid 订单号
	 * @param ip	
	 */
	@Transactional
	public void cancleYbSale(String admin,int payid, String resionMassage, String ip){
		Txpay txpay = txPayDao.getByPayid(payid);
		if(txpay==null){
			throw new ServiceException(1, "此订单不存在！");
		}
		
		String userName = txpay.getPayusername();
		if(txpay.getEp()>0 || txpay.getZftime()!=null || txpay.getKjygid()!=0){
			throw new ServiceException(2, "该一币交易进行中或已经由它人交易成功，暂时不能撤销，或稍后再试！");
		}
		if(datePayDao.updateByQlid(txpay.getQlid())){
			gcuserDao.backSaleYb(userName, txpay.getPaynum());
			Gcuser gcuser = gcuserDao.getUser(userName);
			Datepay datePay = new Datepay();
			datePay.setUsername(userName);
			datePay.setSyjz(txpay.getPaynum());
			datePay.setPay(gcuser.getPay());
			datePay.setJydb(gcuser.getJydb());
			datePay.setRegid("提现退回 ");
			datePay.setNewbz(YbChangeType.ADMIN_ORDER_CANCEL);
			datePay.setTxbz(1); 
			datePay.setAbdate(new Date());
			datePay.setOrigintype(YbChangeType.SYSTEM_TIXIANTUIHUI);
			logService.addDatePay(datePay);
			
			if(!txPayDao.updateByPayid(payid, 0, new Date(), "已经转账", new Date(), resionMassage, ip)){
				throw new ServiceException(3000, "未知错误");
			}
			//删除索引
			txPayDao.deleteIndex(payid);
			
			if(!gcuserDao.updatePayOk(gcuser.getName(), gcuser.getUserid(), 0)){
				throw new ServiceException(3000, "未知错误");
			}
		}else{
			throw new ServiceException(2, "该一币交易进行中或已经由它人交易成功，暂时不能撤销，或稍后再试！");
		}
	}
	
	/**
	 * 
	 * 重置玩家成就
	 * 
	 * @param guser 需要重置的玩家
	 * 
	 * @return
	 * */
	public String resetUserAchivement(String guser) {
//		List<ZuoMingxi> zList = zuoMingxiDao.getTjuserList(guser);
//		if(zList!=null&&!zList.isEmpty()){
//			for(ZuoMingxi zuoMingxi:zList){
//				int sjtjzb = zuoMingxiDao.getSumSjb(zuoMingxi.getTjuser(), zuoMingxi.getCount());
//				if(sjtjzb>0){
//					if(zuoMingxi.getCount()>0&&zuoMingxi.getCount()<=16){
//						sgxtDao.updateZfiled(zuoMingxi.getTjuser(), "z"+zuoMingxi.getCount(), sjtjzb,sjtjzb,zuoMingxi.getCount());
//					}
//				}
//			}
//		}
//		List<YouMingxi> yList = youMingXiDao.getTjuserList(guser);
//		if(yList!=null&&!yList.isEmpty()){
//			for(YouMingxi youMingxi:yList){
//				int sjtjzb = youMingXiDao.getSumSjb(youMingxi.getTjuser(), youMingxi.getCount());
//				if(sjtjzb>0){
//					if(youMingxi.getCount()>0&&youMingxi.getCount()<=16){
//						sgxtDao.updateYfiled(youMingxi.getTjuser(), "y"+youMingxi.getCount(), sjtjzb,sjtjzb,youMingxi.getCount());
//					}
//				}
//			}
//		}
		resetUserZandY16(guser);
		return "success";
	}
	/**
	 * 重置用户z1-16和 y1-16的临时值
	 * @param userName
	 */
	public void resetUserZandY16(String userName){
		for(int i=1;i<=16;i++){
			int zIsjb = zuoMingxiDao.getSumSjb(userName, i);
			sgxtDao.updateZOrYfiled(userName, "z"+i, zIsjb);
			int yIsjb = youMingXiDao.getSumSjb(userName, i);
			sgxtDao.updateZOrYfiled(userName, "y"+i, yIsjb);
		}
	}
	
	
	/**
	 * 
	 * 重置一币订单
	 * @param admin
	 * @param payId
     * @param opstate
     * @param ip
     * @return
	 * */
	@Transactional
	public void resetYbOrder(String admin, int payid, int opstate, String ip) {
		Txpay oldtxpay = txPayDao.getByPayid(payid);
		if(oldtxpay==null){
			throw new ServiceException(1, "此订单不存在！");
		}
		
		String userName = oldtxpay.getPayusername();
		
		//1、处理老订单，2、处理新订单
		
		//获得老订单日志
		Datepay olddatePay=datePayDao.getById(oldtxpay.getQlid());
		
		//修改之前订单，修改为完成状态（并且做日志和订单的修改）
		//重新生成订单，并增加相关的日志记录
		/**老订单处理开始*/
		Gcuser gcuser = gcuserDao.getUser(userName);
		
		if(!txPayDao.updateOpStateByPayid(payid, 0, new Date(), "已经转账", new Date(), opstate, ip)){//修改老订单
			throw new ServiceException(3000, "未知错误");
		}
		
		//更新索引
		txPayDao.updateIndexEp(payid, 2);
		
		
		/**老订单处理完毕，重新生成新订单*/
		
		
		int saleNum =olddatePay.getJc();
		
		Txpay txpay = txPayDao.get();
		int jypay = 1;
		if(txpay!=null){
			jypay = txpay.getPayid()+1;
		}
		
		
		Txpay txpay2 = new Txpay();
		txpay2.setPayusername(userName);
		txpay2.setCxt(gcuser.getCxt());
		txpay2.setPaynum(saleNum);
		txpay2.setPaynum9(oldtxpay.getPaynum9());
		txpay2.setPayname(gcuser.getName());
		txpay2.setPaybank(gcuser.getBank());
		txpay2.setPaycard(gcuser.getCard());
		txpay2.setPayonoff("尚未转账");
		txpay2.setBankbz(oldtxpay.getBankbz());
		txpay2.setBz(gcuser.getPay()+"");
		txpay2.setDqu(gcuser.getDqu());
		txpay2.setQlid(oldtxpay.getQlid());
		txpay2.setPdid(11);
		txpay2.setJyid(jypay);
		txpay2.setVipname(gcuser.getVipname());
		txpay2.setTxvip(Global.NOVERIFY);//默认需不要审核
		UserExtinfo userExtinfo = userExtinfoDao.get(userName);
		//是否生审核过的
		if(userExtinfo!=null&&userExtinfo.getNeedVerify()==Global.NOVERIFY){
				txpay2.setTxvip(Global.VERIFY);
		}
		
		txpay2.setTxip(ip);
		int newpayid = txPayDao.add(txpay2);
		
		//添加索引
		TxpayIndex index = new TxpayIndex();
		index.setPayid(newpayid);
		index.setEp(txpay2.getEp());
		index.setTxvip(txpay2.getTxvip());
	    index.setCreatedTime(new Date());
		txPayDao.addTxIndex(index);
		//新增订单完毕
		
		
	}
	
	
	public static AtomicBoolean mcdealJfLock = new AtomicBoolean(false);
	//当前已处理的数量
	public static int mccurrentNum = 0;
	//当前需要处理的数量
	public static int mcneedDealNum = 0;
	public void dealJfMcOrder(int num) {
		if(num<=0){
			throw new ServiceException(1,"次数不能小于0");
		}
		if(!mcdealJfLock.compareAndSet(false, true)){
			throw new ServiceException(2,"已有线程在执行，不能同时开启多个线程");
		}
		mcneedDealNum = num;
		mccurrentNum = 0;
		LogSystem.log("开始成交所有卖出积分的信息,num="+num);
		final int pageSize = 500;
		List<Gpjy> page = null;
		List<Gcuser> listRandomUserName = gcuserDao.getCompanlyUser();
		while(true){
			page = gpjyDao.getMcPageForSystemOrderByPay(pageSize);
			if(page!=null&&page.size()>0&&mccurrentNum<num){
				LogSystem.info("处理第一页，有数量 ="+page.size());
				long sigleStartTime = System.currentTimeMillis();
				for(Gpjy gpjy:page){
					if(mccurrentNum<num){
						try {
							mrJfForSystem(getRadomUserName(listRandomUserName), gpjy);
							mccurrentNum++;
						} catch (Exception e) {
							LogSystem.error(e, "[这条记录出错了]---gpgy="+gpjy);
						}
					}else{
						break;
					}
				}
				long sigleEndTime = System.currentTimeMillis();
				LogSystem.info("处理完毕，有数量 ="+page.size()+",时长="+(sigleEndTime-sigleStartTime)+"毫秒");
			}else{
				break;
			}
		}
		mcdealJfLock.compareAndSet(true, false);
		LogSystem.log("成交所有积分卖出信息结束,一共处理订单数量"+mccurrentNum);
		
	}
	
	
	/**
	 *  系统积分买入
	 * 
	 * @param dfuser 
	 * @param gpjy1
	 */
	private void mrJfForSystem(String dfuser, Gpjy gpjy1) {
		
		Gcuser gcuser = gcuserDao.getUser(dfuser);
		// 给公司账号积分
		gcuserDao.updateJyg(dfuser, -gpjy1.getMcsl().intValue());
		//并且增加记录获得的积分记录
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(dfuser);
		gpjy.setMysl(gpjy1.getMcsl());
		gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
		gpjy.setPay(gpjy1.getPay());
		gpjy.setJypay(gpjy1.getJypay());
		gpjy.setBz("买入成功");
		gpjy.setCgdate(new Date());
		gpjy.setJy(1);
		gpjy.setDfuser(gpjy1.getUsername());
		gpjyDao.add(gpjy);
		
		
		//修改订单状态
		if (!gpjyDao.updateSaleSuccess(gpjy1.getId(), dfuser, "卖出成功",gpjy1.getMcsl())) {
			throw new ServiceException(2, "该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！");
		}

		double dqpay92 = (0.9 * gpjy1.getJypay());
		int dqpay = (int) (dqpay92 * 1 + 0.1);
		double mc70a = 0.7 * dqpay;
		int mc70 = (int) (mc70a * 1 + 0.1);
		double mc30a = 0.3 * dqpay;
		int mc30 = (int) (mc30a * 1 + 0.1);

		//给卖出玩家一币
		gcuserDao.addWhenOtherPersionBuyJbCard(gpjy1.getUsername(), mc70);
		//给卖出玩家金币
		gcuserDao.addOnlyJB(gpjy1.getUsername(), mc30);

		gcuserDao.reduceStopjyg(gpjy1.getUsername());
		
		
		String mcdj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

		Gcuser gcuser2 = gcuserDao.getUser(gpjy1.getUsername());
		//记录一币和金币日志
		Datepay datePay = new Datepay();
		datePay.setUsername(gpjy1.getUsername());
		datePay.setSyjz(mc70);
		datePay.setPay(gcuser2.getPay());
		datePay.setJydb(gcuser2.getJydb());
		datePay.setJyjz(mc30);
		datePay.setRegid("卖出" + gpjy1.getMcsl() + "积分单价" + mcdj + "到" + dfuser);
		datePay.setAbdate(new Date());
		datePay.setOrigintype(YbChangeType.JF_SELL);
		logService.addDatePay(datePay);

		//删除索引
		gpjyDao.deleteIndex(gpjy1.getId());
		
		//不知道干嘛的...
		fcxtDao.update(2,gpjy1.getMcsl().intValue());
		
	}
	
	/**
	 * 得到分页记录列表
	 * @param user
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<AbsModifyUserLog> getModifyUserLogPageListByUsername(String user,int pageSize, int pageIndex) {
		IPage<AbsModifyUserLog> page= modifyUserLogDao.getPageList(user,pageSize,pageIndex);
		Collection<AbsModifyUserLog> tempList = page.getData();
		List<AbsModifyUserLog> result=new ArrayList<>();
		for (AbsModifyUserLog date : tempList) {
			date.setCountryName(interRegionCodeDao.getInterCodeByRegionCode(date.getAreacode()).getCountry_name());
			date.setOldCountryName(interRegionCodeDao.getInterCodeByRegionCode(date.getOldareacode()).getCountry_name());
			result.add(date);
		}
		return new Page<AbsModifyUserLog>(result, page.getTotalSize(), pageSize, pageIndex);
	}
	
	/*public boolean addFcxt(Fcxt fcxt) {
		return fcxtDao.addFcxt(fcxt);
	}*/
	
	public Fcxt getFcxt(String userName) {
		return fcxtDao.getAdminUser(userName);
	}
	
	/*public boolean updateFcxtPass(String userName, String pass) {
		return fcxtDao.updatePss(userName,pass);
		
	}*/
	public Cache<String, Session> getAdminUserMap() {
		return adminUserMap;
	}
	public void setAdminUserMap(Cache<String, Session> adminUserMap) {
		this.adminUserMap = adminUserMap;
	}
	/**
	 * 设置2016年业绩数据大vip
	 */
	public void setBigVipUser(){
		LogSystem.info("开始设置数据大vip");
		List<Zq2016stat> list = zq2016statDao.getAll();
		if(list!=null&&list.size()>0){
			for(Zq2016stat zq2016stat:list){
				String bigVipUser = userService.findMyBigUpVipName(zq2016stat.getUserName());
				Gcuser gcuser = gcuserDao.getUser(bigVipUser);
				boolean result = zq2016statDao.updateBigVipUser(zq2016stat.getUserName(), bigVipUser,gcuser.getName());
				LogSystem.info("用户["+zq2016stat.getUserName()+"]的大vip=["+bigVipUser+"]，大vip姓名["+gcuser.getName()+"],更新结果为:["+result+"]");
			}
		}
	}
}
