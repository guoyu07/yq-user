package com.yq.manager.service;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.exception.ServiceException;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.MD5Security;
import com.yq.manager.bo.BackCountBean;
import com.yq.manager.bo.DateBean;
import com.yq.manager.bo.GcfhBean;
import com.yq.manager.bo.PmmltBean;
import com.yq.manager.dao.AddShengDao;
import com.yq.manager.dao.FhdateDao;
import com.yq.manager.dao.MqfhDao;
import com.yq.manager.dao.MtfhtjDao;
import com.yq.manager.dao.SgtjDao;
import com.yq.user.bo.Addsheng;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Fhdate;
import com.yq.user.bo.Gcfh;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.Mtfhtj;
import com.yq.user.bo.Sgtj;
import com.yq.user.bo.Sgxt;
import com.yq.user.bo.Txpay;
import com.yq.user.bo.YouMingxi;
import com.yq.user.bo.ZuoMingxi;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.DatecjDao;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.GcfhDao;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.GpjyDao;
import com.yq.user.dao.SgxtDao;
import com.yq.user.dao.TxPayDao;
import com.yq.user.dao.TxifokDao;
import com.yq.user.dao.YouMingXiDao;
import com.yq.user.dao.ZuoMingxiDao;
import com.yq.user.service.LogService;

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
	
	public IPage<Gpjy> getAdminMcPageList(int pageIndex,int pageSize){
		return gpjyDao.getAdminMcPage(pageIndex, pageSize);
	}
	
	public IPage<Gpjy> getAdminMyPageList(int pageIndex,int pageSize){
		return gpjyDao.getAdminMrPage(pageIndex, pageSize);
	}
	
	public IPage<Fhdate> getFhdatePageList(int pageIndex,int pageSize){
		return fhDateDao.getPageList(pageIndex, pageSize);
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
	public boolean updateUser(String userName,String password3,String card, String bank,  String name, String call,String  email,String qq,String userid,int payok,String jcname,String jcuserid,String password){
		return gcuserDao.updateUserByAdmin(userName,password3, card, bank, name, call, email, qq, userid, payok, jcname, jcuserid, password);
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
	 * 执行计算
	 */
	public void backCount(Date date){
		if(!isCanBackCount()){
			throw new ServiceException(1, "还没有到结算时间！");
		}
		String todayStr = DateUtils.getDate(date);
		String todayStart = todayStr+" 00:00:00";
		IPage<Sgxt> page = null;
		Collection<Sgxt> tempData = null;
		int pageIndex = 0;
		while(true){
			page = sgxtDao.backCountPage(todayStart, pageIndex, 100);
			tempData = page.getData();
			if(tempData!=null&&tempData.size()>0){
				for(Sgxt sgxt:tempData){
					int addAmount = (int)(sgxt.getFhbl()*sgxt.getSjb()*500);
					if(gcuserDao.addYbByBackCount(sgxt.getUsername(),addAmount )){
						Gcuser gcuser = gcuserDao.getUser(sgxt.getUsername());
						Datepay datepay = new Datepay();
						datepay.setUsername(sgxt.getUsername());
						datepay.setRegid("游戏收益");
						datepay.setSyjz(addAmount);
						datepay.setPay(gcuser.getPay());
						datepay.setJydb(gcuser.getJydb());
						logService.addDatePay(datepay);
					}
				}
			}else{
				break;
			}
			pageIndex++;
		}
		sgxtDao.backCount(todayStart);
		
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
}
