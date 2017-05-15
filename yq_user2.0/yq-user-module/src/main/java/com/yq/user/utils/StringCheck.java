package com.yq.user.utils;

public class StringCheck {

	/**
	 * 
	 * 字符串是否含有特殊字符
	 * @param string
	 * @return
	 */
	public static boolean isConSpeCharacters(String string){ 
	    if(string.replaceAll("[\u4e00-\u9fa5]*[a-z]*[A-Z]*\\d*-*_*\\s*","").length()==0){ 
	        //不包含特殊字符 
	        return false; 
	    } 
	    return true; 
	} 
	
}
