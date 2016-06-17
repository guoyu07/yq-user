package com.yq.user.bean;

import java.util.Map;

import com.yq.common.utils.UrlRequestUtils;

public class CallBackMsgBean {
	private String url;
	private Map<String,String> paramMap;
	private String mode;
	private int retryTimes;
	private String successTag;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Map<String, String> getParamMap() {
		return paramMap;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public void setParamMap(Map<String, String> paramMap) {
		this.paramMap = paramMap;
	}
	
	public int getRetryTimes() {
		return retryTimes;
	}
	public void setRetryTimes(int retryTimes) {
		this.retryTimes = retryTimes;
	}
	
	public void increaseRetryTimes(){
		retryTimes++;
	}
	/**
	 * @param url
	 * @param paramMap
	 * @param mode
	 * @param successTag
	 */
	public CallBackMsgBean(String url, Map<String, String> paramMap, String mode, String successTag) {
		super();
		this.url = url;
		this.paramMap = paramMap;
		this.mode = mode;
		this.successTag = successTag;
	}
	@Override
	public String toString() {
		return "CallBackMsgBean [url=" + url + ", paramMap=" + UrlRequestUtils.buildURL("", paramMap) + ", mode=" + mode + ", retryTimes="
				+ retryTimes + ", successTag=" + successTag + "]";
	}
	public String getSuccessTag() {
		return successTag;
	}
	public void setSuccessTag(String successTag) {
		this.successTag = successTag;
	}
}
