package com.yq.user.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Bdbdate;
import com.yq.user.bo.Dateip;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Dldate;
import com.yq.user.bo.Gcfh;
import com.yq.user.dao.BdbDateDao;
import com.yq.user.dao.DatePayDao;
import com.yq.user.dao.DateipDao;
import com.yq.user.dao.DldateDao;
import com.yq.user.dao.GcfhDao;

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
	public boolean addDatePay(Datepay datepay){
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
	public IPage<Bdbdate> getBdbPage(String zuser,int pageIndex,int pageSize){
		return bdbDateDao.getPageList(zuser, pageSize, pageIndex);
	}
	/**
	 * 获取用户最后一条的id
	 * @param userName
	 * @param pay
	 * @return
	 */
	public int getDatePayId(String userName,int pay){
		return datePayDao.getDatepayId(userName, pay);
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
	
}
