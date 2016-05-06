package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Jbk10;
import com.yq.user.bo.Jbk100;
import com.yq.user.bo.Jbk300;
import com.yq.user.bo.Jbk50;
import com.yq.user.bo.Jbk500;

public class JbkDao {
	@Autowired
	private Jdbc jdbc;
	
	public Jbk10 getJbk10(String pdid){
		String sql = "select * from jbk10 where pdid = ? limit 1";
		return jdbc.get(sql, Jbk10.class, SqlParameter.Instance().withString(pdid));
	}
	
	
	public boolean deleteJbk10(String pdid){
		String sql = "delete from jbk10 where pdid = ? limit 1";
		return jdbc.update(sql,  SqlParameter.Instance().withString(pdid))>0;
	}
	
	public Jbk50 getJbk50(String pdid){
		String sql = "select * from jbk50 where pdid = ? limit 1";
		return jdbc.get(sql, Jbk50.class, SqlParameter.Instance().withString(pdid));
	}
	
	
	public boolean deleteJbk50(String pdid){
		String sql = "delete from jbk50 where pdid = ? limit 1";
		return jdbc.update(sql,  SqlParameter.Instance().withString(pdid))>0;
	}
	
	public Jbk100 getJbk100(String pdid){
		String sql = "select * from jbk100 where pdid = ? limit 1";
		return jdbc.get(sql, Jbk100.class, SqlParameter.Instance().withString(pdid));
	}
	
	
	public boolean deleteJbk100(String pdid){
		String sql = "delete from jbk100 where pdid = ? limit 1";
		return jdbc.update(sql,  SqlParameter.Instance().withString(pdid))>0;
	}
	
	public Jbk300 getJbk300(String pdid){
		String sql = "select * from jbk300 where pdid = ? limit 1";
		return jdbc.get(sql, Jbk300.class, SqlParameter.Instance().withString(pdid));
	}
	
	
	public boolean deleteJbk300(String pdid){
		String sql = "delete from jbk300 where pdid = ? limit 1";
		return jdbc.update(sql,  SqlParameter.Instance().withString(pdid))>0;
	}
	
	public Jbk500 getJbk500(String pdid){
		String sql = "select * from jbk500 where pdid = ? limit 1";
		return jdbc.get(sql, Jbk500.class, SqlParameter.Instance().withString(pdid));
	}
	
	
	public boolean deleteJbk500(String pdid){
		String sql = "delete from jbk500 where pdid = ? limit 1";
		return jdbc.update(sql,  SqlParameter.Instance().withString(pdid))>0;
	}
}
