package com.yq.manage.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.manage.bean.AdminOperateLog;

public class AdminOperateLogDao {
	@Autowired
	private Jdbc jdbc;
	
	private static final String table="admin_operate_log";
	
	public boolean addLog(AdminOperateLog log){
		return this.jdbc.insert(log)>0;
	};
	
	public IPage<AdminOperateLog> getPageList(int pageSize, int pageIndex){
		StringBuilder sql = new StringBuilder();
		sql.append("select * from "+table+" order by operate_date ");
		return this.jdbc.getListPage(sql.toString(), AdminOperateLog.class, null, pageSize, pageIndex);
		
	}

	public IPage<AdminOperateLog> getPageList(String admin, int type,String user, int pageSize, int pageIndex,
			String startDate, String endDate) {
		String sql ="select * from "+table+" where 1=1 ";
		SqlParameter sqlParameter = new SqlParameter();
		if(type!=0){
			sql = sql +" and operate_type = ?";
			sqlParameter.setInt(type);
		}
		if(!Strings.isNullOrEmpty(admin)){
			sql = sql +" and operator = ?";
			sqlParameter.setString(admin);
		}
		if(!Strings.isNullOrEmpty(user)){
			sql = sql +" and duser = ?";
			sqlParameter.setString(user);
		}
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and operate_date between ? and ?";
			sqlParameter.setString(startDate);
			sqlParameter.setString(endDate);
		}
		sql = sql +" order by operate_date desc";
		return this.jdbc.getListPage(sql, AdminOperateLog.class, sqlParameter, pageSize, pageIndex);
	}

}
