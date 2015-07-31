<!--#include file="../zqcjimg.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
jybh=request("payep")
tx=request("tx")
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql ="select * from txpay where payid ="&jybh&""
rs.open sql,conn1,2,3
%>
<%
if rs("ep")>0 or rs("zftime")<>"" or rs("kjygid")<>0 then
   response.Write "<script language=javascript>alert('该EP交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='"&tx&".asp'</script>"
   response.end
else
   rs("ep")=1
   rs("rgdate")=Now()
   rs("dfuser")="系统"
   rs("kjygid")=rs("paynum")+0
   rs.update
end if
%>
<div align="center">
　<table border="0" width="50%" id="table2">
		<tr>
			<td><span style="font-size: 11pt">用户名：</span><b><font color="#FF0000"><span style="font-size: 11pt"><%=rs("payusername")%></span></font></b><p><span style="font-size: 11pt">银行账号户名：</span><b><font color="#0000FF"><span style="font-size: 11pt"><%=rs("payname")%></span></font></b></p>
			<p><span style="font-size: 11pt">所属银行：</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paybank")%></span></font></p>
			<p><span style="font-size: 11pt">银行账号：</span><font color="#0000FF"><span style="font-size: 11pt"><%=rs("paycard")%></span></font></p>
			<p><span style="font-size: 11pt">付款：<b><font color="#FF0000"><%=rs("paynum9")%></font></b>元，</span><a onClick="return confirm('提示：您确定付款了吗？ ')" href="tixianyes.asp?payid=<%=jybh%>&tx=<%=tx%>" style="text-decoration: none">已付款，点击处理！</a></p>
			</td>
		</tr>
	</table>
</div>
