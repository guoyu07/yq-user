package com.yq.common.utils;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class YqPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer{

	/** 
     * 重写父类方法，解密指定属性名对应的属性值 
     */  
    @Override  
    protected String convertProperty(String propertyName,String propertyValue){  
        if(isEncryptPropertyVal(propertyName)){
        	//return AES.encryptWithKeyBase64(propertyValue, "xingfu100keyukejifhl7");TODO 
        	if(propertyName.equals("encrypt_jdbc.password")){
        		return "";
        	}else{
        		return "root";
        	}
        }else{  
            return propertyValue;  
        }  
    }  
    /** 
     * 判断属性值是否需要解密，这里我约定需要解密的属性名用encrypt开头 
     * @param propertyName 
     * @return 
     */  
    private boolean isEncryptPropertyVal(String propertyName){  
        if(propertyName.startsWith("encrypt")){  
            return true;  
        }else{  
            return false;  
        }  
    }  
	
}
