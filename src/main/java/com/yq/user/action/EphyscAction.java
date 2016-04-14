package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.ProblemCode;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gcuser;
import com.yq.user.bo.Txpay;
import com.yq.user.service.UserService;

public class EphyscAction extends ALDAdminPageActionSupport<Txpay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		@ProblemCode
		/**查询的时候有这么一段代码  不知道是不是有问题的
		 * <%
			'if username="15880805512" then
			   'response.redirect "epjysc_qz.asp"
			'end if
			Dim StrSQL, rsTest
			Set rsTest = server.CreateObject("ADODB.Recordset")
			StrSQL = "SELECT * FROM txpay where payonoff = '尚未转账' and kjygid=0 and Now()>rgdate+0.001 "
			rsTest.Open StrSQL, Conn1,2,3
			While Not rsTest.EOF
			rsTest("ep")=0
			rsTest("kjygid")=0
			rsTest.MoveNext
			Wend
			rsTest.UpdateBatch
			rsTest.close
			Set rsTest=Nothing
			%>
		 */
		 
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		Gcuser gcuser = userService.getUserByUserName(super.getUserName());
		if(gcuser.getVip()==0){
			super.setErroCodeNum(1);//alert('请您联系您地区的VIP服务中心，谢谢！');
			return SUCCESS;
		}
		super.initPage(userService.getTxpayPage(0, 10));
		LogSystem.warn("[进入市场]["+super.getUserName()+"]["+super.ip()+"]");
		return SUCCESS;
	}

}
