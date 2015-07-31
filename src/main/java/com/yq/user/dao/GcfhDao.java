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
	
	
	public IPage<Gcfh> getPageList(String username,int lb,int pageSize,int pageIndex){
		String sql = "select * from "+table+" where userid = ? and lb=? order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(username);
		parameter.setInt(lb);
		return this.jdbc.getListPage(sql, Gcfh.class, parameter, pageSize, pageIndex);
	}
}
