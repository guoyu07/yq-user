package com.yq.manager.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.exception.ServiceException;
import com.yq.common.utils.DateUtils;
import com.yq.common.utils.MD5Security;
import com.yq.manager.bo.GcfhBean;
import com.yq.manager.dao.AddShengDao;
import com.yq.manager.dao.FhdateDao;
import com.yq.manager.dao.MqfhDao;
import com.yq.manager.dao.SgtjDao;
import com.yq.user.bo.Addsheng;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Fhdate;
import com.yq.user.bo.Gcfh;
import com.yq.user.bo.Gpjy;
import com.yq.user.bo.Sgtj;
import com.yq.user.bo.Txpay;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.GcfhDao;
import com.yq.user.dao.GpjyDao;
import com.yq.user.dao.TxPayDao;

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
}
