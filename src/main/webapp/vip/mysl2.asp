<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('账号或密码错误！');"
   response.redirect"login.asp"  
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")   
end if
%>
<%
if request("gj")<1 then
   gj=0&request("gj")
else
   gj=request("gj")
end if
tgpay=request("txpay")
dqpay10=tgpay*gj
dqpay=int(dqpay10*1+0.9)/1
%>
<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您买入数量不能小于零，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif dqpay+0>rs("jydb") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您当前的金币余额不足请充值或先转换为金币，谢谢！');"
   response.write "location.replace('jztojb.asp');"
   response.write "</script>" 
   response.end
end if
%>
<%
if rs("jydb")>1500 then
Set rs_mc= Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gpjy where jy=0 and mcsl>0 "
rs_mc.open sql_mc,conn2,1,1
if not rs_mc.eof then
   response.write "<script language='javascript'>"
   response.write "alert('交易市场已有积分在出售中，请按需求点击 [我要买入] ！');"
   response.write "location.replace('gpjysc.asp');"
   response.write "</script>" 
   response.end
end if
end if
%>
<div align="center">
	　<p>　</p>
	<table border="1" width="40%" id="table1" height="249" style="border-collapse: collapse">
		<tr>
	<td><b><font size="6" face="隶书" color="#FF0000">请您再次确认</font></b><p><b><font size="4">您要买入积分数量<font color="#FF0000"><%=tgpay%></font>当前单价是<font color="#FF0000"><%=gj%></font></font></b></p>
	<p><b><font size="4">即将从您的金币账户扣除<font color="#800080"><%=dqpay%></font>金币</font></b></p>
	<p>　</p>
	<p align="center"><a onClick="return confirm('提示：您确定了吗？')" href="myslok.asp?sl=<%=tgpay%>&jo=<%=dqpay%>&gj=<%=gj%>"><input type="button" value="确定无误" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
	</tr>
	</table>
<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
<p align="center">　</div>