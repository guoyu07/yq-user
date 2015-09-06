package com.yq.user.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.user.bo.Txpay;

public class TxPayDao {

    @Autowired
	public Jdbc jdbc;
    
    private final String table = "txpay";
    
    public boolean add(Txpay txpay){
    	if(txpay.getPaytime()==null){
    		txpay.setPaytime(new Date());
    	}
    	return jdbc.insert(txpay)>0;
    }
    
    public Txpay getTxPayByDfuser(String dfuser,int ep){
    	String sql = "select * from "+table+" where dfuser =? and ep=? limit 1";
    	SqlParameter sqlParameter = new SqlParameter();
    	sqlParameter.setString(dfuser);
    	sqlParameter.setInt(ep);
    	return this.jdbc.get(sql, Txpay.class, sqlParameter);
    }
    
    
    public Txpay getTxPayByPayUserName(String payUserName,int ep){
    	String sql = "select * from "+table+" where payusername =? and ep=? limit 1";
    	SqlParameter sqlParameter = new SqlParameter();
    	sqlParameter.setString(payUserName);
    	sqlParameter.setInt(ep);
    	return this.jdbc.get(sql, Txpay.class, sqlParameter);
    }
    
    public Txpay get(){
    	String sql = "select * from "+table+" order by payid desc limit 1 ";
    	return this.jdbc.get(sql, Txpay.class, null);
    }
    
    public IPage<Txpay> getPageList(int pageIndex,int pageSize){
    	String sql="select * from txpay where payonoff = '尚未转账' and ep=0 order by jyid asc" ;
    	return jdbc.getListPage(sql, Txpay.class, null, pageSize, pageIndex);
    }
    
    public double getSumPayNum(){
    	String sql="select sum(paynum) from txpay where payonoff = '尚未转账' and ep=0" ;
    	return jdbc.getDouble(sql, null);
    }
    
    public IPage<Txpay> getPageListOrder(int pageIndex,int pageSize){
    	String sql="select * from txpay where payonoff = '尚未转账' and ep=0 order by pdid asc,jyid asc" ;
    	return jdbc.getListPage(sql, Txpay.class, null, pageSize, pageIndex);
    }
    
    public IPage<Txpay> getPageListSalesDetails(String userName,int pageIndex,int pageSize){
    	String sql="select * from txpay where payusername= ? and txlb=0 order by payid desc" ;
    	SqlParameter sqlParameter = new SqlParameter();
    	sqlParameter.setString(userName);
    	return jdbc.getListPage(sql, Txpay.class, sqlParameter, pageSize, pageIndex);
    }
    
    public IPage<Txpay> getPageListBuyDetails(String userName,int pageIndex,int pageSize){
    	String sql = "select * from txpay where dfuser = ? order by payid desc";
    	return jdbc.getListPage(sql, Txpay.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
    }
    
    public Txpay getByPayid(int payId){
    	String sql = "select * from "+table+" where payid=? limit 1";
    	return this.jdbc.get(sql, Txpay.class, SqlParameter.Instance().withInt(payId));
    } 
    
    public boolean updateByPayid(int payId,int ep,Date rgdate,String payonoff,Date zftime,String dfuser,String clip){
    	String sql = "update "+table+" set ep=?,rgdate=?,payonoff=?,zftime=?,dfuser=?,clip=? where payid=? limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withInt(ep).withObject(rgdate).withString(payonoff).withObject(zftime).withString(dfuser).withString(clip).withInt(payId))>0;
    }
    
    public boolean updateEpToBeSalesPre(int payId,Date rgdate,String userName,int payNum){
    	String sql = "update "+table+" set ep=1,rgdate=?,dfuser=?,kjygid=? where payid=? and ep=0  and kjygid=0 limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withObject(rgdate).withString(userName).withInt(payNum).withInt(payId))>0;
    }
    
    public boolean updateEpToHavePay(int payId,Date rgdate){
    	String sql = "update "+table+" set ep=2,rgdate=? where payid=? and ep=1 limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withObject(rgdate).withInt(payId))>0;

    }
    public Txpay getByPayOnoff(String payonoff){
    	String sql = "select * from "+table+" where payonoff=? limit 1";
    	return this.jdbc.get(sql, Txpay.class, SqlParameter.Instance().withString(payonoff));
    } 
    
    
    
}
