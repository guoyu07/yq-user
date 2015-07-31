package com.yq.user.dao;
//屏蔽用户列表

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Tduser;

public class TduserDao {
    @Autowired
	private Jdbc jdbc;
    
    
    public Tduser get(String tdName,String tdUserId){
    	String sql = "select * from tduser where tdname=? or tduserid=?";
    	SqlParameter parameter = new SqlParameter();
    	parameter.setString(tdName);
    	parameter.setString(tdUserId);
    	return this.jdbc.get(sql, Tduser.class, parameter);
    }
	
}
