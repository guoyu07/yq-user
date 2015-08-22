package com.yq.user.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Datecj;

public class DatecjDao {

	@Autowired
	private Jdbc jdbc;
	
	private static String table = "datecj";
	
	
	public boolean add(Datecj datecj){
		return jdbc.insert(datecj)>0;
	}
	
	
	public Datecj get(String userName){
		String sql = "select * from "+table+" where cjuser = ? order by id desc limit 1";
		return jdbc.get(sql, Datecj.class, SqlParameter.Instance().withString(userName));
	}
	
	public IPage<Datecj> getDatecjPageList(String userName,int pageIndex,int pageSize){
		String sql = "select * from datecj where cjuser = ? order by id desc";
		return jdbc.getListPage(sql, Datecj.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
}
