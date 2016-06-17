package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Txifok;

public class TxifokDao {
    @Autowired
	public Jdbc jdbc;
    
	private static String table = "txifok";

    public boolean add(Txifok txifok){
    	if(txifok.getTxdate()==null){
    		txifok.setTxdate(new Date());
    	}
    	return jdbc.insert(txifok)>0;
    }
    
    public boolean delete(String userName){
		String sql = "delete from "+table+" where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withString(userName))>0;
    }
    
    
    public Txifok get(String userName){
		String sql = "select * from "+table+" where username=? limit 1";
		return jdbc.get(sql, Txifok.class,SqlParameter.Instance().withString(userName));
    }
}
