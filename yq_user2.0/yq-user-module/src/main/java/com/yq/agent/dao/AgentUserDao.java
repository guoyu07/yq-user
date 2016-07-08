package com.yq.agent.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.yq.agent.bo.AgentUser;
import com.yq.common.dao.YqDaoBase;

public class AgentUserDao extends YqDaoBase<AgentUser>{

	/**
	 * 减积分
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean reduceScore(String agentName,int changeNum){
		String sql = "update "+super.getTable()+" set agent_scores=agent_scores-? where agent_name=? and agent_scores-?>=0 limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setString(agentName);
		parameter.setInt(changeNum);
		return super.getJdbc().update(sql, parameter)>0;
	}
	/**
	 * 减积分
	 * @param username
	 * @param changeNum
	 * @return
	 */
	public boolean addScore(String agentName,int changeNum){
		String sql = "update "+super.getTable()+" set agent_scores=agent_scores+? where agent_name=? limit 1";
		SqlParameter parameter = new SqlParameter();
		parameter.setInt(changeNum);
		parameter.setString(agentName);
		return super.getJdbc().update(sql, parameter)>0;
	}
}
