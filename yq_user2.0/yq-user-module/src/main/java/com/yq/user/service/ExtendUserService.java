package com.yq.user.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr178.game.framework.exception.ServiceException;
import com.yq.common.utils.BigDecimalUtil;
import com.yq.common.utils.DateStyle;
import com.yq.common.utils.DateUtils;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Datepay;
import com.yq.user.bo.Fcxt;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Gpjy;
import com.yq.user.constant.GpjyChangeType;
import com.yq.user.constant.YbChangeType;
import com.yq.user.dao.FcxtDao;
import com.yq.user.dao.GcuserDao;
import com.yq.user.dao.GpjyDao;

public class ExtendUserService {

	
	  	@Autowired
		private GcuserDao gcuserDao;
	    @Autowired
	    private LogService logService;
	    @Autowired
	    private ManagerService managerService;
	    @Autowired
	    private GpjyDao gpjyDao;
	    @Autowired
	    private FcxtDao fcxtDao;
		
		/**
		 * 自动积分卖出,正常流程
		 * 
		 * @param userName
		 * 
		 * @param gpjy1  订单
		 */
		@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=ServiceException.class)
		public int automcJf(String userName,Gpjy gpjy1, int saleCount){
			Gcuser gcuser = gcuserDao.getUser(userName);
			int id= gpjy1.getId();
			
			
			double dqpay92 = (0.9 * gpjy1.getJypay());
			int dqpay = (int) (dqpay92 * 1 + 0.1);
			double mc70a = 0.7 * dqpay;
			int mc70 = (int) (mc70a * 1 + 0.1);
			double mc30a = 0.3 * dqpay;
			int mc30 = (int) (mc30a * 1 + 0.1);
			
			//扣除积分
			if (!useUserItem(userName, "积分", gpjy1.getMysl().intValue())) {
				throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
			}

			//增加一币
			if(!giveUserItem(userName, "一币", mc70)){
				throw new ServiceException(3000, "未知錯誤");
			};
			
			//增加金币
			if(!giveUserItem(userName, "金币", mc30)){
				throw new ServiceException(3000, "未知錯誤");
			};

			//卖出者获得积分
			if (!giveUserItem(gpjy1.getUsername(),"积分", gpjy1.getMysl().intValue())){
				throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
			};
	        Gcuser dfuser = gcuserDao.getUser(gpjy1.getUsername());
	        
	        
			if (!gpjyDao.updateBuySuccess(id, userName, "买入成功",dfuser.getJyg(),gpjy1.getPay(),gpjy1.getMysl(),gpjy1.getJypay())) {
				gpjyDao.cleanCache(id);
				throw new ServiceException(3000, "未知錯誤");
			}
			gpjyDao.deleteIndex(id);
			
			
			gcuser = gcuserDao.getUser(userName);
			
			//增加卖出者记录
			Gpjy gpjy = new Gpjy();
			gpjy.setUsername(userName);
			gpjy.setMcsl(gpjy1.getMysl());
			gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
			gpjy.setPay(gpjy1.getPay());
			gpjy.setJypay(gpjy1.getJypay());
			gpjy.setAbdate(gpjy1.getAbdate());
			gpjy.setBz("卖出成功");
			gpjy.setCgdate(new Date());
			gpjy.setJy(1);
			gpjy.setDfuser(gpjy1.getUsername());
			gpjyDao.add(gpjy);

			String mydj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

			Datepay datePay1 = new Datepay();
			datePay1.setUsername(userName);
			datePay1.setSyjz(mc70);
			datePay1.setPay(gcuser.getPay());
			datePay1.setJydb(gcuser.getJydb());
			datePay1.setJyjz(mc30);
			datePay1.setRegid("卖出" + gpjy1.getMysl() + "积分单价" + mydj + "到" + gpjy1.getUsername());
			datePay1.setAbdate(new Date());
			datePay1.setOrigintype(YbChangeType.JF_SELL);
			logService.addDatePay(datePay1);
			String d = DateUtils.DateToString(gpjy1.getCgdate(), DateStyle.YYYY_MM_DD_HH_MM_SS);
			String dStr = d==null?"":d;
			logService.updateRegId(gpjy1.getJyid(), dStr+"支出成功到" + userName + "-积分" + gpjy1.getMysl() + "-单价" + mydj);
			fcxtDao.update(2, gpjy1.getMysl().intValue());
			double currentPrice = managerService.getCurrentyPrice(); //查詢當前價格
			if(gpjy1.getNewjy()!=GpjyChangeType.BUY_BY_SYSTEM){
				return (int) (saleCount-gpjy1.getJypay()/currentPrice);
			}else{
				return saleCount-gpjy1.getMysl().intValue();
			}
				 
		}
		
		
		/**
		 * 
		 * 修改卖出积分交易
		 * 
		 * @param userName
		 * 
		 * @param gpjy1  订单
		 * 
		 * @param saleCount 卖出数量
		 * 
		 * */
		@Transactional(propagation=Propagation.REQUIRES_NEW)
		public int changemcJf(String userName, Gpjy gpjy1, int saleCount) {
			int id = gpjy1.getId();
			checkJfIsOpen();
			Gcuser gcuser = gcuserDao.getUser(userName);
			
			double currentPrice = managerService.getCurrentyPrice(); //查詢當前價格
			double needJb = (int)(Math.ceil(BigDecimalUtil.multiply(currentPrice,saleCount)));

			
			
			double dqpay92 = (0.9 * needJb);
			int dqpay = (int) (dqpay92 * 1 + 0.1);
			double mc70a = 0.7 * dqpay;
			int mc70 = (int) (mc70a * 1 + 0.1);
			double mc30a = 0.3 * dqpay;
			int mc30 = (int) (mc30a * 1 + 0.1);

			//扣除积分
			if(!useUserItem(userName, "积分", saleCount)){
				throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
			}
			
			//获得一币
			if(!giveUserItem(userName, "一币", mc70)){
				throw new ServiceException(3000,"未知错误！");
			}
			
			//增加金币
			if(!giveUserItem(userName, "金币", mc30)){
				throw new ServiceException(3000,"未知错误！");
			}

			
			//发布买入者获得积分
			if(!giveUserItem(gpjy1.getUsername(),"积分", saleCount)){
				throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
			}
			
			
			//更新订单
			if(!gpjyDao.updateBuyJf(id, saleCount,needJb)){
				throw new ServiceException(9,"您好，您卖出数量不能大于您剩余数量  ，谢谢！");
			}
			
			//修改买卖索引交易数量
			gpjyDao.updateIndexCount(id, saleCount);

			

			gcuser = gcuserDao.getUser(userName);
			
			
			
			
			//记录日志
			Gpjy gpjy = new Gpjy();
			gpjy.setUsername(userName);
			gpjy.setMcsl((double) saleCount);
			gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
			gpjy.setPay(gpjy1.getPay());
			gpjy.setJypay(needJb);
			gpjy.setAbdate(gpjy1.getAbdate());
			gpjy.setBz("卖出成功");
			gpjy.setCgdate(new Date());
			gpjy.setJy(1);
			gpjy.setDfuser(gpjy1.getUsername());
			gpjyDao.add(gpjy);
			
			
		

			String mydj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

			Datepay datePay1 = new Datepay();
			datePay1.setUsername(userName);
			datePay1.setSyjz(mc70);
			datePay1.setPay(gcuser.getPay());
			datePay1.setJydb(gcuser.getJydb());
			datePay1.setJyjz(mc30);
			datePay1.setRegid("卖出" + saleCount + "积分单价" + mydj + "到" + gpjy1.getUsername());
			datePay1.setAbdate(new Date());
			datePay1.setOrigintype(YbChangeType.JF_SELL);
			logService.addDatePay(datePay1);
			
			Gcuser gcuser2 = gcuserDao.getUser(gpjy1.getUsername());
			// 记录日志
			Gpjy gpjy2 = new Gpjy();
			gpjy2.setUsername(gpjy1.getUsername());
			gpjy2.setMysl((double) saleCount);
			gpjy2.setSysl(Double.valueOf(gcuser2.getJyg()));
			gpjy2.setPay(gpjy1.getPay());
			gpjy2.setJypay(needJb);
			gpjy2.setAbdate(gpjy1.getAbdate());
			gpjy2.setBz("买入成功");
			gpjy2.setCgdate(new Date());
			gpjy2.setJy(1);
			gpjy2.setDfuser(userName);
			gpjyDao.add(gpjy2);
			
			
			String d = DateUtils.DateToString(gpjy1.getCgdate(), DateStyle.YYYY_MM_DD_HH_MM_SS);
			String dStr = d==null?"":d;
			logService.updateRegId(gpjy1.getJyid(), dStr+"支出成功到" + userName + "-积分" + saleCount + "-单价" + mydj);
			//logService.updateNumberId(gpjy1.getJyid(),needJb);
			
			//XXX 新增日志
			Datepay datePay2 = new Datepay();
			datePay2.setUsername(gpjy1.getUsername());
			datePay2.setDbjc((int) needJb);
			datePay2.setPay(gcuser2.getPay());
			datePay2.setJydb(gcuser2.getJydb());
			datePay2.setRegid("买入" + userName + "-积分" + saleCount + "-单价" + mydj);
			datePay2.setAbdate(new Date());
			logService.addDatePay(datePay2);
			
			fcxtDao.update(2, saleCount);
			
			return 0;
			
			
		}
	
		private void checkJfIsOpen(){
			if(AdminService.isClose){
				throw new ServiceException(1860,"系统已关闭！请稍后再操作！");
			}
		}
		
		/**
		 * 
		 * 使用玩家物品（对于玩家一币，金币，积分等扣除）
		 * 
		 *@param  userName 用户名
		 *
		 *@param  item  玩家物品（一币（参数可以为："yibi","一币","pay"），金币（参数可以为："jinbi","金币","jydb"），积分（参数可以为："jifen","积分","jyg"）等）
		 *
		 *@param  number 物品数量
		 *
		 * */
		
		public boolean useUserItem(String userName, String item, int number) {
			if(item.equals("yibi") || item.equals("一币") || item.equals("pay")){
				return  gcuserDao.reduceYb(userName, number);
			}else if(item.equals("jinbi") || item.equals("金币") || item.equals("jydb")){
				return  gcuserDao.reduceOnlyJB(userName, number);
			}else if(item.equals("jifen") || item.equals("积分") || item.equals("jyg")){
				return  gcuserDao.updateJyg(userName, number);
			}
			return false;
		}
		
		/**
		 * 
		 * 玩家获得物品（对于玩家一币，金币，积分等获得）
		 * 
		 *@param  userName 用户名
		 *
		 *@param  item  玩家物品（一币（参数可以为："yibi","一币","pay"），金币（参数可以为："jinbi","金币","jydb"），积分（参数可以为："jifen","积分","jyg"）等）
		 *
		 *@param  number 物品数量(大于0的数)
		 *
		 * */
		
		public boolean giveUserItem(String userName, String item, int number) {
			if(item.equals("yibi") || item.equals("一币") || item.equals("pay")){
				return gcuserDao.addWhenOtherPersionBuyJbCard(userName, number);
			}else if(item.equals("jinbi") || item.equals("金币") || item.equals("jydb")){
				return gcuserDao.addOnlyJB(userName, number);
			}else if(item.equals("jifen") || item.equals("积分") || item.equals("jyg")){
				return gcuserDao.updateJyg(userName, -number);
			}
			return false;
		}


		/**
		 * 自动买入积分（正常流程）
		 * @param userName
		 * @param gpjy 买入积分订单
		 * @return 
		 */
		@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=ServiceException.class) 
		public int automrJf(String userName,Gpjy gpjy1, int buycount){
			
			Gcuser gcuser = gcuserDao.getUser(userName);
			int id= gpjy1.getId();
			
			//扣除玩家金币
			if (!useUserItem(userName, "金币", gpjy1.getJypay().intValue())) {
				throw new ServiceException(2,"金币不足，请检查输入是否正确！");
			}

			//获得积分
			if (!giveUserItem(userName, "积分", gpjy1.getMcsl().intValue())) {
				throw new ServiceException(3000, "未知错误");
			}

			if (!gpjyDao.updateSaleSuccess(id, userName, "卖出成功",gpjy1.getMcsl())) {
				gpjyDao.cleanCache(id);
				throw new ServiceException(3000, "未知错误");
			}
			
			
			gpjyDao.deleteIndex(id);

			gcuser = gcuserDao.getUser(userName);
			Gpjy gpjy = new Gpjy();
			gpjy.setUsername(userName);
			gpjy.setMysl(gpjy1.getMcsl());
			gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
			gpjy.setPay(gpjy1.getPay());
			gpjy.setJypay(gpjy1.getJypay());
			gpjy.setBz("买入成功");
			gpjy.setCgdate(new Date());
			gpjy.setJy(1);
			gpjy.setDfuser(gpjy1.getUsername());
			gpjyDao.add(gpjy);

			String mcdj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

			Datepay datePay1 = new Datepay();
			datePay1.setUsername(userName);
			datePay1.setDbjc(gpjy1.getJypay().intValue());
			datePay1.setPay(gcuser.getPay());
			datePay1.setJydb(gcuser.getJydb());
			datePay1.setRegid("买入" + gpjy1.getUsername() + "-积分" + gpjy1.getMcsl() + "-单价" + mcdj);
			datePay1.setAbdate(new Date());
			logService.addDatePay(datePay1);

			double dqpay92 = (0.9 * gpjy1.getJypay());
			int dqpay = (int) (dqpay92 * 1 + 0.1);
			double mc70a = 0.7 * dqpay;
			int mc70 = (int) (mc70a * 1 + 0.1);
			double mc30a = 0.3 * dqpay;
			int mc30 = (int) (mc30a * 1 + 0.1);

			if (!giveUserItem(gpjy1.getUsername(),"一币", mc70)){
				throw new ServiceException(3000, "未知错误");
			};
			if(!giveUserItem(gpjy1.getUsername(),"金币", mc30)){
				throw new ServiceException(3000, "未知错误");
			};
			if(!gcuserDao.reduceStopjyg(gpjy1.getUsername())){
				throw new ServiceException(3000, "未知错误");
			};

			Gcuser gcuser2 = gcuserDao.getUser(gpjy1.getUsername());
			Datepay datePay2 = new Datepay();
			datePay2.setUsername(gpjy1.getUsername());
			datePay2.setSyjz(mc70);
			datePay2.setPay(gcuser2.getPay());
			datePay2.setJydb(gcuser2.getJydb());
			datePay2.setJyjz(mc30);
			datePay2.setRegid("卖出" + gpjy1.getMcsl() + "积分单价" + mcdj + "到" + userName);
			datePay2.setAbdate(new Date());
			datePay2.setOrigintype(YbChangeType.JF_SELL);
			logService.addDatePay(datePay2);

			fcxtDao.update(2,gpjy1.getMcsl().intValue());
			
			return buycount - gpjy1.getMcsl().intValue();
			 
		}

		/**
		 * 改变买入积分 此处需要处理两个行为：1、买入成功后的记录，2、买入后卖出订单的剩余数量作为新增卖出积分的一个订单
		 * 
		 * @param userName
		 * 
		 * @param gpjy1  买入积分订单
		 * 
		 * @param buyCount 卖出数量  
		 */
		@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=ServiceException.class) 
		public int changemrJf(String userName,Gpjy gpjy1,int buyCount){
			Gcuser gcuser = gcuserDao.getUser(userName);
			int id = gpjy1.getId();
			
			Fcxt fcxt = managerService.getFcxtById(2);
			
			double needJb = Math.ceil(BigDecimalUtil.multiply(fcxt.getJygj(), buyCount));
			
			//扣除用户金币
			if(!useUserItem(userName, "金币", (int) needJb)){
				throw new ServiceException(1, "金币不足！");
			}
			

			//获得积分
			if(!giveUserItem(userName, "积分", buyCount)){
				throw new ServiceException(3000, "未知错误");
			}

			//修改卖出交易
			if(!gpjyDao.updateSaleJf(gpjy1.getId(), buyCount)){
				throw new ServiceException(3000, "未知错误");
			}
			
			
			//修改交易买卖索引
			gpjyDao.updateIndexCount(id,buyCount);

			
			
			gcuser = gcuserDao.getUser(userName);
			
		
			
			//增加一条购买成功的记录（作为买入数量的）
			Gpjy gpjy = new Gpjy();
			gpjy.setUsername(userName);
			gpjy.setMysl((double) buyCount);
			gpjy.setSysl(Double.valueOf(gcuser.getJyg()));
			gpjy.setPay(gpjy1.getPay());
			gpjy.setJypay(needJb);
			gpjy.setBz("买入成功");
			gpjy.setCgdate(new Date());
			gpjy.setJy(1);
			gpjy.setDfuser(gpjy1.getUsername());
			gpjyDao.add(gpjy);

			String mcdj = gpjy1.getPay() < 1 ? "0" + gpjy1.getPay() : "" + gpjy1.getPay();

			//记录买入者日志
			Datepay datePay1 = new Datepay();
			datePay1.setUsername(userName);
			datePay1.setDbjc((int) needJb);
			datePay1.setPay(gcuser.getPay());
			datePay1.setJydb(gcuser.getJydb());
			datePay1.setRegid("买入" + gpjy1.getUsername() + "-积分" + buyCount + "-单价" + mcdj);
			datePay1.setAbdate(new Date());
			logService.addDatePay(datePay1);

			double dqpay92 = (0.9 * needJb);
			int dqpay = (int) (dqpay92 * 1 + 0.1);
			double mc70a = 0.7 * dqpay;
			int mc70 = (int) (mc70a * 1 + 0.1);
			double mc30a = 0.3 * dqpay;
			int mc30 = (int) (mc30a * 1 + 0.1);

			if(!giveUserItem(gpjy1.getUsername(),"一币", mc70)){
				throw new ServiceException(3000, "未知错误");
			}
			if(!giveUserItem(gpjy1.getUsername(),"金币", mc30)){
				throw new ServiceException(3000, "未知错误");
			}
			if(!gcuserDao.reduceStopjyg(gpjy1.getUsername())){
				throw new ServiceException(3000, "未知错误");
			}

			Gcuser gcuser2 = gcuserDao.getUser(gpjy1.getUsername());
			//记录卖出者日志
			Datepay datePay2 = new Datepay();
			datePay2.setUsername(gpjy1.getUsername());
			datePay2.setSyjz(mc70);
			datePay2.setPay(gcuser2.getPay());
			datePay2.setJydb(gcuser2.getJydb());
			datePay2.setJyjz(mc30);
			datePay2.setRegid("卖出" + buyCount + "积分单价" + mcdj + "到" + userName);
			datePay2.setAbdate(new Date());
			datePay2.setOrigintype(YbChangeType.JF_SELL);
			logService.addDatePay(datePay2);

			//增加一条卖出成功的记录（作为卖出数量的）
			Gpjy gpjy2 = new Gpjy();
			gpjy2.setUsername(gpjy1.getUsername());
			gpjy2.setMcsl((double) buyCount);
			gpjy2.setSysl(Double.valueOf(gcuser2.getPay()));
			gpjy2.setPay(gpjy1.getPay());
			gpjy2.setJypay(needJb);
			gpjy2.setBz("卖出成功");
			gpjy2.setCgdate(new Date());
			gpjy2.setJy(1);
			gpjy2.setDfuser(userName);
			gpjyDao.add(gpjy2);

			
			fcxtDao.update(2,buyCount);
			
			return 0;
			 
		}

}
