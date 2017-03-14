package com.yq.business.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Datepay;

public class YbDao {
	@Autowired
	private Jdbc jdbc;
	
	private final static String table = "datepay";
	
	public IPage<Datepay>  getpageList(String userName, int pageIndex, int pageSize){
		String sql = "select * from "+table+" where username=? order by abdate Desc";
		SqlParameter sqlparam = new SqlParameter();
		sqlparam.setString(userName);
		return this.jdbc.getListPage(sql, Datepay.class, sqlparam, pageIndex, pageSize);
	}

	
	
}
