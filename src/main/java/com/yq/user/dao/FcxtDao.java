package com.yq.user.dao;

import java.util.Date;

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
	
	public boolean update(int id,int mcsl){
		String sql = "update "+table+" set syjygsl=syjygsl-?,jygsl=jygsl+?,jy5w=jy5w+? where id=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(mcsl);
		parameter.setInt(mcsl);
		parameter.setInt(mcsl);
		parameter.setInt(id);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateDoubleAreaCount(Date jsDate,String lastName,int id){
		String sql = "update "+table+" set payadd=payadd+1,jsdate=?,lname=? where id=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.withObject(jsDate);
		parameter.withString(lastName);
		parameter.withInt(id);
		return jdbc.update(sql, parameter)>0;
	}
	
	public Fcxt getByUserNameAndPassword(String userName,String password){
		String sql = "SELECT * FROM "+table+" where adminusername=? and password=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		parameter.setString(password);
		return this.jdbc.get(sql, Fcxt.class, parameter);
	}
	
	public Fcxt getByUserNameAndNcjud(String userName,String password){
		String sql = "SELECT * FROM "+table+" where ncjud=? and adminusername=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		parameter.setString(password);
		return this.jdbc.get(sql, Fcxt.class, parameter);
	}
	
	public Fcxt getFcxt(String czy){
		String sql = "SELECT * FROM fcxt where cz01 = ? or cz02 = ? or cz03 = ? or cz04 = ? or cz05 = ? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(czy);
		parameter.setString(czy);
		parameter.setString(czy);
		parameter.setString(czy);
		parameter.setString(czy);
		return this.jdbc.get(sql, Fcxt.class, parameter);
	}
}
