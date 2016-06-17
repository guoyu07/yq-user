package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Cpuser;

public class CpuserDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "cpuser";
	
	public boolean add(Cpuser cpuser){
		return jdbc.insert(cpuser)>0;
	}
	
	public IPage<Cpuser> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by cgid desc" ;
		return jdbc.getListPage(sql, Cpuser.class, null, pageSize, pageIndex);
	}
	
	public boolean updateFwdate(int cgid){
		String sql = "update "+table+" set fwdate=? where cgid=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withInt(cgid))>0;
	}
	
}
