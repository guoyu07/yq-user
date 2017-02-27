package com.yq.user.constant;

public class YbChangeType {

	public static final int AGENT_REDUCE 		= 1000;		//第三方代理商减少
	
	
	public static final int MALL_BUY_RATION 	= 1001;		//商城买家缴纳的税
	
	public static final int MALL_SALE_RATION 	= 1002;		//商城卖家缴纳的税
	
	public static final int SHOP_TEMP 			= 1003;		//商城卖家临时存放的钱
	
	
	public static final int SHOP_SALE_ADD 		= 1004;		//商城卖家卖出商品获得yb
	
	public static final int SHOP_SALE_ADD_SELF 	= 1005;		//商城卖家卖出商品获得yb  zxz888自己商家卖出商品
	
	public static final int TRANSFER_TO_BDB = 1006;        //大vip转成备用报单币
	
	
	public static final int SHOP_TEMP_REDUCE 	= 2001;		//商城临时账号转账给商家货物YB数
	
	public static final int ADMIN_ORDER_CANCEL 	= 2007;		//管理员撤销获得
	
	public static final int ADMIN_ORDER_RESET 	= 2008;		//管理员重置订单

	/**
	 * 系统(一币补贴)
	 */
	public static final int SYSTEM_BUTIE = 100;


	/**
	 * 系统提现退回
	 */
	public static final int SYSTEM_TIXIANTUIHUI = 101;
	
	/**
	 * TODO 系统充值
	 */
	public static final int SYSTEM_CHONZHI = 102;	
	
	/**
	 * 平衡奖
	 */
	public static final int  BALANCE_AWARD = 103;
	
	/**
	 * 减回平衡奖
	 */
	public static final int  BALANCE_AWARD_REDUCE = 104;
	
	/**
	 * 辅导奖
	 */
	public static final int  COUNSELING_AWARD = 105;
	
	/**
	 * 减回辅导奖
	 */
	public static final int  COUNSELING_AWARD_REDUCE = 106;
	
	/**
	 * TODO 消费（目前有一条是增加金币的）
	 */
	public static final int  CONSUMPTION=107;
	
	/**
	 * 卖出积分所得
	 */
	public static final int  JF_SELL = 108;
	
	
	/**
	 * 开户消耗
	 */
	public static final int  KAIHU_REDUCE = 109;
	
	
	/**
	 * 撤销一币卖出
	 */
	public static final int  YBSALE_CANCLE = 110;
	
	/**
	 * 卖出一币
	 */
	public static final int  YBSALE = 111;
	
	/**
	 * 爱心捐赠
	 */
	public static final int DONATEYB = 112;
	
	/**
	 * 自助购卡
	 */
	public static final int SELFHELPBYCARD = 113;
	
	/**
	 * 激活金币卡
	 */
	public static final int ACTIVITYJBCARD = 114;
	
	
	/**
	 * 
	 * 消费一币(系统):
		<option value="报单支出">报单</option>
		<option value="消费支出">消费</option>
		<option value="转户">转户</option>
		<option value="培训费">培训费</option>
		<option value="培训费">门票费</option>
		<option value="培训费">杂志费</option>
		<option value="商城业务">商城业务</option>
		<option value="报纸费">报纸费</option>
		<option value="提车手续费">提车手续费</option>
		<option value="爱心捐助">爱心捐助</option>
		<option value="培训餐费">培训餐费</option>
		<option value="-1">自定义</option>
	*/
	public static final int SYSTEM_CONSUMEYB = 115;

	/**
	 * app支付
	 * 
	 * */
	public static final int APPUSE = 116;

	/**
	 * 客服给玩家充值保单币
	 * */
	public static final int CUSTOMSERVICERECHARGETOUSER = 117;

	/**
	 * 转给同名账户
	 * */
	public static final int ZHUANCHU_SAMENAME = 118;
	
	/**
	 * 收到同名账户
	 * */
	public static final int ZHUANRU_SAMENAME = 119;

	/**
	 * 竞猜投注
	 * */
	public static final int GUESSBETTING = 120;

	/**
	 * 产品抢购
	 * */
	public static final int PRODUCTBUY = 121;

	/**
	 * 退款
	 **/
	public static final int MALLTUIKUAN = 122;
	
	/**
	 * 冲销销售一币
	 **/
	public static final int MALLHUANKUAN = 123;


	/**
	 * 购买金币卡
	 * */
	public static final int BUYJBCARD = 124;

	/**
	 * 商户使用
	 * */
	public static final int SHANGHUUSE = 125;

	/**
	 * 商户获得
	 * */
	public static final int SHANGHUHUODE = 126;

	/**
	 * vip给下属充值
	 * */
	public static final int VIPDOWNRECHARGE = 127;

	/**
	 * TODO 商城获得
	 * */
	public static final int MALLHUODE = 128;

	/**
	 * 换购
	 * */
	public static final int HUANGOU = 129;

	/**
	 * 商户消费
	 * */
	public static final int MALL_BUY_TAX_300FHK = 130;
	
	/**
	 * 卖家收税
	 * */
	public static final int MALLPAY = 131;

	/**
	 * 卖家收税账户获得
	 * */
	public static final int MALL_BUY_TAX = 132;


	/**
	 * 购物卖家手续费
	 * */
	public static final int MALL_ZXZ888 = 133;
	
	/**
	 * 购物临时存放
	 * */
	public static final int MALL_ZXZ888A = 134;

	/**
	 * 卖出商品付款给商家
	 * */
	public static final int MALL_ZXZ888A_USE = 135;

	/**
	 * 商场卖出商品
	 * */
	public static final int MALL_SALEHUODE = 136;

	/**
	 * 购买机票消耗
	 * */
	public static final int BUYTICKET = 137;

	/**
	 * 话费充值
	 * */
	public static final int RECHARGEHUAFEI = 138;

	/**
	 * 口才训练营报名
	 * */
	public static final int TRAIN_ELOQUENCE = 139;

	/**
	 * 销售一币（备用）
	 * */
	public static final int VIP_RECHARGEBAODANBI = 140;
	
	/*promotion_award=推广奖
	balance_award=平衡奖
	counseling_award=辅导奖
	JF_sell=积分卖出
	subscription=认购
	namesake_Huzhuan=同名互转
	VIP_transfer_income=VIP转收
	management_transfer_income=管理转收
	changes_in_management=管理增减
	redemption = 换购
	commodity_revenues=商品收入
	consumption=消费
	ticket_expenditure=票务支出
	business_income=商户收入*/
	
	/**
	 * 开户获得
	 */
	public static final int  KAIHU_ADD = 141;
	
	
	/**
	 * 销售一币
	 * */
	public static final int ZHUANCHU = 142;
	
	/**
	 * 转入（认购一币&服务中心）
	 * */
	public static final int ZHUANRU = 143;
	
	/**
	 * 认购一币
	 * 
	 * */
	public static final int RENGOUYB = 144;

	/**
	 * 系統回收
	 * 
	 */
	public static final int SYSRECYCLE = 145;
	
	/**
	 * 
	 * 消费一币获得(系统):
		<option value="报单支出">报单</option>
		<option value="消费支出">消费</option>
		<option value="转户">转户</option>
		<option value="培训费">培训费</option>
		<option value="培训费">门票费</option>
		<option value="培训费">杂志费</option>
		<option value="商城业务">商城业务</option>
		<option value="报纸费">报纸费</option>
		<option value="提车手续费">提车手续费</option>
		<option value="爱心捐助">爱心捐助</option>
		<option value="培训餐费">培训餐费</option>
		<option value="-1">自定义</option>
	*/
	public static final int SYSTEM_CONSUMEYB_ADD = 146;
	
	/**
	 * 
	 * 月分红
	 * 
	 * */
	public static final int MONTH_SHAREMONEY = 99; 


	/**
	 * 
	 * 购买机票转入
	 * 
	 * */
	public static final int BUYTICKETGETYB = 147;
	
	/**
	 * 退户减推荐奖励
	 */
	public static final int SYSTEM_BACK_PRICE = 148;
	
	
}
