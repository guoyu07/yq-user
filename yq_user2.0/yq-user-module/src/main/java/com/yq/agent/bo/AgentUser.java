package com.yq.agent.bo;

import java.util.Date;
   /**
    * agent_user 实体类
    */ 


public class AgentUser{
	private Integer id;
	private String agentName;
	private String password;
	private int agentScores;
	private int agentYb;
	private Date createdTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setAgentName(String agentName){
	this.agentName=agentName;
	}
	public String getAgentName(){
		return agentName;
	}
	public void setPassword(String password){
	this.password=password;
	}
	public String getPassword(){
		return password;
	}
	public void setAgentScores(int agentScores){
	this.agentScores=agentScores;
	}
	public int getAgentScores(){
		return agentScores;
	}
	public void setAgentYb(int agentYb){
	this.agentYb=agentYb;
	}
	public int getAgentYb(){
		return agentYb;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

