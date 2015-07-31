package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Fcxt;

public class FcxtDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "fcxt";
	
	
	public Fcxt get(int id){
		String sql = "SELECT * FROM "+table+" where id=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(id);
		return this.jdbc.get(sql, Fcxt.class, parameter);
	}
}
