package com.yq.agent.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.common.dao.YqDaoBase;
import com.yq.user.bo.Txpay;

public class AgentTxpayDao extends YqDaoBase<Txpay>{
	
	  public IPage<Txpay> getPageListSalesDetails(String userName,int pageIndex,int pageSize){
	    	String sql="select * from txpay where payusername= ? and txlb=0 order by ep desc,payid desc" ;
	    	SqlParameter sqlParameter = new SqlParameter();
	    	sqlParameter.setString(userName);
	    	return getJdbc().getListPage(sql, Txpay.class, sqlParameter, pageSize, pageIndex);
	    }

}
