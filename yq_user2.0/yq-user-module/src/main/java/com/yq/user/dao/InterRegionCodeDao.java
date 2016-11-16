package com.yq.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sr178.common.jdbc.Jdbc;
import com.sr178.common.jdbc.SqlParameter;
import com.yq.user.bo.InterRegionCode;

/**
 * @author 作者: HuHua
 * @version 2016年11月15日
 * 类说明 
 */
public class InterRegionCodeDao {

	@Autowired
	private Jdbc jdbc;
    
	private static String table = "interregioncode";
	
	
	
    /**
     * 得到所有区域码
     * 
     * @return
     */
    public List<InterRegionCode> getAllList(){
    	String sql = "select * from "+table+" order by country";
    	return jdbc.getList(sql, InterRegionCode.class);
    }

	/**
	 * 判断是否有此区域码
	 * 
	 * @param areaCode
	 * @return
	 */
	public boolean isHasByRegioncode(int areaCode) {
		if(getInterCodeByRegionCode(areaCode)!=null){
			return true;
		}
		return false;
	}
	

	/**
	 * 通过区域码得到区域码信息
	 * 
	 * @param region_code
	 * @return
	 */
	public InterRegionCode getInterCodeByRegionCode(int areaCode) {
		String sql = "select * from "+table+" where region_code = ? ";
		SqlParameter sqlParameter = SqlParameter.Instance();
		sqlParameter.withInt(areaCode);
		return jdbc.get(sql, InterRegionCode.class, sqlParameter);
	}
	
}
