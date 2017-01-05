package com.yq.manage.util;

import java.util.Comparator;

import com.yq.manage.bean.Resource;

/**
 * @author 作者: HuHua
 * @version 2016年12月30日
 * 类说明  集合排序
 */
public class CompareResource implements Comparator<Object>{
	
	public int compare(Object o1, Object o2) {   
		Resource obj1 = (Resource)o1;   
		Resource obj2 = (Resource)o2; 
        if (obj1.getId() > obj2.getId()) {   
            return 1; // 第一个大于第二个   
        } else if (obj1.getId() < obj2.getId()) {   
            return -1;// 第一个小于第二个   
        } else {   
            return 0; // 等于   
        }  
   }  
}
