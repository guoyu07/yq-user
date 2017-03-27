package com.yq.business.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Datepay;

public class YbDao {
	@Autowired
	private Jdbc jdbc;
	
	private final static String table = "datepay";
	
	public IPage<Datepay>  getpageList(String userName, int pageIndex, int pageSize,String startTime,String endTime){
		String sql = "select * from "+table+" where username=?";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and abdate between ? and ?";
			sqlparam.setString(startTime);
			sqlparam.setString(endTime);
		}
		sql+="  order by abdate Desc";
		return this.jdbc.getListPage(sql, Datepay.class, sqlparam, pageIndex, pageSize);
	}

	public List<Datepay> getList(String userName, String startTime, String endTime) {
		String sql = "select * from "+table+" where username=?";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql +" and abdate between ? and ?";
			sqlparam.setString(startTime);
			sqlparam.setString(endTime);
		}
		sql+="  order by abdate Desc";
		return this.jdbc.getList(sql, Datepay.class, sqlparam);
	}

}
