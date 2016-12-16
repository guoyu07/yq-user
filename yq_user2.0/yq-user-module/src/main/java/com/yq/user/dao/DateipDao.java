package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Dateip;
/**
 * 用户操作日志表
 * @author ThinkPad User
 *
 */
public class DateipDao {
	@Autowired
	private Jdbc jdbc;
	
	private static final String table = "dateip";
	
	public boolean addDateIpLog(String userName,String desc,String ip){
		Dateip dateip = new Dateip();
		dateip.setUser(userName);
		dateip.setDlfs(desc);
		dateip.setDlip(ip);
		dateip.setDldate(new Date());
		dateip.setTcdate(new Date());
		return this.jdbc.insert(dateip)>0;
	}
	
	
	public IPage<Dateip> getPageList(String username,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where user = ? order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(username);
		return jdbc.getListPage(sql, Dateip.class, parameter, pageSize, pageIndex);
	}
	
	
	public boolean updateLogout(String username){
		String sql = "update "+table+" set tcdate=? where user=? order by id desc limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setObject(new Date());
		parameter.setString(username);
		return jdbc.update(sql, parameter)>0;
		
	}
	
	public IPage<Dateip> getAllPageList(String username, int pageIndex,int pageSize){
		StringBuilder sql= new StringBuilder();
		sql.append("select * from "+table+" where 1=1 ");
		SqlParameter parameter = new SqlParameter();
		if(!Strings.isNullOrEmpty(username)){
			sql.append(" and user = ?");
			parameter.setString(username);
		}
		sql.append(" order by id desc");
		return jdbc.getListPage(sql.toString(), Dateip.class, parameter, pageSize, pageIndex);
	}
	
}
