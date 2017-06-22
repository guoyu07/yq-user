package com.yq.app.vip.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.module.web.action.BaseActionSupport;
import com.yq.common.action.ALDAdminActionSupport;

public class JsonBaseActionSupport extends ALDAdminActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static final String JSON = "json";
	
	private static final int DEFAULT_SUCCESS_CODE = 0;
	
	private static final int DEFAULT_ERROR_CODE = -1;
	
	private Map<String,Object> dataMap = new HashMap<String,Object>();

	public JsonBaseActionSupport(){
		this.setErrorResult(JSON);
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	/**
	 * 杩斿洖鎴愬姛鐨勫璞℃秷鎭�
	 * @param o
	 */
	public <T> String renderObjectResult(T o){
		dataMap.put("flag", DEFAULT_SUCCESS_CODE);
		dataMap.put("msg", "success");
		dataMap.put("rc",o);
		return JSON;
	}
	
	/**
	 * 杩斿洖鎴愬姛鐨勫璞℃秷鎭�
	 * @param o
	 */
	public <T> String renderPageResult(IPage<T> page){
		dataMap.put("flag", DEFAULT_SUCCESS_CODE);
		dataMap.put("msg", "success");
		dataMap.put("totalSize",page.getTotalSize());
		dataMap.put("totalPage", page.getTotalPage());
		dataMap.put("currentPage", page.getCurrentPage());
		dataMap.put("pageSize", page.getPageSize());
		dataMap.put("rc",page.getData());
		return JSON;
	}
	
	/**
	 * 杩斿洖鎴愬姛鐨刱ey value娑堟伅
	 * @param o
	 */
	public <T> String renderKeyValueResult(String key,Object value){
		dataMap.put("flag", DEFAULT_SUCCESS_CODE);
		dataMap.put("msg", "success");
		Map<String,Object>  o = new HashMap<String,Object>();
		o.put(key, value);
		dataMap.put("rc",o);
		return JSON;
	}
	/**
	 * 杩斿洖鎴愬姛鐨勫垪琛ㄦ秷鎭�
	 * @param o
	 */
	public <T> String renderListResult(List<T> o){
		dataMap.put("flag", DEFAULT_SUCCESS_CODE);
		dataMap.put("msg", "success");
		dataMap.put("rc",o);
		return JSON;
	}
	/**
	 * 閿欒娑堟伅
	 * @param msg
	 */
	public String renderErrorResult(String msg){
		dataMap.put("flag", DEFAULT_ERROR_CODE);
		dataMap.put("msg",msg);
		return JSON;
	}
	/**
	 * 閿欒娑堟伅  鎸囧畾flag
	 * @param msg
	 */
	public String renderErrorResult(int code,String msg){
		dataMap.put("flag", code);
		dataMap.put("msg",msg);
		return JSON;
	}
    /**
     * 娌℃湁杩斿洖鍙傛暟鐨勬垚鍔熸秷鎭�
     */
	public String renderSuccessResult(){
		dataMap.put("flag", DEFAULT_SUCCESS_CODE);
		dataMap.put("msg","sucess");
		return JSON;
	}
}
