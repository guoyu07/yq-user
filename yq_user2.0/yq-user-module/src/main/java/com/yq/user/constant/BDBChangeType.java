package com.yq.user.constant;

public class BDBChangeType {
	
	/**
	 * 转错减除
	 * */
	public static final int BDB_ZUANCUO_SYSTEM_REDUCE = 3000;  //转错减除
	
	/**
	 * 转错增加
	 * */
	public static final int BDB_ZUANCUO_SYSTEM_ADD = 3001;  //转错增加
	
	/**
	 * VIP充值错误转回减除
	 * */
	public static final int BDB_ZUANCUO_SYSTEM_VIPRECHARGE_REDUCE = 3002;  //VIP充值错误转回
	
	/**
	 * VIP充值错误转回增加
	 * */
	public static final int BDB_ZUANCUO_SYSTEM_VIPRECHARGE_ADD = 3003;  //VIP充值错误转回
	
	/**
	 * 宿舍押金减除
	 * */
	public static final int BDB_ZUANCUO_SYSTEM_DEPOSIT_REDUCE = 3004;  
	
	/**
	 * 宿舍押金增加
	 * */
	public static final int BDB_ZUANCUO_SYSTEM_DEPOSIT_ADD = 3005;  
	
	/**
	 * 保单币批量转入
	 * */
	public static final int TRASFERBDB_ADD = 3006;
	
	/**
	 * 保单币批量转出
	 * */
	public static final int TRASFERBDB_REDUCE = 3007;


}
