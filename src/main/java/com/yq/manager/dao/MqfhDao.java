package com.yq.manager.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;

public class MqfhDao {
	@Autowired
	private Jdbc jdbc;
	
	private static String table = "mqfh";
	
	public Double getSumpdlb(String startTime,String endTime){
		String sql = "SELECT sum(pdlb) FROM "+table+" where pddate between ? and ?";
		return this.jdbc.getDouble(sql, SqlParameter.Instance().withString(startTime).withString(endTime));
	}
	
	public boolean update(){
		String sql = "update "+table+" set pdlb=pdlb-ljpay/50,ljpay=0 where ljpay>50";
		return jdbc.update(sql, null)>0;
	}
	
	public Double getSumMqpay(){
		String sql = "SELECT sum(mqpay) FROM "+table+" where pdid>0";
		return jdbc.getDouble(sql, null);
	}
	
	public Double getSumpdlbByArea(String area,String startTime,String endTime){
		String sql = "SELECT sum(pdlb) FROM "+table+" where addsheng=? and pddate between ? and ?";
		Double result = this.jdbc.getDouble(sql, SqlParameter.Instance().withString(area).withString(startTime).withString(endTime));
		return result;
	}
	
	public boolean updateDoubleAreaFh(double fh,String beforDate){
		String sql = "update "+table+" set ctpay=mqpay,dqpay=?*pdlb,mqpay=mqpay+?*pdlb,ljpay=ljpay+?*pdlb where sjb>0 and mqpay<50 and pddate<?";
		SqlParameter parameter = SqlParameter.Instance();
		parameter.setDouble(fh);
		parameter.setDouble(fh);
		parameter.setDouble(fh);
		parameter.setString(beforDate);
		return jdbc.update(sql, parameter)>0;
	}
	
	public boolean updateCommonUserFh(double fh,String beforDate){
		String sql = "update "+table+" set ctpay=mqpay,dqpay=?*pdlb,mqpay=mqpay+?*pdlb,ljpay=ljpay+?*pdlb where sjb=0 and mqpay<50 and pddate<?";
		SqlParameter parameter = SqlParameter.Instance();
		parameter.setDouble(fh);
		parameter.setDouble(fh);
		parameter.setDouble(fh);
		parameter.setString(beforDate);
		return jdbc.update(sql, parameter)>0;
	}
}
