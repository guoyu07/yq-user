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
	
	public boolean updateChaiFen(int id,double ration){
		String sql = "update "+table+" set jygj=?,zgj=?,zdj=? where id=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setDouble(ration);
		parameter.setDouble(ration);
		parameter.setDouble(ration);
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
	
	public boolean updatePayAdd(){
		String sql = "update "+table+" set payadd=payadd-1 where id=12 limit 1";
		return jdbc.update(sql, null)>0;
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
	
	public Fcxt getCsAdminUser(String userName){
		String sql = "SELECT * FROM "+table+" where ncjud=?  limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		return this.jdbc.get(sql, Fcxt.class, parameter);
	}
	
	public Fcxt getAdminUser(String userName){
		String sql = "SELECT * FROM "+table+" where adminusername=?  limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
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
	
	public Fcxt getFcxtByDqu(int dqu){
		String sql = "select * from fcxt where fsjygsl = ? or syjygsl = ? or jygsl = ?  or jy5w = ?  or payadd = ? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(dqu);
		parameter.setInt(dqu);
		parameter.setInt(dqu);
		parameter.setInt(dqu);
		parameter.setInt(dqu);
		return this.jdbc.get(sql, Fcxt.class, parameter);
	}
	
	public boolean updateJy5w(int value){
		String sql = "update "+table+" set jy5w=jy5w-?,dqgj=dqgj+0.01,jygj=jygj+0.01,zgj=zgj+0.01 where id =2 and jy5w>=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(value);
		parameter.setInt(value);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateJy5wRation(int value){
		String sql = "update "+table+" set jy5w=?  where id =2 ";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(value);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateCz04(String value){
		String sql = "update "+table+" set cz04=?  where id =2 ";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(value);
		return jdbc.update(sql, parameter)>0;
	}
}
