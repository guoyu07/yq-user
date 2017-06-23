package com.yq.agent.thread.task;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.bean.SqlParamBean;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.game.framework.plugin.IAppPlugin;
import com.yq.agent.bo.AgentApp;
import com.yq.agent.bo.AgentOrder;
import com.yq.agent.dao.AgentAppDao;
import com.yq.agent.dao.AgentOrderDao;
import com.yq.app.utils.MacShaUtils;
import com.yq.common.utils.UrlRequestUtils;
import com.yq.common.utils.UrlRequestUtils.Mode;

public class ServiceThreadTask implements IAppPlugin{
		
	@Autowired
	private AgentAppDao agentAppDao;
	@Autowired
	private AgentOrderDao agentOrderDao;
	private static final String SUCCESS_TAG = "success";

		@Override
		public void startup() throws Exception {
			LogSystem.info("初始化app支付回调线程服务......");
			initAgentOrderBack();
		}

		public void initAgentOrderBack(){
		     Thread t = new Thread(new Runnable(){
		            public void run(){
		            	while(true) 
		                {
			            	List<AgentOrder> list = agentOrderDao.getList();
			            	LogSystem.info("app支付开始执行条目数："+list.size());
			            	for (AgentOrder agentOrder : list) {
			            		Map<String,String> paramMap = new HashMap<String,String>();
								paramMap.put("payUserName", agentOrder.getPayUserName().trim());
								paramMap.put("amount", agentOrder.getAmount()+"");
								paramMap.put("productOrder", agentOrder.getProductOrder());
								paramMap.put("order", agentOrder.getId()+"");
								paramMap.put("param", agentOrder.getParam());
								AgentApp agentApp = agentAppDao.get(new SqlParamBean("app_id", agentOrder.getAppId()));
								String signStr = agentOrder.getPayUserName()+agentOrder.getAmount()+agentOrder.getProductOrder()+agentOrder.getId()+agentOrder.getParam();
								String sign = MacShaUtils.doEncryptBase64(signStr, agentApp.getAppKey()).trim();
								paramMap.put("sign", sign);
								LogSystem.info("开启第三方app支付回调，回调签名字符串为["+signStr+"],key为["+agentApp.getAppKey()+"],签名为["+sign+"]");
								//回调
								if(!Strings.isNullOrEmpty(agentApp.getCallBackUrl())){
									String url = agentApp.getCallBackUrl();
									this.callBackThreadToAgent(url, paramMap);
								}
							}
			            	try {
								Thread.sleep(5000);
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
		                }
		            }
		            

					private void callBackThreadToAgent(String url, Map<String, String> paramMap) {
						String callBackUrl = url;
						try {
							LogSystem.log("开始第三方app支付回调请求:" + callBackUrl + ",order=" + paramMap.get("order"));
							String result = UrlRequestUtils.execute(callBackUrl, paramMap, Mode.POST);
							LogSystem.log("第三方app支付回调请求地址:" + callBackUrl + ",result=" + result);
							if (SUCCESS_TAG.equals(result)) {
								agentOrderDao.updateCallBackStatusToSuccess(Integer.valueOf(paramMap.get("order")), new Date());
								LogSystem.info("开始第三方回调成功！"+"order=" + paramMap.get("order"));
							}else{
							}
						} catch (Exception e) {
							LogSystem.error(e, "第三方回调失败！");
						}
					}});  
		        t.start();  
		
		}
		
		
		
		@Override
		public void shutdown() throws Exception {
			// TODO Auto-generated method stub
			
		}

		@Override
		public int cpOrder() {
			// TODO Auto-generated method stub
			return 0;
		}
		
	}