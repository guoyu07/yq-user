package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.UserDailyGainLog;


public class UserDailyGainLogDao {

	private String table = "user_daily_gain_log";

	@Autowired
	private Jdbc jdbc;

	public int getUserDailyGain(String userName, int type,String date) {
		String sql = "SELECT amount FROM " + table + " WHERE user_name = ? AND date = ?  AND type = ? ";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		parameter.setString(date);
		parameter.setInt(type);

		return this.jdbc.getInt(sql, parameter);
	}
    /**
     * 获取用户今日获得列表
     * @param userId
     * @return
     */
	public List<UserDailyGainLog> getUserTodayAllGainList(String userName,String date){
		String sql = "SELECT * FROM " + table + " WHERE user_name = ? AND date = ?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		parameter.setString(date);
		return this.jdbc.getList(sql, UserDailyGainLog.class, parameter);
	}
	
	public boolean addUserDailyGain(String userName, int type, int amount,String date) {
		String sql = "INSERT INTO " + table + "(user_name, type, date, amount, created_time, updated_time) VALUES(?, ?, ?, ?, now(), now()) ";
		sql += "ON DUPLICATE KEY update amount = amount + VALUES(amount), updated_time = now()";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		parameter.setInt(type);
		parameter.setString(date);
		parameter.setInt(amount);
		return this.jdbc.update(sql, parameter) > 0;
	}

}
