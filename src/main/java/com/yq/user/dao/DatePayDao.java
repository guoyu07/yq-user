package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
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
	
	
	public boolean addDatePay(Datepay datepay){
		return this.jdbc.insert(datepay)>0;
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
	
	public int getLastInsertId(){
		String sql = "SELECT LAST_INSERT_ID()";
		return this.jdbc.getInt(sql, null);
	}
	
	public boolean updateRegidByQlid(int id,String regId){
		String sql = "update "+table+" set regid=? where id=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withString(regId).withInt(id))>0;
	}
	
	public Double getSumSyjz(int bz){
		String sql = "SELECT sum(syjz)  FROM "+table+" where bz = ?";
		return jdbc.getDouble(sql, SqlParameter.Instance().withInt(bz));
	}
	
}
