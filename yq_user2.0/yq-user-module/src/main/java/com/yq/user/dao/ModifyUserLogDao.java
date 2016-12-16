package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.AbsModifyUserLog;
import com.yq.user.bo.ModifyUserLog;

public class ModifyUserLogDao {

	@Autowired
	private Jdbc jdbc;
	
	
	private static final String table = "modify_user_log";
	
	public int add(ModifyUserLog modifyUserLog){
		if(modifyUserLog.getOperatedate()==null){
			modifyUserLog.setOperatedate(new Date());
		}
		return this.jdbc.insertBackKeys(modifyUserLog);
	}

	/**
	 * 根据用户名得到分页记录列表
	 * @param user
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<AbsModifyUserLog> getPageByUsername(String user, int pageSize, int pageIndex) {
		String sql = "select * from "+table+" where username = ? order by operatedate desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(user);
		return this.jdbc.getListPage(sql, AbsModifyUserLog.class, parameter, pageSize, pageIndex);
	}
	
	/**
	 * 获得记录列表
	 * @param user
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<AbsModifyUserLog> getPageList(String user, int pageSize, int pageIndex) {
		StringBuilder sql= new StringBuilder();
		sql.append("select * from "+table+" where  1=1 ");
		SqlParameter parameter = new SqlParameter();
		if(!Strings.isNullOrEmpty(user)){
			sql.append(" and username = ? ");
			parameter.setString(user);
		}
		sql.append("order by id desc ");
		return this.jdbc.getListPage(sql.toString(), AbsModifyUserLog.class, parameter, pageSize, pageIndex);
	}
	
	

}
