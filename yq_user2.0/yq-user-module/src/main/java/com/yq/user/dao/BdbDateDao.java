package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
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
	
	public void batchInsert(List<Bdbdate> lists){
		for(Bdbdate bdbdate:lists){
			if(bdbdate.getBfdate()==null){
				bdbdate.setBfdate(new Date());
			}
		}
		jdbc.insert(lists);
	}
	/**
	 * 分页查询码
	 * @param zuser
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<Bdbdate> getPageList(String zuser,int type,int pageSize,int pageIndex){
		
		String typeStr = "";
		if(type==0){//0 为只显示报单币转账日志
			typeStr = " and (sy>0 or jc>0) ";
		}else{//1 为显示开户日志
			typeStr = " and (sy=0 and jc=0) ";
		}
		
		String sql = "select * from "+table+" where zuser = ? "+typeStr+" order by id desc";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(zuser);
		return this.jdbc.getListPage(sql, Bdbdate.class, parameter, pageSize, pageIndex);
	}
	
	/**
	 * 分页查询码
	 * @param zuser
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<Bdbdate> getALLPageList(int pageSize,int pageIndex){
		String sql = "select * from "+table+" order by id desc";
		return this.jdbc.getListPage(sql, Bdbdate.class, null, pageSize, pageIndex);
	}
	
	/**
	 * 分页查询码
	 * @param zuser
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public IPage<Bdbdate> getPageListByUserNameAndDate(String zuser,String startDate,String endDate,int pageSize,int pageIndex){
		String sql = "select * from "+table+" where zuser = ?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(zuser);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and bfdate between ? and ?";
			parameter.setString(startDate);
			parameter.setString(endDate);
		}
        //sql = sql +" and (bz like '充值%' or bz like '转给%' or bz like '收到％') order by id desc";
        sql = sql +" and (sy>0 or jc>0) order by id desc";
		return this.jdbc.getListPage(sql, Bdbdate.class, parameter, pageSize, pageIndex);
	}
	
	public List<Bdbdate>  getListByUserNameAndDate(String zuser,String startDate,String endDate){
		String sql = "select * from "+table+" where zuser = ?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(zuser);
		if(!Strings.isNullOrEmpty(startDate)&&!Strings.isNullOrEmpty(endDate)){
			sql = sql +" and bfdate between ? and ?";
			parameter.setString(startDate);
			parameter.setString(endDate);
		}
       //sql = sql +" and (bz like '充值%' or bz like '转给%' or bz like '收到％') order by id desc";
        sql = sql +" and (sy>0 or jc>0) order by id desc";
		return this.jdbc.getList(sql, Bdbdate.class, parameter);
	}
	
	public Bdbdate getBdbdate(String username,String bduser){
		String sql = "select * from "+table+" where zuser = ? and bz like '新单"+bduser+"%' limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(username);
		return this.jdbc.get(sql, Bdbdate.class, parameter);
	}
}
