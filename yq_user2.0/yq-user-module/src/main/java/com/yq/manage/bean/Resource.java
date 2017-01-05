package com.yq.manage.bean;

/**
 * @author 作者: HuHua
 * @version 2016年12月17日
 * 类说明   资源表 1:n
 */
public class Resource {
		private int 			  id;			//资源id（资源根）
	 	private int     		  resourceId;	//资源子节点（0为资源根）
	    private String            resoName;		//资源名
	    private String            resoCode;		//资源代码(用于功能权限的标示)
	    private String            resoUrl;		//资源url路径
	    private Integer           resoNo;		//资源顺序（界面的显示顺序）
	    private Integer           resoLevel;	//资源级别（目前没有用到~）
	    private String            resoClass;	//资源图标
	    private int				  security;		//是否需要权限才能访问的功能资源 0是否 1是需要
	    	
	    public Resource(){
	    	
	    }
	    
		public Resource(int id, int resourceId, String resoName, String resoCode, String resoUrl,
				Integer resoNo, Integer resoLevel, String resoClass, int security ) {
			super();
			this.id = id;
			this.resourceId = resourceId;
			this.resoName = resoName;
			this.resoCode = resoCode;
			this.resoUrl = resoUrl;
			this.resoNo = resoNo;
			this.resoLevel = resoLevel;
			this.resoClass = resoClass;
			this.security = security;
		}

		

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getResourceId() {
			return resourceId;
		}

		public void setResourceId(int resourceId) {
			this.resourceId = resourceId;
		}

		public String getResoName() {
			return resoName;
		}
		public void setResoName(String resoName) {
			this.resoName = resoName;
		}
		public String getResoCode() {
			return resoCode;
		}
		public void setResoCode(String resoCode) {
			this.resoCode = resoCode;
		}
		public String getResoUrl() {
			return resoUrl;
		}
		public void setResoUrl(String resoUrl) {
			this.resoUrl = resoUrl;
		}
		public Integer getResoNo() {
			return resoNo;
		}
		public void setResoNo(Integer resoNo) {
			this.resoNo = resoNo;
		}
		public Integer getResoLevel() {
			return resoLevel;
		}
		public void setResoLevel(Integer resoLevel) {
			this.resoLevel = resoLevel;
		}
		public String getResoClass() {
			return resoClass;
		}
		public void setResoClass(String resoClass) {
			this.resoClass = resoClass;
		}

		public int getSecurity() {
			return security;
		}

		public void setSecurity(int security) {
			this.security = security;
		}

}
