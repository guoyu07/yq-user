package com.yq.user.bo;

/**
 * @author 作者: HuHua
 * @version 2016年11月14日
 * 类说明  玩家属性记录，如需新增扩展字段，在此类增加相关属性即可
 */
public class UserProperty {
	
	private int id;
	
	private String username;	//用户名
	
	private int region_code;	//国际区域码...
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getRegion_code() {
		return region_code;
	}

	public void setRegion_code(int region_code) {
		this.region_code = region_code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	

}
