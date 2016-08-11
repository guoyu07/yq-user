package com.yq.cw.dao;

import java.util.List;

import com.yq.common.dao.YqDaoBase;
import com.yq.cw.bo.VipDownTemp;

public class VipDownTempDao extends YqDaoBase<VipDownTemp> {

	public void insertBatch(List<VipDownTemp> list){
		super.getJdbc().insert(list);
	}
	
}
