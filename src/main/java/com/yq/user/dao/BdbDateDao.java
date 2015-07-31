package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Bdbdate;
/**
 * 报单币日志
 * @author ThinkPad User
 *
 */
public class BdbDateDao {

	@Autowired
	private Jdbc jdbc;
	
	private static String table = "bdbdate";
	
	/**
	 * 添加报单币日志
	 * @param bdbdate
	 * @return
	 */
	public boolean add(Bdbdate bdbdate){
		if(bdbdate.getBfdate()==null){
			bdbdate.setBfdate(new Date());
		}
		return jdbc.insert(bdbdate)>0;
	}
	/**
	 * 分页查询码
	 * @param zuser
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<Bdbdate> getPageList(String zuser,int pageSize,int pageIndex){
		String sql = "select * from "+table+" where zuser = ? order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(zuser);
		return this.jdbc.getListPage(sql, Bdbdate.class, parameter, pageSize, pageIndex);
	}
}
