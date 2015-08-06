package com.yq.user.dao;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;

public class LkjlDao {

	private Jdbc jdbc;
	
	private static final String table = "lkjl";
	
	
	public boolean updatelksl(String userName,int lksl){
		String sql = "INSERT INTO "+table+" (lkuser,lksl) VALUES (?,?) ON DUPLICATE KEY UPDATE lksl=?";
		return jdbc.update(sql, SqlParameter.Instance().withString(userName).withInt(lksl).withInt(lksl))>0;
	}
}
