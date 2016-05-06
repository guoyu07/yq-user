package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Dgag;

public class DgagDao {
	@Autowired
	private Jdbc jdbc;
	
	private final String table = "dgag";
	/**
	 * 分页查询公告列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Dgag> getPage(int pageIndex,int pageSize){
		String sql = "select * from "+table+" where `check`=0 order by id desc";
		return jdbc.getListPage(sql, Dgag.class, null, pageSize, pageIndex);
	}
	
	public Dgag get(int id){
		String sql = "select * from "+table+" where id=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(id);
		return jdbc.get(sql, Dgag.class, parameter);
	}
	
	public IPage<Dgag> getAllPage(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by id desc";
		return jdbc.getListPage(sql, Dgag.class, null, pageSize, pageIndex);
	}
	
	public boolean add(Dgag dgag){
		return jdbc.insert(dgag)>0;
	}
	
	public boolean update(int id,String title,String content,Date ggdate){
		String sql = "update "+table+" set ggbt=?,ggny=?,ggdate=? where id=?";
		return jdbc.update(sql, SqlParameter.Instance().withString(title).withString(content).withObject(ggdate).withInt(id))>0;
	}
}
