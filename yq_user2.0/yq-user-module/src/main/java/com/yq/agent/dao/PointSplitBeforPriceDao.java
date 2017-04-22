package com.yq.agent.dao;

import java.util.List;

import com.yq.agent.bean.PointSplitBeforPrice;
import com.yq.common.dao.YqDaoBase;

public class PointSplitBeforPriceDao extends YqDaoBase<PointSplitBeforPrice>{

	
	private static final String table = "point_split_befor_price";
	
	public List<PointSplitBeforPrice> gettop10(){
		String sql = "select * from "+table+" order by id desc limit 5 ";
		return super.getJdbc().getList(sql, PointSplitBeforPrice.class);
	}
	
	
	public boolean add(PointSplitBeforPrice pointSplitPrice){
		return super.getJdbc().insert(pointSplitPrice)>0;
	}
}
