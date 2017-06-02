package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.MoneyPotLog;

public class MoneyPotLogDao {
	
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "money_pot_log";
	
	
	public boolean addMoneyPotLog(MoneyPotLog moneyPotLog){
		return jdbc.insert(moneyPotLog)>0;
	}
	
	public int add(MoneyPotLog moneyPotLog){
		return jdbc.insertBackKeys(moneyPotLog);
	}
	
	
	public IPage<MoneyPotLog> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" where state = 0 order by id desc";
		return this.jdbc.getListPage(sql, MoneyPotLog.class, null, pageSize, pageIndex);
	}

	public IPage<MoneyPotLog> getUserPageList(String username,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where String = ? order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(username);
		return this.jdbc.getListPage(sql, MoneyPotLog.class, parameter, pageSize, pageIndex);
	}
	
	public boolean updateUser(int id,String username){
		String sql = "update "+table+" set state=1,update_time=? where id=? and username= ? and state<>1 ";
		SqlParameter parameter = new SqlParameter();
		parameter.setObject(new Date());
		parameter.setInt(id);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateUser(String id){
		String sql = "update "+table+" set state=1,update_time=? where moneypotorderid=? ";
		SqlParameter parameter = new SqlParameter();
		parameter.setObject(new Date());
		parameter.setString(id);
		return this.jdbc.update(sql, parameter)>0;
	}
}
