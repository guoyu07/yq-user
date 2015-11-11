package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Gcuser;

public class GcuserDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "gcuser";
	
	
	public boolean delete(String userName){
		String sql = "delete from "+table+" where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withString(userName))>0;
	}
	
	public Gcuser getByAddress(String field,Object value,int jb){
		String sql = "select * from "+table+" where "+field+"=? and jb=? limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setObject(value);
		paramter.setInt(jb);
		return this.jdbc.get(sql, Gcuser.class, paramter);
	}
	
	public IPage<Gcuser> getPageList(int pageIndex,int pageSize){
		String sql = "select * from "+table+" order by id desc";
		return this.jdbc.getListPage(sql, Gcuser.class, null, pageSize, pageIndex);
	}
	
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
	public List<Gcuser> getUserByIdCard(String idNum){
		String sql = "select * from "+table+" where userid=?";
		SqlParameter paramter = new SqlParameter();
		paramter.setString(idNum);
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
		String sql = "update "+table+" set password=? , password3=? , ganew=? , qq=? ,`call`=? where userid=? and name=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(password);
		parameter.setString(password3);
		parameter.setInt(ganew);
		parameter.setString(qq);
		parameter.setString(call);
		parameter.setString(idCard);
		parameter.setString(name);
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
	
	public boolean updateUserByAdmin(String userName,String password3,String card, String bank,  String name, String call,String  email,String qq,String userid,int payok,String jcname,String jcuserid,String password,Date pwdate){
		String sql = "update "+table+" set password3=? , card=? , bank=? ,name=?,`call`=?,email=?,qq=?,userid=?,payok=?,jcname=?,jcuserid=?";
		boolean isChangePassword = false;
		boolean isChangePwdate = false;
		if(password!=null&&!password.equals("")){
			sql = sql+ ",password=?";
			isChangePassword = true;
		}
		if(pwdate!=null){
			sql = sql+ ",pwdate=?";
			isChangePwdate = true;
		}
		sql = sql + " where username=?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(password3);
		parameter.setString(card);
		parameter.setString(bank);
		parameter.setString(name);
		parameter.setString(call);
		parameter.setString(email);
		parameter.setString(qq);
		parameter.setString(userid);
		parameter.setInt(payok);
		parameter.setString(jcname);
		parameter.setString(jcuserid);
		if(isChangePassword){
			parameter.setString(password);
		}
		if(isChangePwdate){
			parameter.setObject(pwdate);
		}
		parameter.setString(userName);
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
	
	/**
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addYbForBuyInMark(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+?,rgpay=rgpay+?,cbpay=cbpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	/**
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addYbForDoubleAreaCount(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+?,jjpay=jjpay+?,cbpay=cbpay+?,dlpay=dlpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	/**
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean reduceYbForDoubleAreaCount(String username,int changeNum){
		String sql = "update "+table+" set pay=pay-?,jjpay= case when jjpay<? then 0 else jjpay-? end,dlpay= case when dlpay<? then 0 else dlpay-? end,cbpay= case when cbpay<? then 0 else cbpay-? end where username=? and pay-?>=0";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
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
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addYbForDoubleAreaCountJypay(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+?,jypay=jypay+?,cbpay=cbpay+?,dlpay=dlpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	/**
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean reduceYbForDoubleAreaCountJypay(String username,int changeNum){
		String sql = "update "+table+" set pay=pay-?,jjpay= case when jypay<? then 0 else jypay-? end,dlpay= case when dlpay<? then 0 else dlpay-? end,cbpay= case when cbpay<? then 0 else cbpay-? end where username=? and pay-?>=0";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
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
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addYbByBackCount(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+?,vippay=vippay+?,cbpay=cbpay+?,fhpay=fhpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}	
	/**
	 * 加一币
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addOnlyYb(String username,int changeNum){
		String sql = "update "+table+" set pay=pay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
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
		String sql = "update "+table+" set sybdb=sybdb-? where username=? and sybdb-?>=0 limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(changeNum);
		paramter.setString(userName);
		paramter.setInt(changeNum);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean updateJB(String userName,int jydb){
		String sql = "update "+table+" set jydb=jydb+?,gmdate=?,bddate=? where username=? and jydb+?>=0 limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(jydb);
		paramter.setObject(new Date());
		paramter.setObject(new Date());
		paramter.setString(userName);
		paramter.setInt(jydb);
		return this.jdbc.update(sql, paramter)>0;
	}

	public boolean addOnlyJB(String userName,int jydb){
		String sql = "update "+table+" set jydb=jydb+? where username=? limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(jydb);
		paramter.setString(userName);
		return this.jdbc.update(sql, paramter)>0;
	}
	public boolean reduceOnlyJB(String userName,int jydb){
		String sql = "update "+table+" set jydb=jydb-? where username=? and jydb-?>=0 limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(jydb);
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
	
	public boolean updateJyg(String userName,int changejygNum){
		String sql = "update "+table+" set jyg=jyg-?  where username=? and jyg-?>=0  limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setInt(changejygNum);
		paramter.setString(userName);
		paramter.setInt(changejygNum);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean updateGmdate(String userName,Date gmdate){
		String sql = "update "+table+" set gmdate=?  where username=?  limit 1";
		SqlParameter paramter = new SqlParameter();
		paramter.setObject(gmdate);
		paramter.setString(userName);
		return this.jdbc.update(sql, paramter)>0;
	}
	
	public boolean addWhenOtherPersionBuyJbCard(String userName,int changeNum){
		String sql = "update "+table+" set pay=pay+?,cbpay=cbpay+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(userName);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public Gcuser getGcuserByQu(String qu){
		String sql = "select * from "+table+" where addqu=? and jb=4 limit 1";
		return this.jdbc.get(sql, Gcuser.class, SqlParameter.Instance().withString(qu));
	}
	
	public boolean updateQuPay(String username,int changeNum){
		String sql = "update "+table+" set qutj=qutj+?,qupay=qupay+?,dlpay=dlpay+? where username=? and jb=4 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public Gcuser getGcuserByShi(String shi){
		String sql = "select * from "+table+" where addshi=? and jb=3 limit 1";
		return this.jdbc.get(sql, Gcuser.class, SqlParameter.Instance().withString(shi));
	}
	
	public boolean updateShiPay(String username,int changeNum){
		String sql = "update "+table+" set shitj=shitj+?,shipay=shipay+?,dlpay=dlpay+? where username=? and jb=3 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public Gcuser getGcuserBySheng(String sheng){
		String sql = "select * from "+table+" where addsheng=? and jb=2 limit 1";
		return this.jdbc.get(sql, Gcuser.class, SqlParameter.Instance().withString(sheng));
	}
	
	public boolean updateShengPay(String username,int changeNum){
		String sql = "update "+table+" set shengtj=shengtj+?,shengpay=shengpay+?,dlpay=dlpay+? where username=? and jb=2 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public Gcuser getGcuserByDqu9(String dqu9){
		String sql = "select username from "+table+" where add9dqu=? and jb=1 limit 1";
		return this.jdbc.get(sql, Gcuser.class, SqlParameter.Instance().withString(dqu9));
	}
	public boolean update9QuPay(String username,int changeNum){
		String sql = "update "+table+" set dqutj=dqutj+?,dqupay=dqupay+?,dlpay=dlpay+? where username=? and jb=1 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setInt(changeNum);
		parameter.setString(username);
		return this.jdbc.update(sql, parameter)>0;
	}	
	
	public boolean increaseStopjyg(String userName,int max){
		String sql = "update "+table+" set stopjyg=stopjyg+1 where username=? and stopjyg+1<=?  limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		parameter.setInt(max);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean reduceStopjyg(String userName){
		String sql = "update "+table+" set stopjyg= case when stopjyg-1<0 then 0 else stopjyg-1 end where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean resetStopjyg(String userName){
		String sql = "update "+table+" set stopjyg=0 where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(userName);
		return this.jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateSmsCode(String userName,String code){
		String sql = "update "+table+" set vipsq=? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(code);
		parameter.setString(userName);
		return this.jdbc.update(sql, parameter)>0;	
	}
	
	public IPage<Gcuser> searchPage(String param,int pageIndex,int pageSize){
		String sql = "select * from "+table+" where username = ? or name = ? or `call` = ? or qq = ? or userid = ?";
		SqlParameter parameter = new SqlParameter();
		parameter.setString(param);
		parameter.setString(param);
		parameter.setString(param);
		parameter.setString(param);
		parameter.setString(param);
		return this.jdbc.getListPage(sql, Gcuser.class,parameter, pageSize, pageIndex);
	}
	
	public boolean updateCjtj(String userName,int amount){
		String sql = "update "+table+" set cjtj=cjtj+?,gmdate=? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(amount);
		parameter.setObject(new Date());
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateCjtjForGw(String userName,int amount){
		String sql = "update "+table+" set cjtj=cjtj+?,jjsy=jjsy+?,ljsy=ljsy+?,gmdate=? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(amount);
		parameter.setInt(amount);
		parameter.setInt(amount);
		parameter.setObject(new Date());
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateSyepLjbdbSybdb(String userName,int syep,int ljbdb,int sybdb){
		String sql = "update "+table+" set syep=syep-?,ljbdb=ljbdb+?,sybdb=sybdb+? where username=? and syep-?>=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(syep);
		parameter.setInt(ljbdb);
		parameter.setInt(sybdb);
		parameter.setString(userName);
		parameter.setInt(syep);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean addSyep(String userName,int syep){
		String sql = "update "+table+" set syep=syep+?,ljep=ljep+? where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(syep);
		parameter.setInt(syep);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateGwuid(String userName,int gwuid){
		String sql = "update "+table+" set gwuid=?  where username=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(gwuid);
		parameter.setString(userName);
		return jdbc.update(sql, parameter)>0;
	}
	
	public Double getSumCbpay(){
		String sql = "select sum(cbpay) from "+table+" where jygt1<>2";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumPay(){
		String sql = "select sum(pay) from "+table+" where jygt1<>2";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumPayIdRange(){
		String sql = "select sum(pay) from "+table+" where id<10586 and jygt1<>2";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumTxpay(){
		String sql = "select sum(txpay) from "+table+"";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumJydb(){
		String sql = "select sum(jydb) from "+table+" where dbt1<>2";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumJyg(){
		String sql = "select sum(jyg) from "+table+" where jygt1<>2";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumJygIdRange(){
		String sql = "select sum(jyg) from "+table+" where id<10586 and jygt1<>2";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumGdgc(){
		String sql = "select sum(gdgc) from "+table+"";
		return jdbc.getDouble(sql, null);
	}	
	public Double getSumGdgcIdRange(){
		String sql = "select sum(gdgc) from "+table+" where id<10586";
		return jdbc.getDouble(sql, null);
	}	
	public Double getSumLjfh(){
		String sql = "select sum(ljfh) from "+table+"";
		return jdbc.getDouble(sql, null);
	}	
	
	public Double getSumByField(String fieldName){
		String sql = "select sum("+fieldName+") from "+table+"";
		return jdbc.getDouble(sql, null);
	}
	
	public boolean reduceVipcjcjb(String userName,int changeAmount){
		String sql = "update "+table+" set vipcjcjb=vipcjcjb-?,vipsycjb=vipsycjb+? where username=? and vipcjcjb-?>=0 limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(changeAmount).withInt(changeAmount).withString(userName).withInt(changeAmount))>0;
	}
	
	public boolean addVipcjcjb(String userName,int changeAmount){
		String sql = "update "+table+" set vipcjcjb=vipcjcjb+?,vipljcjb=vipljcjb+? where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(changeAmount).withInt(changeAmount).withString(userName))>0;
	}
	
	public boolean updateAdminLevel(String userName,int jb,Date dldate,Date dqDate){
		String sql = "update "+table+" set jb=?,dldate=?,dqdate=? where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(jb).withObject(dldate).withObject(dqDate).withString(userName))>0;
	}
	
	public IPage<Gcuser> getSqDayAddUserPages(int pageIndex,int pageSize,String startTime,String endTime){
		String and = "";
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			and = " and g.bddate between '"+startTime+"' and '" +endTime+"'";
		}
		String sql = "select g.*,gup.gmdate as upgmdate from "+table+" g left join gcuser gup on g.up=gup.username  where g.sjb>10"+and+" order by g.bddate desc";
		return jdbc.getListPage(sql, Gcuser.class, null, pageSize, pageIndex);
	}
	
	public int getSumSjbByTime(String startTime,String endTime){
		String and = "";
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			and = " and bddate between '"+startTime+"' and '" +endTime+"'";
		}
		String sql = "select sum(sjb) from "+table+" where sjb>19"+and;
		return jdbc.getInt(sql, null);
	}
	
	public boolean updateJygdateAndJygt1(String jygStr,int jygt1Condition,Date jygdate,int jygt1Value){
		String sql = "update "+table+" set jygdate=?,jygt1=? where jyg"+jygStr+" and jygt1=?";
		return jdbc.update(sql, SqlParameter.Instance().withObject(jygdate).withInt(jygt1Value).withInt(jygt1Condition))>0;
	}
	
	public boolean updateAbdateAndDbtl(String jydbStr,int dbt1Condition,Date dbdate,int dbt1Value){
		String sql = "update "+table+" set dbdate=?,dbt1=? where jydb"+jydbStr+" and dbt1=?";
		return jdbc.update(sql, SqlParameter.Instance().withObject(dbdate).withInt(dbt1Value).withInt(dbt1Condition))>0;
	}
	
	public IPage<Gcuser> getBatchUser(int pageIndex,int pageSize,String endTime ){
		String and = "";
		if(!Strings.isNullOrEmpty(endTime)){
			and = " and dbdate  < '"+endTime+"'";
		}
		String sql = "select * from "+table+" where jydb>30 and dbt1=1"+and+" order by dbdate desc";
		return jdbc.getListPage(sql, Gcuser.class, null, pageSize, pageIndex);
	}
	
	public IPage<Gcuser> getManageQueren(int pageIndex,int pageSize,String endTime){
		String and = "";
		if(!Strings.isNullOrEmpty(endTime)){
			and = " and jygdate  < '"+endTime+"'";
		}
		String sql = "select * from "+table+" where jyg>50000 and jygt1=1"+and+" order by jygdate desc";
		return jdbc.getListPage(sql, Gcuser.class, null, pageSize, pageIndex);
	}
	
	public boolean updateMan1234(String userName,int jydb,Date dbdate,int dbt1){
		String sql = "update "+table+" set jydb=?,dbdate=?,dbt1=? where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(jydb).withObject(dbdate).withInt(dbt1).withString(userName))>0;
	}
	
	public boolean updateManageQueren(String userName,int jyg,Date jygdate,int jygt1){
		String sql = "update "+table+" set jyg=?,jygdate=?,jygt1=? where username=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withInt(jyg).withObject(jygdate).withInt(jygt1).withString(userName))>0;
	}
	
	public boolean updatePwdate(String idcardNum,String name,Date pwDate){
		String sql = "update "+table+" set pwdate=? where userid=? and name=? limit 1";
		return jdbc.update(sql, SqlParameter.Instance().withObject(pwDate).withString(idcardNum).withString(name))>0;
	}
}
