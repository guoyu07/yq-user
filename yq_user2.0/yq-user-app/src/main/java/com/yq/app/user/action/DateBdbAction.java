package com.yq.app.user.action;

import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.yq.common.ProblemCode;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.user.bo.Bdbdate;
import com.yq.user.service.LogService;

public class DateBdbAction extends ALDAdminPageActionSupport<Bdbdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int type;
	
	private int status;
	public String execute(){
		
		@ProblemCode
//		<%
//		Dim StrSQL,rsTest
//		Set rsTest = server.CreateObject("ADODB.Recordset")
//		StrSQL = "SELECT * FROM txpay where ep=1 and Now()>rgdate "
//		rsTest.Open StrSQL,Conn1,2,3
//		While Not rsTest.EOF
//		if rsTest("payonoff")="尚未转账" and rsTest("dfuser")<>"" then
//		set rst = Server.CreateObject("ADODB.Recordset")
//		sqlt ="select * from gpjy where username ='"&rsTest("dfuser")&"' and dfuser='"&rsTest("payid")&"' "
//		rst.open sqlt,conn2,2,3
//		if not rst.eof then
//		set rsk = Server.CreateObject("ADODB.Recordset")
//		sqlk ="select * from gcuser where username ='"&rsTest("dfuser")&"' "
//		rsk.open sqlk,conn2,2,3
//		if rsk("cxt")-1=3 then
//		cxday=7
//		elseif rsk("cxt")-1=2 then
//		cxday=14
//		elseif rsk("cxt")-1=1 then
//		cxday=21
//		elseif rsk("cxt")-1<1 then
//		cxday=60
//		else
//		cxday=0
//		end if
//		   rsk("cxt")=rsk("cxt")-1
//		   rsk("cxdate")=date()+cxday
//		   rsk.update
//		   rsTest("ep")=0
//		   rsTest("rgdate")=abcd
//		   rsTest("dfuser")=""
//		   rsTest("kjygid")=0
//		   rsTest.update
//		   rst("bz")="超时未付款-并扣一诚信星-余"&rsk("cxt")
//		   rst("dfuser")=""&rst("dfuser")&"-"&rsTest("payusername")
//		   rst("cgdate")=Now()
//		   rst("newjy")=0
//		   rst.Update
//		end if
//		end if
//		rsTest.MoveNext
//		Wend
//		rsTest.UpdateBatch
//		%>
//		<%
//		Dim StrSQL_qr,rs_qr
//		Set rs_qr = server.CreateObject("ADODB.Recordset")
//		StrSQL_qr = "SELECT * FROM txpay where ep=2 and Now()>rgdate and clip<>'已扣' "
//		rs_qr.Open StrSQL_qr,Conn1,2,3
//		While Not rs_qr.EOF
//		if rs_qr("payonoff")="尚未转账" and rs_qr("dfuser")<>"" then
//		   rs_qr("clip")="已扣"
//		set rs_kx = Server.CreateObject("ADODB.Recordset")
//		sql_kx ="select * from gcuser where username ='"&rs_qr("payusername")&"' "
//		rs_kx.open sql_kx,conn2,2,3
//		if not rs_kx.eof then
//		if rs_kx("cxt")-1=3 then
//		cxkday=7
//		elseif rs_kx("cxt")-1=2 then
//		cxkday=14
//		elseif rs_kx("cxt")-1=1 then
//		cxkday=21
//		elseif rs_kx("cxt")-1<1 then
//		cxkday=60
//		else
//		cxkday=0
//		end if
//		   rs_kx("cxt")=rs_kx("cxt")-1
//		   rs_kx("cxdate")=date()+cxkday
//		   rs_kx.update
//		set rs_d1 = Server.CreateObject("ADODB.Recordset")
//		sql_d1 = "SELECT * FROM datepay"
//		rs_d1.open sql_d1,conn9,2,3
//		rs_d1.addnew
//		rs_d1("username")=rs_qr("payusername")
//		rs_d1("regid")="确认收款超时-并扣一诚信星-余"&rs_kx("cxt")
//		rs_d1("pay")=rs_kx("pay")
//		rs_d1("jydb")=rs_kx("jydb")
//		rs_d1.update   
//		end if
//		end if
//		rs_qr.MoveNext
//		Wend
//		rs_qr.UpdateBatch
//		%>
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		IPage<Bdbdate> page = logService.getBdbPage(super.getUserName(),type, super.getToPage(), 10);
		super.initPage(page);
		super.setErroCodeNum(2000);
		if(status==1){
			return "bdbdetail";
		}
		return SUCCESS;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
