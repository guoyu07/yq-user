package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;

public class EptzbDao {
    @Autowired
	private Jdbc jdbc;
    
    private static final String table="eptzb";
    
    public boolean updateSumGuessByType(String userName,int type,int num){
    	String sql = "INSERT INTO "+table+" (tzuser,tzlba,tzsla,tzdate) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE tzsla=tzsla+?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(userName);
    	parameter.setInt(type);
    	parameter.setInt(num);
    	parameter.setObject(new Date());
    	parameter.setInt(num);
    	return jdbc.update(sql, parameter)>0;
    }
}
