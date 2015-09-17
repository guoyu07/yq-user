package com.yq.manager.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Sgtj;

public class SgtjDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "sgtj";
	
	
	public IPage<Sgtj> getPageList(int pageIndex,int pageSize){
		String sql="select * from "+table+" order by sgid desc";
		return jdbc.getListPage(sql, Sgtj.class, null, pageSize, pageIndex);
	}
	
	public Sgtj get(int sgid){
		String sql = "select * from sgtj where sgid = ?" ;
		return jdbc.get(sql, Sgtj.class, SqlParameter.Instance().withInt(sgid));
	}
	
	public boolean add(Sgtj s){
		return jdbc.insert(s)>0;
	}
}
