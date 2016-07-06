package com.yq.agent.dao;

import java.util.Date;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.agent.bo.AgentOrder;
import com.yq.common.dao.YqDaoBase;

public class AgentOrderDao extends YqDaoBase<AgentOrder> {

	/**
	 * 更新至成功
	 * @param orderId
	 * @param payUserName
	 * @param payTime
	 * @return
	 */
	public boolean updateStatusToSuccess(int orderId,String payUserName,Date payTime){
		String sql = "update agent_order set status="+AgentOrder.ST_SUCCESS+",pay_time=?,pay_user_name=? where id=? and status="+AgentOrder.ST_CTREATE+" limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(payTime).withString(payUserName).withInt(orderId))>0;
	}
	
	
	public boolean updateCallBackStatusToSuccess(int orderId,Date callBackTime){
		String sql = "update agent_order set call_back_status="+AgentOrder.ST_SUCCESS+",call_back_time=? where id=? and call_back_status="+AgentOrder.ST_CTREATE+" limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(callBackTime).withInt(orderId))>0;
	}
	
}
