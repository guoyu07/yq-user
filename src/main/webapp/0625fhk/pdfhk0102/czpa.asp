<%
if request.cookies("jhjbkid")="" or request.cookies("gpa")="" then
   response.write "<script language='javascript'>"
   response.write "alert('密码已重设置过！');"
   response.redirect "gmjl.asp"
   response.write "</script>"
   response.end
else
   jhjbkid=request.cookies("jhjbkid") 
end if
%>
<!--#include file="../shopmfh.asp"-->
<!--#include file="jk_md5.asp"-->
<%
pdid=request("id")
pdpa=request("pa")
fwid=request("fw")
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from ejbk where pdid = '"&pdid&"'" 
rs.open sql,conn0,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该消费编号不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
else
   rs("gpa")=rs("gpa")+1
   rs("pdpamd5")=md5(pdpa)
   rs("fwidmd5")=md5(fwid)
   rs.update
end if   
%>
<%
response.cookies("gpa")=""
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	　<p>　</p>
	<table border="0" width="75%" id="table1" height="120" cellspacing="1">
		<tr>
		<td>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>你好！重置成功
			</b>
		</p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">消费编号是：<b><font color="#0000FF"><%=pdid%></font></b>&nbsp; 登录密码为：<b><font color="#FF0000"><%=pdpa%></font></b>&nbsp; 防伪编号为：<b><font color="#008000"><%=fwid%>&nbsp; </font></b>金币面值：<b><%=rs("bf2")%>0</b></p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">请牢记，并及时交给客户以便尽快激活购买积分增值！<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<a onClick="return confirm('提示：按此激活将是自己使用，不能再用于赠送，您确定了吗？')" href="chklogin.asp?pdid=<%=pdid%>&pdpa=<%=pdpa%>&fwid=<%=fwid%>&jbk=<%=jhjbkid%>"><input type="button" value="快速激活--点这里！" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a></td>
		</tr>
	</table>
	<p align="center">　</p>
	<p>　</p>
	<p><a href="gmjh.asp?jh=<%=jhjbkid%>" style="text-decoration: none; font-weight: 700">
	<font size="4" color="#FF0000">点击返回</font></a></p>
	<p>　</div>