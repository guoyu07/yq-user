package com.yq.manage.util;

/**
 * @author 作者: HuHua
 * @version 2016年12月30日
 * 类说明 
 */
public class AdminGlobal {

	 /**
     * 当前登录用户名称
     */
    public static final String LOGIN_CURRENT_NAME               = "LOGIN_CURRENT_NAME";
    /**
     * 当前登录用户密码
     */
    public static final String LOGIN_CURRENT_PWD                = "LOGIN_CURRENT_PWD";
    /**
     * 当前登录用户
     */
    public static final String LOGIN_CURRENT_USER               = "LOGIN_CURRENT_USER";
    /**
     * 当前登录用户部门
     */
    public static final String LOGIN_CURRENT_DEPARTMENT         = "LOGIN_CURRENT_DEPARTMENT";
    /**
     * 当前登录用户角色
     */
    public static final String LOGIN_CURRENT_ROLES              = "LOGIN_CURRENT_ROLES";
    /**
     * 当前登录员工
     */
	public static final String LOGIN_CURRENT_STAFF 				= "LOGIN_CURRENT_STAFF";
	 /**
     * 当前登录员工姓名
     */
	public static final String LOGIN_CURRENT_FULLNAME 			= "LOGIN_CURRENT_FULLNAME";
	/**
	 * 当前玩家登录资源
	 * */
	public static final String LOGIN_RESOURCE 					= "LOGIN_RESOURCE";
	
	
	
	/**********************************************************************************操作功能模块**************************************************************************/
	
	/**
	 * 登录
	 * */
	public static final int LOGIN_EVENT 						= 2017;
	/**
	 * 增加资源
	 * */
	public static final int ADD_RESOURCE 						= 2018;
	/**
	 * 删除资源
	 * */
	public static final int DELET_RESOURCE 						= 2019;
	/**
	 * 增加用户
	 * */
	public static final int ADD_USER 							= 2020;
	/**
	 * 删除用户
	 * */
	public static final int DELET_USER 							= 2021;
	/**
	 * 增加部门
	 * */
	public static final int ADD_DEPARTMENT						= 2022;
	/**
	 * 删除部门
	 * */
	public static final int DELET_DEPARTMENT					= 2023;
	
	
	/**
	 * 后台vip入账充值币
	 * */
	public static final int OP_VIPCZJ							= 2024;
	/**
	 *修改vip信息
	 * */
	public static final int OP_MODIFYVIP							= 2026;
	/**
	 * 保单币转账
	 * */
	public static final int OP_BDBZZ							= 2027;
	/**
	 * 历史退户记录
	 * */
	public static final int OP_TUIHU							= 2028;
	/**
	 * 后台手动冲话费
	 * */
	public static final int OP_MOBILEFEE							= 2029;
	/**
	 * 设置为海外玩家
	 * */
	public static final int OP_SETOVERSEAS							= 2030;
	
}
