package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.cw.bean.DatepayCw;
import com.yq.cw.bean.DatepayForDc;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.DatepayMore;

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
			sql = sql +" where newbz = ?";
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
			sql = sql +" and newbz = ?";
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
		String sql="select dp.*,gp.mysl from datepay dp left join gpjy gp on dp.id=gp.jyid where dp.username = ? and dp.dbjc>0 and dp.regid='买入挂牌中' order by dp.id desc" ;
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
	
}
