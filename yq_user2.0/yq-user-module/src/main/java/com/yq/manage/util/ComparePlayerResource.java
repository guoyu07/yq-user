package com.yq.manage.util;

import java.util.Comparator;

import com.yq.manager.bean.PlayerResource;

/**
 * @author 作者: HuHua
 * @version 2016年12月30日
 * 类说明  集合排序
 */
public class ComparePlayerResource implements Comparator<Object>{
	
	public int compare(Object o1, Object o2) {   
		PlayerResource obj1 = (PlayerResource)o1;   
		PlayerResource obj2 = (PlayerResource)o2; 
        if (obj1.getResoNo()> obj2.getResoNo()) {
            return 1; // 第一个大于第二个   
        } else if (obj1.getResoNo() < obj2.getResoNo()) {   
            return -1;// 第一个小于第二个   
        } else {   
            return 0; // 等于   
        }  
   }  
}
