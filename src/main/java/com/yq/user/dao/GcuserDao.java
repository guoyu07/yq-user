package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Gcuser;

public class GcuserDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "gcuser";
	
	
	public Gcuser getUser(String userName){
		String sql = "select * from "+table+" where username=? limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(userName);
		return this.jdbc.get(sql, Gcuser.class, paramter);
	}
	/**
	 * 根据身份证和姓名查询用户
	 * @param idNum
	 * @param name
	 * @return
	 */
	public List<Gcuser> getUserByIdCard(String name,String idNum){
		String sql = "select * from "+table+" where userid=? or name=?";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(idNum);
		paramter.setString(name);
		return this.jdbc.getList(sql, Gcuser.class, paramter);
	}
	
	/**
	 * 获取用户同名列表
	 * @param name
	 * @param idNum
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getUserPage(String name,String idNum,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where userid=? and name=?";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(idNum);
		paramter.setString(name);		
		return this.jdbc.getListPage(sql, Gcuser.class, paramter, pageSize, pageIndex);
	}
	
	/**
	 * 获取用户同名列表(有条件)
	 * @param name
	 * @param idNum
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getUserPageByCondition(String userName,String name,String idNum,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where userid=? and name=? and pay>0 and username<>? order by id asc";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(idNum);
		paramter.setString(name);		
		paramter.setString(userName);
		return this.jdbc.getListPage(sql, Gcuser.class, paramter, pageSize, pageIndex);
	}
	
	/**
	 * 查询所有下家
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<Gcuser> getMyDownUserPage(String userName,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where up=? order by id desc";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(userName);
		return this.jdbc.getListPage(sql, Gcuser.class, paramter, pageSize, pageIndex);
	}
	/**
	 * 添加账户
	 * @param user
	 * @return
	 */
	public boolean addUser(Gcuser user){
		return this.jdbc.insert(user)>0;
	}
	
	/**
	 * 更新用户信息
	 * @param userName
	 * @param idCard
	 * @param password
	 * @param password3
	 * @param ganew
	 * @param qq
	 * @param call
	 * @return
	 */
	public boolean updateUser(String name,String idCard,String password,String password3,int ganew,String qq,String call){
		String sql = "update "+table+" set password=? , password3=? , ganew=? , qq=? ,`call`=? where name=? and userid=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(password);
		parameter.setString(password3);
		parameter.setInt(ganew);
		parameter.setString(qq);
		parameter.setString(call);
		parameter.setString(name);
		parameter.setString(idCard);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateUser(String name,String idCard, String password,  String card, String bank,String  addsheng,String addshi,String addqu){
		String sql = "update "+table+" set password=? ,  card=? , bank=? ,addsheng=?,addshi=?,addqu=? where name=? and userid=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(password);
		parameter.setString(card);
		parameter.setString(bank);
		parameter.setString(addsheng);
		parameter.setString(addshi);
		parameter.setString(addqu);
		parameter.setString(name);
		parameter.setString(idCard);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateUser(String userName,String jcName,String jcUserId){
		String sql = "update "+table+" set jcname=? ,  jcuserid=?  where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(jcName);
		parameter.setString(jcUserId);
		parameter.setString(userName);
		return this.jdbc.update(sql, parameter)>0;
	}
	/**
	 * 更新用户登录时间
	 * @param username
	 * @return
	 */
	public boolean updateLoginTime(String username){
		String sql = "update "+table+" set logtime=? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setObject(new Date());
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
		
	}
	/**
	 * 减一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean reduceYb(String username,int changeNum){
		String sql = "update "+table+" set pay=pay-?,vippay= case when vippay<? then 0 else vippay-? end,fhpay= case when fhpay<? then 0 else fhpay-? end,txpay=txpay+? where username=? and pay-?>=0";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		parameter.setInt(changeNum);
		return this.jdbc.update(sql, parameter)>0;
	}
	/**
	 * 减一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean saleYb(String username,int changeNum){
		String sql = "update "+table+" set pay=pay-?,mcpay=mcpay+?,fhpay= case when fhpay<? then 0 else fhpay-? end,txpay=txpay+?,payok=1 where username=? and pay-?>=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		parameter.setInt(changeNum);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	/**
	 * 撤销卖出一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean backSaleYb(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+?,mcpay= case when mcpay<? then 0 else mcpay-? end,txpay= case when txpay<? then 0 else txpay-? end,payok=0 where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	/**
	 * YB转账减一币
	 * @param userName
	 * @param changeNum
	 * @return
	 */
	public boolean transferReduceYb(String userName,int changeNum){
		String sql = "update "+table+" set pay=pay-?,txpay=txpay+?,payok=1 where username=? and pay-?>=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(userName);
		parameter.setInt(changeNum);
		return this.jdbc.update(sql, parameter)>0;
	}
	/**
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addYb(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+?,vippay=vippay+?,cbpay=cbpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean addOtherYb(String userName,int changeNum){
		String sql = "update "+table+" set pay=pay+?,jbpay=jbpay+?,dlpay=dlpay+?,cbpay=cbpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(userName);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	
	public int getSumSjb(String name,String idNum){
		String sql = "select sum(sjb) from "+table+" where sjb=100 and userid=? and name=?";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(idNum);
		paramter.setString(name);
		return this.jdbc.getInt(sql, paramter);
	}
	
	public boolean addSybdb(String userName,int changeNum){
		String sql = "update "+table+" set sybdb=sybdb+?,ljbdb=ljbdb+? where username=? limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(changeNum);
		paramter.setInt(changeNum);
		paramter.setString(userName);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean reduceSybdb(String userName,int changeNum){
		String sql = "update "+table+" set sybdb=sybdb-? where username=? and sybdb-?>0 limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(changeNum);
		paramter.setString(userName);
		paramter.setInt(changeNum);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean updateJB(String userName,int jydb){
		String sql = "update "+table+" set jydb=jydb+?,gmdate=?,bddate=? where username=? and jydb+?>0 limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(jydb);
		paramter.setObject(new Date());
		paramter.setObject(new Date());
		paramter.setString(userName);
		paramter.setInt(jydb);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean updateSjb(String userName,int sjb){
		String sql = "update "+table+" set sjb=?  where username=? limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(sjb);
		paramter.setString(userName);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean updatePayOk(String name,String idCardNum,int payok){
		String sql = "update "+table+" set payok=?  where name=? and userid=?";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(payok);
		paramter.setString(name);
		paramter.setString(idCardNum);
		return this.jdbc.update(sql, paramter)>0;
	}
}
