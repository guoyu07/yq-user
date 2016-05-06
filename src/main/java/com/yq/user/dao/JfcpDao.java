package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.Jfcp;

public class JfcpDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "jfcp";
	
	
	public boolean update(int cpbh,int dqep){
		String sql = "update "+table+" set dqep=dqep-? where cpbh=? and dqep-?>0";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(dqep);
		parameter.setInt(cpbh);
		parameter.setInt(dqep);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateJf(int cpbh,int dqjf){
		String sql = "update "+table+" set dqjf=dqjf-? where cpbh=? and dqjf-?>0";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(dqjf);
		parameter.setInt(cpbh);
		parameter.setInt(dqjf);
		return jdbc.update(sql, parameter)>0;
	}
	
	public Jfcp get(int cpbh){
		String sql = "select * from "+table+" where cpbh=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(cpbh);
		return jdbc.get(sql, Jfcp.class, parameter);
	}
	
	public boolean updateDqepAndCglist(int cpbh,int buyNum){
		String sql = "update "+table+" set dqep=zepsl-?,cglist=cglist-1 where cpbh=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(buyNum);
		parameter.setInt(cpbh);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateDqjfAndCglist(int cpbh,int buyNum){
		String sql = "update "+table+" set dqjf=zjfsl-?,cglist=cglist-1 where cpbh=? and (dqjf=10 or dqjf<21) and cglist!=0";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(buyNum);
		parameter.setInt(cpbh);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateDqepOrCglistOrJysl(int cpbh){
		String sql = "update "+table+" set dqep=zepsl ,cglist=cblist,jysl=jysl+1 where cpbh=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(cpbh);
		return jdbc.update(sql, parameter)>0;
	}

	public boolean updateDqjfOrCglistOrJysl(int cpbh){
		String sql = "update "+table+" set dqjf=zjfsl ,cglist=cblist,jysl=jysl+1 where cpbh=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(cpbh);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean recoverDqjf(int cpbh){
		String sql = "update "+table+" set dqjf=zjfsl where dqjf=0";
		return jdbc.update(sql,null)>0;
	}
}
