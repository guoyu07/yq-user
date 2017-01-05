package com.yq.manage.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
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
		
	};

}
