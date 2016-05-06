package com.yq.manager.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Fhdate;

public class FhdateDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "fhdate";
	
	public IPage<Fhdate> getPageList(int pageIndex,int pageSize){
		String sql="select * from "+table+" order by id desc" ;
		return this.jdbc.getListPage(sql, Fhdate.class, null, pageSize, pageIndex);
	}
	
	public Fhdate get(){
		String sql="select * from "+table+" order by id desc limit 1" ;
		return this.jdbc.get(sql, Fhdate.class, null);
	}
	
	public boolean add(Fhdate t){
		return jdbc.insert(t)>0;
	}
	
	public Fhdate getById(int id){
		String sql="select * from "+table+" where id=? limit 1" ;
		return jdbc.get(sql, Fhdate.class, SqlParameter.Instance().withInt(id));
	}
	
	public boolean updateBz(int id,int bz){
		String sql = "update "+table+" set bz=? where id=?";
		return jdbc.update(sql, SqlParameter.Instance().withInt(bz).withInt(id))>0;
	}
}
