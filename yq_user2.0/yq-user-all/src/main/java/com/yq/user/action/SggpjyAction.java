package com.yq.user.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.ProblemCode;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Gpjy;
import com.yq.user.service.UserService;

public class SggpjyAction extends ALDAdminPageActionSupport<Gpjy> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@ProblemCode
	public String execute(){
		
		/**
		 * <%
		Dim StrSQL, rsTest
		Set rsTest = server.CreateObject("ADODB.Recordset")
		StrSQL = "SELECT * FROM gpjy where Now()>dqdate+0.0006 and jy=2"
		rsTest.Open StrSQL, Conn2,2,3
		While Not rsTest.EOF
		rsTest("jy")=0
		rsTest.MoveNext
		Wend
		rsTest.UpdateBatch
		%>
		 */
		
		UserService userService = ServiceCacheFactory.getServiceCache().getService(UserService.class);
		
		super.initPage(userService.getAllGpjyDetailsPageList(super.getUserName(), super.getToPage(), 15));
		
		return SUCCESS;
	}

}
