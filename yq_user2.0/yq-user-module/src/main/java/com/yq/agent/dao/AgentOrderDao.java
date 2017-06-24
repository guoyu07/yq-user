package com.yq.agent.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.plugin.IAppPlugin;
import com.yq.agent.bo.AgentOrder;
import com.yq.app.utils.MacShaUtils;
import com.yq.common.dao.YqDaoBase;

public class AgentOrderDao   extends YqDaoBase<AgentOrder> {

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
		String sql = "update agent_order set call_back_status="+AgentOrder.ST_SUCCESS+",call_back_time=? where id=? and `status`=1 and call_back_status="+AgentOrder.ST_CTREATE+" limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(callBackTime).withInt(orderId))>0;
	}

	
	public List<AgentOrder> getList(){
		String sql = "SELECT * FROM agent_order WHERE `status`=1 AND call_back_status=0 and created_time>'2017-06-23 17:20:59' ORDER BY id LIMIT 5";
		return super.getJdbc().getList(sql, AgentOrder.class);
	}

}
