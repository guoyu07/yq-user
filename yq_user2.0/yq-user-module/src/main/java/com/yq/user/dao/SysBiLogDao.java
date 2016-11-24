package com.yq.user.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.yq.cw.bean.ClientBdblog;
import com.yq.user.bo.Jbkzj;
import com.yq.user.bo.SysBiLog;

public class SysBiLogDao {
	
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "sys_bi_log";

	/**
	 * @param sysBi
	 * @return
	 */
	public int add(SysBiLog sysBi) {
		if(sysBi.getRechargedate()==null){
			sysBi.setRechargedate(new Date());
		}
		return  this.jdbc.insertBackKeys(sysBi);
	}

	/**
	 * @param startTime
	 * @param endTime
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public IPage<SysBiLog> getPage(String zuser, String startTime, String endTime, int pageIndex, int pageSize) {
		String sql = "select * from "+table+" where 1=1 ";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql+" and rechargedate between ? and ? ";
			parameter.withString(startTime);
			parameter.withString(endTime);
		}
		if(!Strings.isNullOrEmpty(zuser)){
			sql = sql+" and  username = ?";
			parameter.withString(zuser);
		}
		sql = sql + " order by id desc";
		return this.jdbc.getListPage(sql, SysBiLog.class, parameter, pageSize, pageIndex);
	}

	/**
	 * 得到系统币日志列表
	 * 
	 * @param zuser
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<SysBiLog> getList(String zuser, String startTime, String endTime) {
		String sql = "select * from "+table+" where 1=1 ";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql+" and rechargedate between ? and ? ";
			parameter.withString(startTime);
			parameter.withString(endTime);
		}
		if(!Strings.isNullOrEmpty(zuser)){
			sql = sql+" and  username = ?";
			parameter.withString(zuser);
		}
		sql = sql + " order by id desc";
		return this.jdbc.getList(sql, SysBiLog.class, parameter);
	}

	/**
	 * @param zuser
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<ClientBdblog> getClientBdblogListByUsername(String zuser, String startTime, String endTime) {
		String sql = "select * from "+table+" where 1=1 ";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql+" and rechargedate between ? and ? ";
			parameter.withString(startTime);
			parameter.withString(endTime);
		}
		if(!Strings.isNullOrEmpty(zuser)){
			sql = sql+" and  username = ?";
			parameter.withString(zuser);
		}
		sql = sql + " order by id desc";
		return this.jdbc.getList(sql, ClientBdblog.class, parameter);
	}

	public List<ClientBdblog> getListByOperaterName(String zuser, String startTime, String endTime) {
		String sql = "select * from "+table+" where 1=1 ";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(startTime)&&!Strings.isNullOrEmpty(endTime)){
			sql = sql+" and rechargedate between ? and ? ";
			parameter.withString(startTime);
			parameter.withString(endTime);
		}
		if(!Strings.isNullOrEmpty(zuser)){
			sql = sql+" and  operator = ?";
			parameter.withString(zuser);
		}
		sql = sql + " order by id desc";
		return this.jdbc.getList(sql, ClientBdblog.class, parameter);
		
	}
}
