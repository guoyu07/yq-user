package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Txifok;

public class TxifokDao {
    @Autowired
	public Jdbc jdbc;
    
	private static String table = "txifok";

    public boolean add(Txifok txifok){
    	return jdbc.insert(txifok)>0;
    }
    
    public boolean delete(String userName){
		String sql = "delete from "+table+" where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withString(userName))>0;
    }
}
