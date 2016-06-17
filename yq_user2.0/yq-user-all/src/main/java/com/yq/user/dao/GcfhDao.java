package com.yq.user.dao;


import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Gcfh;
//分红相关
public class GcfhDao {

	@Autowired
	private Jdbc jdbc;
	
	private static String table = "gcfh";
	
	
	public boolean add(Gcfh t){
		return jdbc.insert(t)>0;
	}
	
	public IPage<Gcfh> getPageList(String username,int lb,int pageSize,int pageIndex){
		String sql = "select * from "+table+" where userid = ? and lb=? order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(username);
		parameter.setInt(lb);
		return this.jdbc.getListPage(sql, Gcfh.class, parameter, pageSize, pageIndex);
	}
	
	
	public IPage<Gcfh> getAllPageList(int pageSize,int pageIndex){
		String sql = "select * from "+table+" where lb>0 order by id desc";
		return this.jdbc.getListPage(sql, Gcfh.class, null, pageSize, pageIndex);
	}
	
	public Double getSumSyfhIn(){
		String sql = "select sum(syfh) as ljsy from "+table+" where syfh>0";
		return this.jdbc.getDouble(sql, null);
	}
	
	public Double getSumSyfhOut(){
		String sql = "select sum(syfh) as ljsy from "+table+" where syfh<0";
		return this.jdbc.getDouble(sql, null);
	}
	
	public Double getDateSumSyfhIn(String startDate,String endDate){
		String sql = "select sum(syfh) as jtsy from "+table+" where abdate between ? and ? and syfh>0 ";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(startDate);
		parameter.setString(endDate);
		return this.jdbc.getDouble(sql, parameter);
	}
	
	public Double getDateSumSyfhOut(String startDate,String endDate){
		String sql = "select sum(syfh) as jtsy from "+table+" where abdate between ? and ? and syfh<0 ";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(startDate);
		parameter.setString(endDate);
		return this.jdbc.getDouble(sql, parameter);
	}
	
	public boolean update(String userName,String bz,int amount){
		String sql = "update "+table+" set sygc=sygc+?,ljgc=ljgc+? where userid=? and bz=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(amount).withInt(amount).withString(userName).withString(bz))>0;
	}
	
	public Gcfh get(String userName,String bz){
		String sql = "select * from "+table+" where userid=? and bz=? limit 1";
		return jdbc.get(sql,Gcfh.class, SqlParameter.Instance().withString(userName).withString(bz));

	}
}
