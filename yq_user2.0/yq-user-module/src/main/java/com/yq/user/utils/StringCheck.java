package com.yq.user.utils;

import com.google.common.base.Strings;
import com.sr178.game.framework.log.LogSystem;

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
	
	/**
	 * 字符串是否含有非法字符
	 * @param string
	 * @return
	 */
	public static boolean isHasUnlawful(String string){
		String[] strArr = {"<",">","/",".js","<script>",";"};//定义非法字符
		for (String string2 : strArr) {
				if(string.contains(string2)){
					LogSystem.warn("用户信息变更还有非法字符："+string2+",值:"+string);
					return true;
				}
		}
		return false;
	};
	
	public static void main(String[] args) {
		//System.out.println("isHasUnlawful()="+isHasUnlawful("qiwjsueh/"));
	}
	
	
	/**
	 * 检测是否还有非法字符
	 * @param params
	 * @return
	 */
	public static boolean checkUnlawful(String... params){
		for (int i = 0; i < params.length; i++) {
			if(!Strings.isNullOrEmpty(params[i])){
				if(isHasUnlawful(params[i])){
					return true;
				}
			}
		}
		return false;
		
	}
}
