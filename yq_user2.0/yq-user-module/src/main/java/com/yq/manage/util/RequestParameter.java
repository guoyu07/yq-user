package com.yq.manage.util;

/**
 * @author 作者: HuHua
 * @version 2016年12月19日
 * 类说明 
 */
public class RequestParameter {
	
	  private String key;
	  private String value;

	  public RequestParameter()
	  {
		  
	  }

	  public RequestParameter(String key, String value)
	  {
	    this.key = key;
	    this.value = value;
	  }

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	  
	  

}
