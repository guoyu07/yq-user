package com.yq.user.dao;

import java.util.Date;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.common.dao.YqDaoBase;
import com.yq.user.bo.MallOrder;

public class MallOrderDao extends YqDaoBase<MallOrder> {

	
	public boolean updateToSuccess(String orderId){
		String sql = "update "+super.getTable()+" set status=1,updated_time=? where order_id=? and status=0 limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(new Date()).withString(orderId))>0;
	}
}
