package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.manager.bo.W10Bean;
import com.yq.user.bo.Txpay;
import com.yq.user.bo.TxpayIndex;

public class TxPayDao {

    @Autowired
	public Jdbc jdbc;
    
    private final String table = "txpay";
    
    public int add(Txpay txpay){
    	Date now = new Date();
    	if(txpay.getPaytime()==null){
    		txpay.setPaytime(now);
    	}
    	int payid = jdbc.insertBackKeys(txpay);
    	return payid;
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
    
    public List<Txpay> getMarkList(int pageSize){
//    	String sql="select * from txpay where payonoff = '尚未转账' and ep=0 and txvip=0 order by payid asc" ;
//    	return jdbc.getListPage(sql, Txpay.class, null, pageSize, pageIndex);
    	String sql = "select * from txpay where payid in (select t.payid from (select payid from txpay_index where ep=0 and txvip=0 order by payid asc limit "+pageSize+")t)";
    	return jdbc.getList(sql, Txpay.class);
    }
    
    public double getSumPayNum(){
    	String sql="select sum(paynum) from txpay where payonoff = '尚未转账' and ep=0" ;
    	return jdbc.getDouble(sql, null);
    }
    
    public IPage<Txpay> getPageListOrder(int pageIndex,int pageSize){
    	String sql="select * from txpay where payonoff = '尚未转账' and ep=0 order by pdid asc,jyid asc" ;
    	return jdbc.getListPage(sql, Txpay.class, null, pageSize, pageIndex);
    }
    
    public IPage<Txpay> getAdminPageList(int pageIndex,int pageSize){
    	String sql="select * from txpay where payonoff = '已经转账' order by paytime desc" ;
    	return jdbc.getListPage(sql, Txpay.class, null, pageSize, pageIndex);
    }
    
    public IPage<Txpay> getPageListSalesDetails(String userName,int pageIndex,int pageSize){
    	String sql="select * from txpay where payusername= ? and txlb=0 order by ep desc,payid desc" ;
    	SqlParameter sqlParameter = new SqlParameter();
    	sqlParameter.setString(userName);
    	return jdbc.getListPage(sql, Txpay.class, sqlParameter, pageSize, pageIndex);
    }
    
    public IPage<Txpay> getPageListBuyDetails(String userName,int pageIndex,int pageSize){
    	String sql = "select * from txpay where dfuser = ? order by ep desc,payid desc";
    	return jdbc.getListPage(sql, Txpay.class, SqlParameter.Instance().withString(userName), pageSize, pageIndex);
    }
    
    public Txpay getByPayid(int payId){
    	String sql = "select * from "+table+" where payid=? limit 1";
    	return this.jdbc.get(sql, Txpay.class, SqlParameter.Instance().withInt(payId));
    } 
    /**
     * 取消一币卖出
     * @param payId
     * @param ep
     * @param rgdate
     * @param payonoff
     * @param zftime
     * @param dfuser
     * @param clip
     * @return
     */
    public boolean updateByPayid(int payId,int ep,Date rgdate,String payonoff,Date zftime,String dfuser,String clip){
    	String sql = "update "+table+" set ep=?,rgdate=?,payonoff=?,zftime=?,dfuser=?,clip=? where payid=? limit 1";
    	boolean result = this.jdbc.update(sql, SqlParameter.Instance().withInt(ep).withObject(rgdate).withString(payonoff).withObject(zftime).withString(dfuser).withString(clip).withInt(payId))>0;
    	return result;
    }
    

    /**
     * 购买一币
     * @param payId
     * @param rgdate
     * @param userName
     * @param payNum
     * @return
     */
    public boolean updateEpToBeSalesPre(int payId,Date rgdate,String userName,int payNum){
    	String sql = "update "+table+" set ep=1,rgdate=?,dfuser=?,kjygid=? where payid=? and ep=0 and kjygid=0 and zftime is null limit 1";
    	boolean result = this.jdbc.update(sql, SqlParameter.Instance().withObject(rgdate).withString(userName).withInt(payNum).withInt(payId))>0;
    	return result;
    }
    
    
    public boolean updateEpToHavePay(int payId,Date rgdate){
    	String sql = "update "+table+" set ep=2,rgdate=? where payid=? and ep=1 limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withObject(rgdate).withInt(payId))>0;
    }
    
    public boolean updateEpToHaveReceive(int payId,String ip){
    	String sql = "update "+table+" set ep=0,rgdate=?,payonoff='已经转账',zftime=?,clip=? where payid=? and ep=2 limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withObject(new Date()).withString(ip).withInt(payId))>0;
    }
    
    public boolean updateEpToHaveReceiveBySytstem(int payId,String ip){
    	String sql = "update "+table+" set ep=0,rgdate=?,payonoff='已经转账',zftime=?,clip=?,tp=1 where payid=? and ep=2 limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withObject(new Date()).withObject(new Date()).withString(ip).withInt(payId))>0;
    }
    
    public Txpay getByPayOnoff(String payonoff){
    	String sql = "select * from "+table+" where payonoff=? limit 1";
    	return this.jdbc.get(sql, Txpay.class, SqlParameter.Instance().withString(payonoff));
    } 
    
    public double getSumpayNumNoCondition(){
    	String sql="select sum(paynum) from txpay" ;
    	return jdbc.getDouble(sql, null);
    }
    
    public IPage<W10Bean> getPageListW10(int pageIndex,int pageSize,String uid,String uname,String startTime,String endTime){
    	//String sql="select * from "+table+" where payonoff = '尚未转账' txvip=2 and paytime>? order by payid" ;
    	//SqlParameter.Instance().withObject(day)
    	String sql = "select cc.*,(select sum(paynum) FROM txpay where payusername = cc.payusername and dfuser<>'撤销') as sum_pay_num "
    			+ "from (select tx.*,tio.name as name,IFNULL(ue.need_verify,0) as need_verify from txpay as tx left join  txifok tio  on tio.username=tx.payusername left join user_extinfo ue on tx.payusername=ue.user_name "
    			+ " where tx.payonoff = '尚未转账' ";
    	if(!Strings.isNullOrEmpty(uid)){
    		sql = sql +" and tx.payusername='"+uid+"'";
    	}
    	if(!Strings.isNullOrEmpty(uname)){
    		sql = sql +" and tx.payname='"+uname+"'";
    	}
    	if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
    		sql = sql +" and tx.paytime between '"+startTime+"' and '"+endTime+"'";
    	}
    	sql=sql+" order by payid desc)cc";
    	return jdbc.getListPage(sql, W10Bean.class, null, pageSize, pageIndex);
    }
    
    public boolean updateTxvip(int payId,int txvip){
    	String sql = "update "+table+" set txvip=? where payid=? limit 1";
    	return jdbc.update(sql,  SqlParameter.Instance().withInt(txvip).withInt(payId))>0;
    }
    
    public List<Txpay> getAllNoGiveMoneyRecord(){
    	String date = DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD_HH_MM_SS);
    	String sql = "select * from "+table+" where ep=1 and rgdate<? and payonoff='尚未转账' and dfuser<>''";
    	return this.jdbc.getList(sql, Txpay.class, SqlParameter.Instance().withString(date));
    }
    
    public List<Txpay> getAllNoSureReceiveMoneyRecord(){
    	String date = DateUtils.DateToString(new Date(), DateStyle.YYYY_MM_DD_HH_MM_SS);
    	String sql = "select * from "+table+" where ep=2 and rgdate<? and payonoff='尚未转账' and dfuser<>'' and (clip is null or clip ='')";
    	return this.jdbc.getList(sql, Txpay.class, SqlParameter.Instance().withString(date));
    }
    
    public List<Txpay> getAllNoSureReceiveMoneyRecordAfter5Days(){
    	String date = DateUtils.DateToString(DateUtils.addDay(new Date(), -3), DateStyle.YYYY_MM_DD_HH_MM_SS);
    	String sql = "select * from "+table+" where ep=2 and rgdate<? and payonoff='尚未转账' and dfuser<>'' and clip ='已扣'";
    	return this.jdbc.getList(sql, Txpay.class, SqlParameter.Instance().withString(date));
    }
    
    public boolean updateClip(int payId){
    	String sql = "update "+table+" set clip='已扣' where payid=? limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withInt(payId))>0;
    }
    
    public boolean resetOrder(int payId){
    	String sql = "update "+table+" set ep=0,rgdate=null,dfuser='',kjygid=0 where payid=? limit 1";
    	return this.jdbc.update(sql, SqlParameter.Instance().withInt(payId))>0;
    }
    
    public int getUserSumPayNum(String userName){
    	String sql = "select sum(paynum) from txpay where payusername =?";
    	return this.jdbc.getInt(sql, SqlParameter.Instance().withString(userName));
    }
    /**
     * 删除索引
     * @param payId
     * @return
     */
    public boolean deleteIndex(int payId){
    	String indexSql = "delete from txpay_index  where payid=? limit 1";
		return jdbc.update(indexSql, SqlParameter.Instance().withInt(payId))>0;
    }
    /**
     * 更新索引的ep
     * @param payId
     * @param ep
     * @return
     */
    public boolean updateIndexEp(int payId,int ep){
    	String sql = "update txpay_index set ep=? where payid=? limit 1";
    	return jdbc.update(sql, SqlParameter.Instance().withInt(ep).withInt(payId))>0;
    }
    
    /**
     * 更新索引的ep
     * @param payId
     * @param ep
     * @return
     */
    public boolean updateIndexTxvip(int payId,int txvip){
    	String sql = "update txpay_index set txvip=? where payid=? limit 1";
    	return jdbc.update(sql, SqlParameter.Instance().withInt(txvip).withInt(payId))>0;
    }
    /**
     * 添加索引
     * @param index
     * @return
     */
    public boolean addTxIndex(TxpayIndex index){
            return jdbc.insert(index)>0;	
    }
}
