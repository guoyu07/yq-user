<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "window.location.replace('log88out.asp');"
   response.write "</script>"
   response.end
else
   response.cookies("lsyh")="120"
   cuser=request("cjid")
   cjpay=request("cjpay")
   czy=request("czy")
end if
%>
<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM gcuser where username = '"&cuser&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof or rs("sjb")>0 then
   response.write "<script language='javascript'>"
   response.write "alert('该会员不存在或已经是双区会员，不需要重复报单，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM fcxt where cz01 = '"&czy&"' or cz02 = '"&czy&"' or cz03 = '"&czy&"' or cz04 = '"&czy&"' or cz05 = '"&czy&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作员不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%><p align="center">　</p>
<p align="center"><font face="黑体" size="6" color="#FF0000">请再次确认</font></p>
<div align="center">
	<p align="center">　</p>
	<table border="0" width="24%" id="table1" cellspacing="1" height="146">
		<tr>
			<td align="right" width="145"><font face="黑体" size="5">收到会员：</font></td>
			<td align="left"><font face="黑体" size="5"><font color="#800000"><%=cuser%></font> </font>
			</td>
		</tr>
		<tr>
			<td align="right" width="145"><font face="黑体" size="5">充值款：</font></td>
			<td align="left"><font color="#0000FF" face="黑体" size="5"><%=cjpay%></font></td>
		</tr>
		<tr>
			<td align="right" width="145"><font face="黑体" size="5">操作员：</font></td>
			<td align="left"><font color="#008000" face="黑体" size="5"><%=czy%></font></td>
		</tr>
	</table>
</div>
<p align="center">　</p>
<p align="center"><a onClick="return confirm('提示：您确定收到 <%=cjpay%> 元了吗？')" href="pmxt01.asp?czy=<%=czy%>&cj=<%=cjpay%>&uid=<%=cuser%>"><input type="button" value="确认无误" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"> 
              <a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-weight: 700" size="4">
				返回上一页</font></a></p>
<p align="center">　</p>