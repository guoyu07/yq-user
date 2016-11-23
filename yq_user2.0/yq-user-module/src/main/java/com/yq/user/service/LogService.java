package com.yq.user.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.cw.bean.DatepayCw;
import com.yq.manager.dao.JbkzjDao;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Datecj;
import com.yq.user.bo.Dateip;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.DatepayMore;
import com.yq.user.bo.Dldate;
import com.yq.user.bo.Gcfh;
import com.yq.user.bo.Jbkzj;
import com.yq.user.bo.SysBiLog;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.DatePayDao;
import com.yq.user.dao.DatecjDao;
import com.yq.user.dao.DateipDao;
import com.yq.user.dao.DldateDao;
import com.yq.user.dao.GcfhDao;
import com.yq.user.dao.SysBiLogDao;

public class LogService {
	@Autowired
	private DatePayDao datePayDao;
	@Autowired
	private GcfhDao gcfhDao;
	@Autowired
	private DateipDao dateipDao;
	@Autowired
	private BdbDateDao bdbDateDao;
	@Autowired
	private DldateDao dldateDao;
	@Autowired
	private DatecjDao datecjDao;
	@Autowired
	private JbkzjDao jbkzjDao;
	@Autowired
	private SysBiLogDao sysBiLogDao;
	
	/**
	 * 获取一币奖励日志
	 * @param username
	 * @param newbz
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Datepay> getDatePayListPage(String username,Integer newbz,int pageIndex,int pageSize){
		return datePayDao.getPage(username, newbz, pageIndex, pageSize);
	}
	/**
	 * 获取一币奖励日志
	 * @param username
	 * @param newbz
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Datepay> getAdminDatePayListPage(Integer newbz,int pageIndex,int pageSize){
		return datePayDao.getAdminPage(newbz, pageIndex, pageSize);
	}
	/**
	 * 
	 * @param username
	 * @param startDate
	 * @param endDate
	 * @param newbz
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Datepay> getAdminDatePayListPageByUserNameAndDate(String username,String startDate,String endDate,Integer newbz,int pageIndex,int pageSize){
		return datePayDao.getPageByUserNameAndDate(username, startDate, endDate, newbz, pageIndex, pageSize);
	}
	/**
	 * 
	 * @param username
	 * @param startDate
	 * @param endDate
	 * @param newbz
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Datepay> getAdminDatePayLisByUserNameAndDate(String username,String startDate,String endDate,Integer newbz){
		return datePayDao.getListByUserNameAndDate(username, startDate, endDate, newbz);
	}
	
	
	public List<DatepayCw> getCwDatePayLisByVipUserNameAndDate(String username,String startDate,String endDate,Integer newbz){
		return datePayDao.getListByVipUserNameAndDate(username, startDate, endDate, newbz);
	}
	/**
	 * 
	 * @param username
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Datepay> getDatePayListPageBykjqi(String username,int pageIndex,int pageSize){
		return datePayDao.getPageBykjqi(username, pageIndex, pageSize);
	}
	
	/**
	 * 查询用户充值列表
	 * @param username
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Datepay> getDatePayChargeListPage(String username,int pageIndex,int pageSize){
		return datePayDao.getPageByCharge(username, pageIndex, pageSize);
	}
	/**
	 * 查询用户充值列表
	 * @param username
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<DatepayMore> getDatePayJfmrListPage(String username,int pageIndex,int pageSize){
		return datePayDao.getPageByJfMr(username, pageIndex, pageSize);
	}
	/**
	 * 分红日志
	 * @param username
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcfh> getGcfhListPage(String username,int lb,int pageIndex,int pageSize){
		return gcfhDao.getPageList(username,lb, pageSize, pageIndex);
	}
	
	/**
	 * 添加支付日志
	 * @param datepay
	 * @return
	 */
	public int addDatePay(Datepay datepay){
		return datePayDao.addDatePay(datepay);
	}
	
	/**
	 * 获取用户登录日志
	 * @param username
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Dateip> getDateipListPage(String username,int pageIndex,int pageSize){
		return dateipDao.getPageList(username, pageIndex, pageSize);
	}
	/**
	 * 添加报单币date日志
	 * @param bdbdate
	 * @return
	 */
	public boolean addBdbDate(Bdbdate bdbdate){
		return bdbDateDao.add(bdbdate);
	}
	/**
	 * 分页查询报单币日志
	 * @param zuser
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Bdbdate> getBdbPage(String zuser,int type,int pageIndex,int pageSize){
		return bdbDateDao.getPageList(zuser,type, pageSize, pageIndex);
	}
	
	
	/**
	 * 获取用户最后一条的id
	 * @param userName
	 * @param pay
	 * @return
	 */
//	public int getDatePayId(String userName,int pay){
//		return datePayDao.getDatepayId(userName, pay);
//	}
	
	public boolean updateRegId(int id,String regId){
		return datePayDao.updateRegidByQlid(id, regId);
	}
	/**
	 * 
	 * @param userName
	 * @param syjz
	 * @param pay
	 * @param desc
	 * @return
	 */
	public boolean addDlDate(String userName,int syjz,int pay,String desc){
		Dldate dldate = new Dldate();
		dldate.setUsername(userName);
		dldate.setSyjz(syjz);
		dldate.setPay(pay);
		dldate.setRegid(desc);
		dldate.setAbdate(new Date());
		return dldateDao.add(dldate);
	}
	
//	public int getLasterInsertId(){
//		return datePayDao.getLastInsertId();
//	}
	
	public IPage<Datecj> getDateCjPageList(String userName,int pageIndex,int pageSize){
		return datecjDao.getDatecjPageList(userName, pageIndex, pageSize);
	}
	
	public IPage<Datecj> getAllDateCjPageList(String startTime,String endTime,int pageIndex,int pageSize){
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime+" 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		return datecjDao.getAllDatecjPageList(startTime,endTime,pageIndex, pageSize);
	}
	
	public List<Datecj> getDateCjList(String startTime,String endTime){
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime+" 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		return datecjDao.getAllDatecjList(startTime,endTime);
	}
	
	public IPage<Jbkzj> getAllJbkjzPageList(int pageIndex,int pageSize){
		return jbkzjDao.getPage(pageIndex, pageSize);
	}
	
	/**
	 * 更新日志金币支出数量
	 * 
	 * @param needJb
	 * 
	 * 
	 * */
	public boolean updateNumberId(int id, double needJb) {
		return datePayDao.updateCostGoldNumber(id, needJb);
		
	}
	
	/**
	 * 得到分页系统币列表
	 * 
	 * @param zuser
	 * @param startTime
	 * @param endTime
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<SysBiLog> getSysBiLogPageList(String zuser, String startTime,String endTime, int pageIndex,int pageSize){
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime+" 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		return sysBiLogDao.getPage(zuser, startTime, endTime, pageIndex, pageSize);
	}
	
	
	
	/**
	 * @param zuser
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<SysBiLog> getSysBiLogList(String zuser, String startTime, String endTime) {
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			startTime = startTime+" 00:00:00";
			endTime = endTime + " 23:59:59";
		}
		return sysBiLogDao.getList(zuser, startTime, endTime);
	}
	
	public List<DatepayCw> getCwDatePayLisByVipUserNameAndDate(String searchUserName, String startTime,String endTime) {
		return datePayDao.getListByVipUserNameAndDate(searchUserName, startTime, endTime);
		
	}
	
}
