package com.yq.manager.service;

import java.io.File;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Lists;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.exception.ServiceException;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.FileCreatUtil;
import com.yq.common.utils.MD5Security;
import com.yq.cservice.bean.SqDayAddBean;
import com.yq.manager.bo.BackCountBean;
import com.yq.manager.bo.DateBean;
import com.yq.manager.bo.GcfhBean;
import com.yq.manager.bo.NewsDateBean;
import com.yq.manager.bo.PmmltBean;
import com.yq.manager.bo.W10Bean;
import com.yq.manager.dao.AddShengDao;
import com.yq.manager.dao.FhdateDao;
import com.yq.manager.dao.MqfhDao;
import com.yq.manager.dao.MtfhtjDao;
import com.yq.manager.dao.SgtjDao;
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
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.Mtfhtj;
import com.yq.user.bo.Sgtj;
import com.yq.user.bo.Sgxt;
import com.yq.user.bo.Tduser;
import com.yq.user.bo.Txpay;
import com.yq.user.bo.Vipcjgl;
import com.yq.user.bo.YouMingxi;
import com.yq.user.bo.ZuoMingxi;
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
import com.yq.user.dao.JfcpDao;
import com.yq.user.dao.SgxtDao;
import com.yq.user.dao.TduserDao;
import com.yq.user.dao.TxPayDao;
import com.yq.user.dao.TxifokDao;
import com.yq.user.dao.VipcjglDao;
import com.yq.user.dao.YouMingXiDao;
import com.yq.user.dao.ZuoMingxiDao;
import com.yq.user.service.LogService;
import com.yq.user.service.UserService;

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
	
	
	
  	private Cache<String,String> adminUserMap = CacheBuilder.newBuilder().expireAfterAccess(24, TimeUnit.HOURS).maximumSize(2000).build();

	
	public String getLoginAdminUserName(String sessionId){
		return adminUserMap.getIfPresent(sessionId);
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
	 * @return
	 */
	@Transactional
	public boolean updateUser(String userName,String password3,String card, String bank,  String name, String call,String  email,String qq,String userid,int payok,String jcname,String jcuserid,String password,String pwdate,String ip){
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
		
		if(gcuserDao.updateUserByAdmin(userName,password3, card, bank, nowName, call, email, qq, nowUserId, payok, jcname, jcuserid, md5Password,date)){
			dateipDao.addDateIpLog(userName, "修改资料sy-"+userName, ip);
		}
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
		}
		if(md5Password!=null){
			dateipDao.addDateIpLog("admin", "修改密码sy-"+userName, ip);
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
	public void changeArea(String userName,int sjid){
		gcuserDao.updateGwuid(userName, sjid);
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
		return mtfhtjDao.getPageList(pageIndex, pageSize, "order by tjid desc");
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
		backCountBean.setRs_cb(sgxtDao.getSumZfh());
		backCountBean.setRs_mq(sgxtDao.getSumMqfh());
		backCountBean.setRs_zd(sgxtDao.getSumSjb());
		return backCountBean;
	}
	
	/**
	 * 执行双区计算
	 */
	@Transactional
	public void doubelAreaCount(){
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
			pageIndex++;
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
	
	private void dealDoubleAreaCount(Sgxt sgxt,Fcxt fcxt){
		int jsq = 0 ;
		if(sgxt.getAq()==sgxt.getBq()){
			jsq = sgxt.getBq();
		}else if(sgxt.getAq()<sgxt.getBq()){
			jsq = sgxt.getAq();
		}else if(sgxt.getAq()>sgxt.getBq()){
			jsq = sgxt.getBq();
		}
		if(jsq*50>sgxt.getFdpay()){
			sgxtDao.updateDoubleCount(sgxt.getId(), sgxt.getFdpay(), sgxt.getFdpay()+sgxt.getCbpay(), 0, 0);
		}else{
			sgxtDao.updateDoubleCount(sgxt.getId(),jsq*50, jsq*50+sgxt.getCbpay(), sgxt.getAq()-jsq, sgxt.getBq()-jsq);
		}
		
		Gcuser gcuser = gcuserDao.getUser(sgxt.getUsername());
		if(gcuser!=null){
			gcuserDao.addYbForDoubleAreaCount(gcuser.getUsername(), (int)sgxt.getPay());
			Datepay datepay = new Datepay();
			datepay.setUsername(sgxt.getUsername());
			datepay.setRegid("游戏业务"+jsq+"平衡奖金");
			datepay.setPay(gcuser.getPay()+(int)sgxt.getPay());
			datepay.setSyjz((int)sgxt.getPay());
			datepay.setJydb(gcuser.getJydb());
			datepay.setBz(fcxt.getPayadd());
			datepay.setNewbz(1);
			logService.addDatePay(datepay);
			
			if(gcuser.getCxt()<3&&gcuser.getCxdate().getTime()>System.currentTimeMillis()){
				gcuserDao.reduceYbForDoubleAreaCount(gcuser.getUsername(), (int)sgxt.getPay());
				Datepay datepay2 = new Datepay();
				datepay2.setUsername(sgxt.getUsername());
				datepay2.setRegid("扣星期间不享受平衡奖金");
				datepay2.setPay(gcuser.getPay());
				datepay2.setJc((int)sgxt.getPay());
				datepay2.setJydb(gcuser.getJydb());
				datepay2.setBz(fcxt.getPayadd());
				datepay2.setNewbz(1);
				logService.addDatePay(datepay2);
			}
			
			//给他的上级处理
			Gcuser upUser = gcuserDao.getUser(gcuser.getUp());
			if(upUser!=null&&upUser.getSjb()>0){
				int addNum =  (int)(sgxt.getPay()*0.1);
				gcuserDao.addYbForDoubleAreaCountJypay(upUser.getUsername(),addNum);
				Datepay datepay3 = new Datepay();
				datepay3.setUsername(upUser.getUsername());
				datepay3.setRegid(gcuser.getUsername()+"游戏业务"+jsq+"辅导奖");
				datepay3.setPay(upUser.getPay()+addNum);
				datepay3.setSyjz(addNum);
				datepay3.setJydb(upUser.getJydb());
				datepay3.setNewbz(8);
				logService.addDatePay(datepay3);
				
				if(upUser.getCxt()<2&&upUser.getCxdate().getTime()>System.currentTimeMillis()){
					gcuserDao.reduceYbForDoubleAreaCountJypay(upUser.getUsername(),addNum);
					Datepay datepay4 = new Datepay();
					datepay4.setUsername(upUser.getUsername());
					datepay4.setRegid("扣星期间不享受辅导奖金");
					datepay4.setPay(upUser.getPay());
					datepay4.setJc(addNum);
					datepay4.setJydb(upUser.getJydb());
					datepay4.setBz(fcxt.getPayadd());
					datepay4.setNewbz(8);
					logService.addDatePay(datepay4);
				}
			}
			
		}
	}
	
	/**
	 * 执行计算
	 */
	public void backCount(Date date){
		if(!isCanBackCount()){
			throw new ServiceException(1, "还没有到结算时间！");
		}
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
	
	public NewsDateBean getNewsDateBean(){
		NewsDateBean result = new NewsDateBean();
		result.setRslj(dateipDao.getCountId());
		String todayStr = DateUtils.getDate(new Date());
		String todayStart = todayStr+" 00:00:00";
		String todayEnd = todayStr+" 23:59:59";
		result.setRsjt(dateipDao.getCountByTime(todayStart, todayEnd));
		String yesterdayStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -1));
		String yesterdayStart = yesterdayStr+" 00:00:00";
		String yesterdayEnd = yesterdayStr+" 23:59:59";
		result.setRszt(dateipDao.getCountByTime(yesterdayStart, yesterdayEnd));
		String qtStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -2));
		String qtStart = qtStr+" 00:00:00";
		String qtEnd = qtStr+" 23:59:59";
		result.setRsqt(dateipDao.getCountByTime(qtStart, qtEnd));
		String dqtStr =  DateUtils.getDate(DateUtils.addDay(new Date(), -3));
		String dqtStart = dqtStr+" 00:00:00";
		String dqtEnd = dqtStr+" 23:59:59";
		result.setRsdqt(dateipDao.getCountByTime(dqtStart, dqtEnd));
		return result;
		
	}
	/**
	 * 所有的登录日志
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Dateip> getAllDateIp(int pageIndex,int pageSize){
		return dateipDao.getAllPageList(pageIndex, pageSize);
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
	public void chargeBdbByAdmin(String csUser,String toUserName,int amount,String ip,String cjfs){
		Gcuser toUser = gcuserDao.getUser(toUserName);
		if(toUser==null){
			throw new ServiceException(1, "该用户名不存在，请检查输入是否正确！");
		}
		if(toUser.getGmdate()!=null&&toUser.getGmdate().getTime()+2*60*1000>System.currentTimeMillis()){
			throw new ServiceException(2, "两分钟内只能充值一次，请稍后再试！");
		}
		if(amount<5000){
			if(toUser.getPay()<9*amount){
				throw new ServiceException(3, "本次充值"+amount+"可一币小于"+9*amount+"，请先补充一币！");
			}
			gcuserDao.updateCjtj(toUserName, amount);
			
			if(!userService.changeYb(toUserName, -9*amount, "转为报单币", 0, null)){
				throw new ServiceException(3, "本次充值"+amount+"可一币小于"+9*amount+"，请先补充一币！");
			}
			userService.updateSybdb(toUserName, amount*10, "充值"+amount+"与一币"+9*amount+"生效");

		}else{
			if(toUser.getSyep()<amount){
				throw new ServiceException(4, "实行一半一币一半充值，本次充值"+amount+"可报单币小于"+amount+"，请先补充报单币！");
			}
			gcuserDao.updateCjtj(toUserName, amount);
			if(!this.updateSybdbByManager(toUserName, amount, amount*2, amount*2, "充值"+amount+"与"+amount+"报单币生效")){
				throw new ServiceException(4, "实行一半一币一半充值，本次充值"+amount+"可报单币小于"+amount+"，请先补充报单币！");
			}
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
	 * @param userName
	 * @param addAmount
	 */
	public void addSyep(String userName,int addAmount){
		if (gcuserDao.addSyep(userName, addAmount)) {
			Gcuser gcuser = gcuserDao.getUser(userName);
			Bdbdate bdbdate = new Bdbdate();
			bdbdate.setZuser(userName);
			bdbdate.setSy(addAmount);
			bdbdate.setSybdb(gcuser.getSybdb());
			bdbdate.setLjbdb(gcuser.getLjbdb());
			bdbDateDao.add(bdbdate);
		}else{
			throw new ServiceException(1, "该用户名不存在，请检查输入是否正确！");
		}
	}
	/**
	 * vip充值
	 * @param userName
	 * @param addAmount
	 */
	public void addVipcjb(String userName,int addAmount){
		if(addAmount<1000||addAmount%1000!=0){
			throw new ServiceException(1, "充值必须是1000的倍整数如：2000，3000，4000，5000，6000，7000，8000，请检查输入是否正确！");
		}
		Gcuser gcuser = gcuserDao.getUser(userName);
		if(gcuser==null||gcuser.getVip()==0){
			throw new ServiceException(2, "本功能只能VIP玩家开放！");
		}
		
		if(gcuserDao.addVipcjcjb(userName, addAmount)){
			Vipcjgl vipcjgl = new Vipcjgl();
			vipcjgl.setCjuser("系统");
			vipcjgl.setCjjo(addAmount);
			vipcjgl.setSycjb(gcuser.getVipcjcjb()+addAmount);
			vipcjgl.setVipuser(userName);
			vipcjgl.setBz("入账");
			vipcjgl.setCjdate(new Date());
			vipcjglDao.add(vipcjgl);
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
						sgxtDao.updateZfiled(zuoMingxi.getTjuser(), "z"+zuoMingxi.getCount(), sjtjzb,sjtjzb-sjb,zuoMingxi.getCount());
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
						sgxtDao.updateYfiled(youMingxi.getTjuser(), "y"+youMingxi.getCount(), sjtjzb,sjtjzb-sjb,youMingxi.getCount());
					}
				}
			}
		}
		userService.CalculateQ(bduser, sjb, bduser);
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
		return gcuserDao.getSqDayAddUserPages(pageIndex, pageSize, strArray[0], strArray[1]);
	}
	
	private String[] getTime(int day){
		String startTime = null;
		String endTime = null;
		String baseStr = null;
		if(day==0){
			baseStr = DateUtils.getDate(new Date());
		}else{
			baseStr = DateUtils.getDate(DateUtils.addDay(new Date(), -1));
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
	 * 后台执行xxxx
	 */
	public void man123(){
		gcuserDao.updateJygdateAndJygt1(">50000", 0, new Date(), 1);
		gcuserDao.updateJygdateAndJygt1("<50000", 1, null, 0);
		gcuserDao.updateAbdateAndDbtl(">30", 0, new Date(), 1);
		gcuserDao.updateAbdateAndDbtl("<30", 1, null, 0);
		fcxtDao.updateJy5w();
		
		Fcxt fcxt = fcxtDao.get(2);
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
		    				adddatepay(clname, hs30, gcuser.getJydb(), gcuser.getPay(), "超出"+dbjc+"系统回收30%");
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
	    while(true){
			page= gcuserDao.getBatchUser(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
	    			for(Gcuser gcuser:tempList){
	    				String clname=gcuser.getUsername();
	    				int jydball=gcuser.getJydb();
	    				int jydbnumber=gcuser.getJydb()-30;
	    				int	ForCount=(int)(jydbnumber/30);
	    				int lasenumber=jydbnumber%30;
	    				if(ForCount>0){
	    					for(int j=1;j<=ForCount;j++){
	    						int insertid = adddatepay(clname,30,jydball-j*30,gcuser.getPay(),"买入挂牌中(系统代)");
	    						addGpjy(clname,30,(jydball-ForCount*30)*1d,insertid,jyj);
	    					}
	    				}
	    				if(lasenumber>1){
	    					 int insertid=adddatepay(clname,lasenumber,jydball-ForCount*30-lasenumber,gcuser.getPay(),"买入挂牌中(系统代)");
	    					 addGpjy(clname,lasenumber,(jydball-ForCount*30-lasenumber)*1d,insertid,jyj);
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
		datePayDao.addDatePay(datepay);
		return datePayDao.getLastInsertId();
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
		gpjyDao.add(gpjy);
	}
	
	public void managequeren(){
		int pageIndex = 0;
		int pageSize = 100;
		Collection<Gcuser> tempList = null;
		IPage<Gcuser> page = null;
	    String endTime = DateUtils.DateToString(DateUtils.addDay(new Date(), -7),DateStyle.YYYY_MM_DD_HH_MM_SS);
	    //第一遍循环
	    while(true){
			page= gcuserDao.getManageQueren(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
	    			for(Gcuser gcuser:tempList){
	    				String clname = gcuser.getUsername();
	    				double mcsl=gcuser.getJyg()-50000;
	    				double mc30=mcsl*0.3;
	    				int hs30=(int)(mc30/1);
	    				if(hs30>0){
	    					if(gcuserDao.updateJyg(clname, hs30)){
	    						Gpjy gpjy = new Gpjy();
		    					gpjy.setUsername(clname);
		    					gpjy.setMcsl(hs30*1d);
		    					gpjy.setSysl((gcuser.getJyg()-hs30)*1d);
		    					gpjy.setBz("超出"+mcsl+"回收30%");
		    					gpjy.setDfuser("系统管理员");
		    					gpjy.setCgdate(new Date());
		    					gpjy.setJy(1);
		    					gpjyDao.add(gpjy);
	    					}
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
	    
	    //第一遍循环
	    while(true){
			page= gcuserDao.getManageQueren(pageIndex, pageSize, endTime);
	    	if(page!=null){
	    		tempList = page.getData();
	    		if(tempList!=null&&tempList.size()>0){
	    			for(Gcuser gcuser:tempList){
	    				String clname= gcuser.getUsername();
	    				int jygall=gcuser.getJyg();
						int  jygnumber=gcuser.getJyg()-50000;
						int  ForCount=(int)(jygnumber/200);
						int  lasenumber=jygnumber%200;
						if(ForCount>0){
							for(int j=1;j<=ForCount;j++){
								addGpjyForManageQueren(clname, 200,jygall-j*200);
							}
						} 
						if(lasenumber>0){
							addGpjyForManageQueren(clname,lasenumber,jygall-ForCount*200-lasenumber);
						}
						gcuserDao.updateManageQueren(clname, 50000, null, 0);
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
	
	private void addGpjyForManageQueren(String clname,double mcsl,double jyg){
		Gpjy gpjy = new Gpjy();
		gpjy.setUsername(clname);
		gpjy.setMcsl(mcsl);
		gpjy.setSysl(jyg);
		gpjy.setPay(0.77);
		gpjy.setJy(0);
		gpjy.setBz("卖出挂牌中(系统代)");
		gpjy.setJypay((int)(mcsl*0.77*1+0.1)*1d);
		gpjy.setNewjy(3);
		gpjyDao.add(gpjy);
	}
	
	private List<YouMingxi> yList = Lists.newArrayList();
	private List<ZuoMingxi> zList = Lists.newArrayList();
	private final String Y_FILE_NAME = "E://temp//youmingxi.sql";
	private final String Z_FILE_NAME = "E://temp//zuomingxi.sql";
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
		youMingXiDao.deleteAll();
		zuoMingxiDao.deleteAll();
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
	
}
