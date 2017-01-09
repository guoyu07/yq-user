package com.yq.manage.util;

import java.util.Comparator;

import com.yq.manage.bean.Role;

public class CompareRole implements Comparator<Object>{

	public int compare(Object o1, Object o2) {   
		Role obj1 = (Role)o1;   
		Role obj2 = (Role)o2; 
        if (obj1.getRoleLevel() > obj2.getRoleLevel()) {   
            return 1; // 第一个大于第二个   
        } else if (obj1.getRoleLevel() < obj2.getRoleLevel()) {   
            return -1;// 第一个小于第二个   
        } else {   
            return 0; // 等于   
        }  
   }  
	
}
