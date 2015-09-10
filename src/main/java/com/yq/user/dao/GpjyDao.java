package com.yq.user.dao;

import java.util.Date;

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
	
	public Gpjy get(){
		String sql="select * from "+table+" where jy=0 and mcsl>0 limit 1";
		return this.jdbc.get(sql, Gpjy.class, null);
	}
	
	public IPage<Gpjy> getMcPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where jy=0 and mcsl>0 order by pay,id";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getAdminMcPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where mcsl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getMrPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where jy=0 and mysl>0 order by pay,id";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getAdminMrPage(int pageIndex,int pageSize){
		String sql="select * from "+table+" where mysl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getAllPageList(String userName,int pageIndex,int pageSize){
		String sql="select * from "+table+" where username = ? order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
	public IPage<Gpjy> getUserPageDetailsList(String userName,int pageIndex,int pageSize){
		String sql="select * from "+table+" where username = ? and jy=0 and mcsl>0 order by id desc";
		return this.jdbc.getListPage(sql, Gpjy.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
	}
	
	public boolean updateJy(int jy,int id){
		String sql = "update "+table+" set jy=? where id=? and jy=0";
		return this.jdbc.update(sql, SqlParameter.Instance().withInt(jy).withInt(id))>0;
	}
	
	public boolean updateDqdate(int id){
		String sql = "update "+table+" set dqdate=? where id=?";
		return this.jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withInt(id))>0;
	}	
	
	public boolean updateCgdate(int id){
		String sql = "update "+table+" set cgdate=? where id=?";
		return this.jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withInt(id))>0;
	}
	
	public boolean updateBz(int id,String bz){
		String sql = "update "+table+" set bz=? where id=?";
		return this.jdbc.update(sql, SqlParameter.Instance().withString(bz).withInt(id))>0;
	}
	
	public boolean updatePayAndJyPay(int id,double pay,int jypay){
		String sql = "update "+table+" set pay=?,jypay=? where id=? and jy=0 limit 1";
		return this.jdbc.update(sql, SqlParameter.Instance().withDouble(pay).withInt(jypay).withInt(id))>0;
	}
	
	public Gpjy getByJyId(int jyid){
		String sql="select * from "+table+" where jyid=? limit 1";
		return this.jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withInt(jyid));
	}
	
	public Gpjy getById(int id){
		String sql="select * from "+table+" where id=? limit 1";
		return this.jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withInt(id));
	}
	
	public boolean updateSaleSuccess(int id,String buyUser,String bz){
		String sql = "update "+table+" set bz=?,cgdate=?,jy=1,dfuser=? where id=? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(bz);
		parameter.setObject(new Date());
		parameter.setString(buyUser);
		parameter.setInt(id);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateBuySuccess(int id,String buyUser,String bz,int jyg){
		String sql = "update "+table+" set bz=?,cgdate=?,sysl=?,jy=1,dfuser=? where id=? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(bz);
		parameter.setObject(new Date());
		parameter.setInt(jyg);
		parameter.setString(buyUser);
		parameter.setInt(id);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean delete(int id){
		String sql = "delete from "+table+" where jyid =? and jy=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(id);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public IPage<Gpjy> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by id desc";
		return jdbc.getListPage(sql, Gpjy.class, null, pageSize, pageIndex);
	}
	
	public boolean update(String userName,int amount ,String dfuser){
		String sql = "update "+table+" set mysl=mysl+?,sysl=sysl+?,jypay=jypay+? where username=? and dfuser=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(amount).withInt(amount).withInt(amount).withString(userName).withString(dfuser))>0;
	}
	
	public Gpjy get(String userName,String dfuser){
		String sql = "select * from "+table+" where username=? and dfuser=? limit 1";
		return jdbc.get(sql, Gpjy.class, SqlParameter.Instance().withString(userName).withString(dfuser));
	}
}
