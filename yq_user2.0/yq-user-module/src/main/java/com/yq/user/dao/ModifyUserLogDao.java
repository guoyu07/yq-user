package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.AbsModifyUserLog;
import com.yq.user.bo.ModifyUserLog;

public class ModifyUserLogDao {

	@Autowired
	private Jdbc jdbc;
	
	
	private static final String table = "modify_user_log";
	
	public int addDatePay(ModifyUserLog modifyUserLog){
		if(modifyUserLog.getOperatedate()==null){
			modifyUserLog.setOperatedate(new Date());
		}
		return this.jdbc.insertBackKeys(modifyUserLog);
	}

	public IPage<AbsModifyUserLog> getPageByUsername(String user, int pageSize, int pageIndex) {
		String sql = "select * from "+table+" where username = ? order by operatedate desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(user);
		return this.jdbc.getListPage(sql, AbsModifyUserLog.class, parameter, pageSize, pageIndex);
	}
	
	

}
