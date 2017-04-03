package com.yq.user.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.cw.bean.DatepayCw;
import com.yq.cw.bean.DatepayForDc;
import com.yq.cw.bean.DayOfYb;
import com.yq.cw.bo.ConfYbChangeType;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.DatepayMore;
import com.yq.user.bo.UserScoresLog;
import com.yq.user.constant.YbChangeType;

public class DatePayDao {

	@Autowired
	private Jdbc jdbc;
	
	
	private static final String table = "datepay";
	
	public Datepay getById(int id){
		String sql = "select * from "+table+" where id=? limit 1";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setInt(id);
		return jdbc.get(sql, Datepay.class, sqlParameter);
	}
	
	public IPage<Datepay> getPage(String username,Integer newbz,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		if(newbz!=null){
			sql = sql +" and newbz = ?";
			sqlParameter.setInt(newbz);
		}
		sql = sql +" order by id desc";
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, pageIndex);
	}
	
	public IPage<Datepay> getAdminPage(Integer newbz,int pageIndex,int pageSize){
		String sql = "select * from "+table+" ";
		SqlParameter sqlParameter = new SqlParameter();
		if(newbz!=null){
			sql = sql +" where origintype = ?";
			sqlParameter.setInt(newbz);
		}
		sql = sql +" order by id desc";
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, pageIndex);
	}
	
	public IPage<Datepay> getPageByUserNameAndDate(String username,String startDate,String endDate,Integer newbz,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		
		if(newbz!=null){
			sql = sql +" and origintype = ?";
			sqlParameter.setInt(newbz);
		}
		sql = sql +" order by id desc";
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, pageIndex);
	}
	
	public List<Datepay> getListByUserNameAndDate(String username,String startDate,String endDate,Integer newbz){
		String sql = "select dp.* from "+table+" dp where dp.username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and dp.abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		if(newbz!=null){
			sql = sql +" and dp.newbz = ?";
			sqlParameter.setInt(newbz);
		}
		sql = sql +" order by dp.id desc";
		return this.jdbc.getList(sql, Datepay.class, sqlParameter);
	}
	
	
	public List<DatepayCw> getListByVipUserNameAndDate(String username,String startDate,String endDate,Integer newbz){
		String sql = "select * from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		
		if(newbz!=null){
			sql = sql +" and newbz = ?";
			sqlParameter.setInt(newbz);
		}
		sql = sql +" order by id asc";
		return this.jdbc.getList(sql, DatepayCw.class, sqlParameter);
	}
	
	
	public List<DatepayForDc> getListByVipUserNameAndDateForDc(String username,String startDate,String endDate,Integer newbz){
		String sql = "select * from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		
		if(newbz!=null){
			sql = sql +" and newbz = ?";
			sqlParameter.setInt(newbz);
		}
		sql = sql +" order by id asc";
		return this.jdbc.getList(sql, DatepayForDc.class, sqlParameter);
	}
	
	
	public int addDatePay(Datepay datepay){
		if(datepay.getAbdate()==null){
			datepay.setAbdate(new Date());
		}
		return this.jdbc.insertBackKeys(datepay);
	}
	
	public Datepay getDatepayByUserNameAndRegid(String userName,String regId){
		String sql = "select * from "+table+" where username = ? and regid=? limit 1";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		sqlParameter.setString(regId);
		return jdbc.get(sql, Datepay.class, sqlParameter);
	}
	
	
	public IPage<Datepay> getPageBykjqi(String username,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where username = ? and kjqi>0 order by id desc";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, pageIndex);
	}
	
	public IPage<Datepay> getPageByCharge(String username,int pageIndex,int pageSize){
		String sql = "select * from datepay where username = ? and regid='充值' order by id desc";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, pageIndex);
	}
	
//	public int getDatepayId(String userName,int pay){
//		String sql = "select id from datepay where username =? and jc=? order by id desc limit 1";
//		SqlParameter sqlParameter = new SqlParameter();
//		sqlParameter.setString(userName);
//		sqlParameter.setInt(pay);
//		return this.jdbc.getInt(sql, sqlParameter);
//	}
	
	public boolean updateByQlid(int id){
		String sql = "update "+table+" set regid=CONCAT(regid,'-已撤销'),txbz=0 where id=? and txbz=1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(id))>0;
	}
	
	public boolean updateRegIdAndTxbzByQlid(int id,String regId){
		String sql = "update "+table+" set regid=CONCAT(regid,?),txbz=0 where id=?";
		return jdbc.update(sql, SqlParameter.Instance().withString(regId).withInt(id))>0;
	}
	
	public boolean updateRegIdToCancel(int id,String regid){
		String sql = "update "+table+" set regid=? where id=?";
		return jdbc.update(sql, SqlParameter.Instance().withString(regid).withInt(id))>0;
	}
	
	public IPage<DatepayMore> getPageByJfMr(String username,int pageIndex,int pageSize){
//		String sql="select dp.*,gp.mysl from datepay dp left join gpjy gp on dp.id=gp.jyid where dp.username = ? and dp.dbjc>0 and dp.regid='买入挂牌中' order by dp.id desc" ;
		String sql="select * from datepay where username = ? and dbjc>0 and regid='买入挂牌中' order by id desc" ;
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		return this.jdbc.getListPage(sql, DatepayMore.class, sqlParameter, pageSize, pageIndex);
	}
	
//	public int getLastInsertId(){
//		String sql = "SELECT LAST_INSERT_ID()";
//		return this.jdbc.getInt(sql, null);
//	}
	
	public boolean updateRegidByQlid(int id,String regId){
		String sql = "update "+table+" set regid=? where id=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withString(regId).withInt(id))>0;
	}
	
	public Double getSumSyjz(int bz){
		String sql = "SELECT sum(syjz)  FROM "+table+" where bz = ?";
		return jdbc.getDouble(sql, SqlParameter.Instance().withInt(bz));
	}
	/**
	 * 时间段内的收入和
	 * @param userName
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Double getSumSyjz(String userName,String startDate,String endDate){
		String sql = "select sum(syjz) from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql, sqlParameter);
	}
	/**
	 * 时间段内的支出和
	 * @param userName
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Double getSumjc(String userName,String startDate,String endDate){
		String sql = "select sum(jc) from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql, sqlParameter);
	}
	
	
	/**
	 * 时间段内的支出和
	 * @param userName
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Double getSumjcByCw(String userName,String startDate,String endDate){
		String sql = "select sum(jc*ration) from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql, sqlParameter);
	}
	
	
	/**
	 * 时间段内的收入和
	 * @param userName
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Double getSumSyjzByCw(String userName,String startDate,String endDate){
		String sql = "select sum(syjz*ration) from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql, sqlParameter);
	}
	
	/**
	 * 时间段内最后一条一币交易明细
	 * @param userName
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Datepay getDateLastDatePay(String userName,String startDate){
		String sql = "select * from "+table+" where username = ?";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		if(!Strings.isNullOrEmpty(startDate)){
			sql = sql +" and abdate < ?";
			sqlParameter.setString(startDate);
		}
		sql = sql +" order by id desc limit 1";
		return jdbc.get(sql, Datepay.class, sqlParameter);
	}
	
	public Double getSumVipTranferInYb(String userName){
		String sql = "select sum(syjz) from "+table+" where username=? and regid like '收到服务中心%'";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		return jdbc.getDouble(sql, sqlParameter);
	}
	
	public Double getSumJcNotIncludeTheSameIn(String userName){
		String sql = "select sum(jc) from "+table+" where username=? and newbz<>6";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		return jdbc.getDouble(sql, sqlParameter);
	}

	/**
	 * 
	 * 修改花费金币的数量
	 * 
	 * 
	 * */
	public boolean updateCostGoldNumber(int id, double needJb) {
		
		String sql = "update "+table+" set dbjc=dbjc-? where id=? and dbjc-?>0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setDouble(needJb);
		parameter.setInt(id);
		parameter.setDouble(needJb);
		boolean result =  this.jdbc.update(sql, parameter)>0;
		return result;
	}
	
	/**
	 * 订单重置日志
	 * */
	public boolean updateRecordByQlid(int id){
		String sql = "update "+table+" set regid=CONCAT(regid,'-已重置'),txbz=0 where id=? and txbz=1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(id))>0;
	}

	public List<DatepayCw> getListByVipUserNameAndDate(String searchUserName, String startTime, String endTime) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from "+table+" where username = ?");
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(searchUserName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql.append(" and abdate between ? and ?");
			sqlParameter.setString(startTime);
			sqlParameter.setString(endTime);
		}
		sql.append(" order by id asc");
		return this.jdbc.getList(sql.toString(), DatepayCw.class, sqlParameter);
	}

	public Double getSumSyjz(String searchUserName, String startDate, String endDate, ConfYbChangeType origintype) {
		StringBuilder sql = new StringBuilder();
		sql.append("select sum(syjz) from "+table+" where username = ? and origintype = ? ");
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(searchUserName);
		sqlParameter.setInt(origintype.getOrigintype());
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql.append(" and abdate between ? and ?");
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql.toString(), sqlParameter);
	}

	public Double getSumjc(String searchUserName, String startDate, String endDate, ConfYbChangeType origintype) {
		StringBuilder sql = new StringBuilder();
		sql.append("select sum(jc) from "+table+" where username = ? and origintype = ? ");
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(searchUserName);
		sqlParameter.setInt(origintype.getOrigintype());
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql.append(" and abdate between ? and ?");
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql.toString(), sqlParameter);
	}

	public Map<String,List<Object>> getpriceList(String searchUserName, String startDate, String endDate) {
		Map<String,List<Object>> map=new HashMap<>();
		List<Object> rationresult= new ArrayList<>();
		List<Object> regidresult= new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select ration,regid from "+table+" where username = ? and abdate between ? and ?  GROUP BY ration ");
		List rows = jdbc.getJdbcTemplate().queryForList(sql.toString(),searchUserName,startDate,endDate);
		Iterator it = rows.iterator();  
		while(it.hasNext()) {  
			 Map rationMap = (Map) it.next();  
			 if((Double) rationMap.get("ration")>0){
				 rationresult.add((Double) rationMap.get("ration"));
			 }
			 regidresult.add((String) rationMap.get("regid"));
		}  
		map.put("ration", rationresult);
		map.put("regid", regidresult);
		return map;
	}

	public List<Object> getDescList(String searchUserName, String startDate, String endDate,ConfYbChangeType origintype){
		List<Object> regidresult= new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select regid from "+table+" where username = ? and origintype = ?  and abdate between ? and ?  GROUP BY regid ");
		List rows = jdbc.getJdbcTemplate().queryForList(sql.toString(),searchUserName,origintype.getOrigintype(),startDate,endDate);
		Iterator it = rows.iterator();  
		while(it.hasNext()) {  
			 Map rationMap = (Map) it.next();  
			 regidresult.add((Object) rationMap.get("regid"));
		}  
		return regidresult;
	}

	public double getSumSyjz(String searchUserName, String startDate, String endDate, ConfYbChangeType origintype,
			Double price) {
		String sql = "select sum(syjz*ration) from "+table+" where username = ? and origintype=? and ration = ? ";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(searchUserName);
		sqlParameter.setInt(origintype.getOrigintype());
		sqlParameter.setDouble(price);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql, sqlParameter);
	}

	public double getSumjc(String searchUserName, String startDate, String endDate, ConfYbChangeType origintype,
			Double price) {
		String sql = "select sum(jc*ration) from "+table+" where username = ? and origintype=? and ration = ? ";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(searchUserName);
		sqlParameter.setInt(origintype.getOrigintype());
		sqlParameter.setDouble(price);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and abdate between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		return jdbc.getDouble(sql, sqlParameter);
	}

	public List<DayOfYb> getDayOfYbList(String searchUserName, String startDate, String endDate,int origintype) {
		List<DayOfYb> datepayList= new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select sum(dp.jc) as jcsum,sum(dp.syjz) as syjzsum,dp.regid,dp.ration from "+table+" dp  where (dp.jc != 0 or dp.syjz!=0) and  dp.username = ?  and dp.abdate between ? and ? and dp.origintype=? GROUP BY dp.ration ");
		List rows = jdbc.getJdbcTemplate().queryForList(sql.toString(),searchUserName,startDate,endDate,origintype);
		Iterator it = rows.iterator();  
		while(it.hasNext()) {  
			 Map map = (Map) it.next();
			 DayOfYb datepay = new DayOfYb();
			 BigDecimal jcsum = new BigDecimal(map.get("jcsum").toString());   
			 BigDecimal syjzsum = new BigDecimal(map.get("syjzsum").toString()); 
			 datepay.setOut(jcsum.doubleValue());
			 datepay.setIn(syjzsum.doubleValue());
			 datepay.setInprice((double)map.get("ration"));
			 datepay.setOutprice((double)map.get("ration"));
			 datepay.setDesc((String)map.get("regid"));
			 datepayList.add(datepay);
		}  
		return datepayList;
	}

	/**
	 * 得到一币备用日志
	 * @param searchUserName
	 * @param startDate
	 * @param endDate
	 * @param zhuanru
	 * @return
	 */
	public List<Datepay> getSaleYbBeiYongList(String searchUserName, String startDate, String endDate, int zhuanru) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from "+table+" where username = ?");
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(searchUserName);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql.append(" and abdate between ? and ?");
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		sql.append(" and (origintype ="+YbChangeType.KAIHU_ADD+" or origintype ="+YbChangeType.ZHUANCHU+" or origintype ="+YbChangeType.VIP_RECHARGEBAODANBI+" )  order by id asc");
		return this.jdbc.getList(sql.toString(), Datepay.class, sqlParameter);
		
	}

	public List<Datepay> getListByMallorder(String username, String orderId) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from "+table+" where username = ? and regid like '%"+orderId+"%'");
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		sql.append(" order by id desc ");
		return this.jdbc.getList(sql.toString(), Datepay.class, sqlParameter);
	}

	public IPage<Datepay> getGoldPage(String userName, Integer oType, int toPage, int pageSize) {
		String sql = "select * from "+table+" where username = ? and (dbjc<>0 or jyjz<>0) ";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		/*if(oType!=null){
			sql = sql +" and origintype = ?";
			sqlParameter.setInt(oType);
		}*/
		sql = sql +" order by id desc";
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, toPage);
	}

	public IPage<Datepay> getYbPage(String userName, Integer oType, int toPage, int pageSize) {
		String sql = "select * from "+table+" where username = ? and  (syjz<>0 or jc<>0) ";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		if(oType!=null){
			sql = sql +" and origintype = ?";
			sqlParameter.setInt(oType);
		}
		sql = sql +" order by id desc";
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, toPage);
	}
	public IPage<Datepay> getPageList(String orderId,int pageIndex, int pageSize) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from "+table+" where 1=1 ");
		if(!Strings.isNullOrEmpty(orderId)){
			sql.append(" and regid like '%"+orderId+"%'");
		}
		sql.append(" order by id desc ");
		return this.jdbc.getListPage(sql.toString(), Datepay.class,null, pageSize, pageIndex);
	}
	
	
}
