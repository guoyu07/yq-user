package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.UserExtinfo;

public class UserExtinfoDao {

    @Autowired
	public Jdbc jdbc;
    
	private static String table = "user_extinfo";
	
	public boolean add(UserExtinfo userExtinfo){
		return jdbc.insert(userExtinfo)>0;
	}
	
	public boolean updateUserExtinfo(String userName,int veiry){
		String sql = "update "+table+" set need_verify=? where user_name=? limit 1";
		SqlParameter parameter = SqlParameter.Instance();
		parameter.withInt(veiry);
		parameter.withString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	 public UserExtinfo get(String userName){
			String sql = "select * from "+table+" where user_name=? limit 1";
			return jdbc.get(sql, UserExtinfo.class,SqlParameter.Instance().withString(userName));
	 }
	
}
