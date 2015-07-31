package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Datepay;

public class DatePayDao {

	@Autowired
	private Jdbc jdbc;
	
	
	private static final String table = "datepay";
	
	
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
	
	
	public boolean addDatePay(Datepay datepay){
		return this.jdbc.insert(datepay)>0;
	}
	
	
	public IPage<Datepay> getPageBykjqi(String username,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where username = ? and kjqi>0 order by id desc";
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(username);
		return this.jdbc.getListPage(sql, Datepay.class, sqlParameter, pageSize, pageIndex);
	}
	
	
}
