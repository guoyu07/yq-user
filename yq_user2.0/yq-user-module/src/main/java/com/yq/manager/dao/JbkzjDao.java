package com.yq.manager.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Jbkzj;

public class JbkzjDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "jbkzj";
	
	
	public IPage<Jbkzj> getPage(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by id desc";
		return this.jdbc.getListPage(sql, Jbkzj.class, null, pageSize, pageIndex);
	}
}
