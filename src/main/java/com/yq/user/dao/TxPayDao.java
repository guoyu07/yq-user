package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Txpay;

public class TxPayDao {

    @Autowired
	public Jdbc jdbc;
    
    private final String table = "txpay";
    
    public boolean add(Txpay txpay){
    	return jdbc.insert(txpay)>0;
    }
    
    public Txpay getTxPayByDfuser(String dfuser,int ep){
    	String sql = "select * from "+table+" where dfuser =? and ep=? limit 1";
    	SqlParameter sqlParameter = new SqlParameter();
    	sqlParameter.setString(dfuser);
    	sqlParameter.setInt(ep);
    	return this.jdbc.get(sql, Txpay.class, sqlParameter);
    }
    
    
    public Txpay getTxPayByPayUserName(String payUserName,int ep){
    	String sql = "select * from "+table+" where payusername =? and ep=? limit 1";
    	SqlParameter sqlParameter = new SqlParameter();
    	sqlParameter.setString(payUserName);
    	sqlParameter.setInt(ep);
    	return this.jdbc.get(sql, Txpay.class, sqlParameter);
    }
    
    public Txpay get(){
    	String sql = "select * from "+table+" order by payid desc limit 1 ";
    	return this.jdbc.get(sql, Txpay.class, null);
    }
}
