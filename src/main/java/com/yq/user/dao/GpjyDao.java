package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Gpjy;

public class GpjyDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "gpjy";
	
	public boolean update(){
		String sql = "update "+table+" set jy=0 where now()>dqdate+0.0006 and jy=2";
		return this.jdbc.update(sql, null)>0;
	}
	
	public boolean add(Gpjy gpjy){
		return this.jdbc.insert(gpjy)>0;
	}
	
	public IPage<Gpjy> getPageList(String userName,int pageIndex,int pageSize){
		String sql = "select * from gpjy where username = ? and kjqi>0 order by id desc" ;
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
}
