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

	/**
	 * 查看订单id是否存在
	 * 
	 * @param orderId
	 * @return
	 */
	public boolean isHasMallorderByorder(String username, String orderId) {
		if(null!=getMallOrderByorder(username,orderId)){
			return true;
		}
		return false;
	}
	
	
	/**
	 * 根据订单id获得订单信息
	 * @param orderId
	 * @return
	 */
	public MallOrder getMallOrderByorder(String username, String orderId){
		String sql= "select * from "+super.getTable()+" where order_user = ? and order_id = ?";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(username);
		sqlparameter.setString(orderId);
		MallOrder mallorder = super.getJdbc().get(sql, MallOrder.class, sqlparameter);
		return mallorder;
	}
	
	/**
	 * 根据订单id获得订单信息
	 * @param orderId
	 * @return
	 */
	public MallOrder getMallOrderByorder(String orderId){
		String sql= "select * from "+super.getTable()+" where order_id = ?";
		SqlParameter sqlparameter = new SqlParameter();
		sqlparameter.setString(orderId);
		MallOrder mallorder = super.getJdbc().get(sql, MallOrder.class, sqlparameter);
		return mallorder;
	}
	
}
