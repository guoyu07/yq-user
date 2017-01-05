package com.yq.manage.util;

import java.util.ArrayList;
import java.util.List;

public class MyTool {
	
	/**
	 * 拆分checkbox选中的id值
	 * @param ids
	 * @return
	 */
	public static List<Integer> getCheckedId(String ids){
		String[] values=ids.split(",");
		List<Integer> list=new ArrayList<Integer>();
		for(String value:values){
			list.add(Integer.valueOf(value));
		}
		return list;
	}
	

}
