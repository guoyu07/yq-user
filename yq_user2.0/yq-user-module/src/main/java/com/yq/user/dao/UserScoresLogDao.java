package com.yq.user.dao;


import java.util.List;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.UserScoresLog;
import com.yq.user.bo.UserScoresLogForExcel;

public class UserScoresLogDao extends YqDaoBase<UserScoresLog>{

	
	public IPage<UserScoresLogForExcel> getPageListByUserNameAndTime(String userName,String startTime,String endTime,int pageIndex,int pageSize){
		String sql = "select * from "+super.getTable();
		SqlParameter parameter = SqlParameter.Instance();
		sql = sql +" where user_name=?";
		parameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql+" and created_time between ? and ? ";
			parameter.withString(startTime);
			parameter.withString(endTime);
		}
		sql = sql + " order by id desc";
		return super.getJdbc().getListPage(sql, UserScoresLogForExcel.class, parameter, pageSize, pageIndex);
	}
	
	public List<UserScoresLogForExcel> getListByUserNameAndTime(String userName,String startTime,String endTime){
		String sql = "select * from "+super.getTable();
		SqlParameter parameter = SqlParameter.Instance();
		sql = sql +" where user_name=?";
		parameter.withString(userName);
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql+" and created_time between ? and ? ";
			parameter.withString(startTime);
			parameter.withString(endTime);
		}
		sql = sql + " order by id desc";
		return super.getJdbc().getList(sql, UserScoresLogForExcel.class, parameter);
	}

	public List<UserScoresLog> getUserScoresLogByMallOrderList(String userName, String orderId) {
		StringBuilder sql=new StringBuilder();
		sql.append("select * from "+super.getTable()+" where user_name = ? and param = ?");
		SqlParameter sqlParameter = new SqlParameter();
		sqlParameter.setString(userName);
		sqlParameter.setString(orderId);
		sql.append(" order by created_time desc ");
		return super.getJdbc().getList(sql.toString(), UserScoresLog.class, sqlParameter);
	}
}
