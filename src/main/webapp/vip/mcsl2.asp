<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
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
'dim rs0,sql0
'set rs0 = Server.CreateObject("ADODB.Recordset")
'sql0="select * from fcxt where id =2 "
'rs0.open sql0,conn2,1,1
'if rs0("jygj")>1.18 then
   'response.write "<script language='javascript'>"
   'response.write "alert('系统拆分期间暂停交易，预计需要一天的调整期，拆分后恢复正常！');"
   'response.write "history.go(-1);"
   'response.write "</script>" 
   'response.end
'end if
%>
<%
tgpay=request("txpay")
jygj=request("jygj")
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
dqpay10=tgpay*jygj
dqpay92=0.9*dqpay10
dqpay=int(dqpay92*1+0.1)/1
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
if jygj+0<0.77 then
   response.write "<script language='javascript'>"
   response.write "alert('卖出单价不能小于 0.77 ！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs1("jygj")+0.03<jygj+0 then
   response.write "<script language='javascript'>"
   response.write "alert('卖出单价不能大于 "&rs1("jygj")+0.03&" 哦！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
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
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0<0 or tgpay+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您卖出数量不能小于零，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("stopjyg")>19 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif tgpay+0>rs("jyg") then
   response.write "<script language='javascript'>"
   response.write "alert('您好，您卖出数量不能大于您剩余数量 "&rs("jyg")&" ，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
Set rs_my= Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where jy=0 and mysl>0 " 
rs_my.open sql_my,conn2,1,1
if not rs_my.eof and rs("jygt1")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('交易市场已有求购信息，请按需求点击 [我要卖给] ！');"
   response.write "location.replace('gpjysc.asp');"
   response.write "</script>" 
   response.end
end if
%>
<div align="center">
	　<p>　</p>
	<table border="1" width="50%" id="table1" height="367" style="border-collapse: collapse">
		<tr>
	<td height="314"><b><font size="6" face="隶书">请您再次确认是否挂牌</font></b>
	<p><b><font size="4">您要卖出积分数量<font color="#FF0000"><%=tgpay%></font>选择单价是<font color="#FF0000"><%=jygj%></font></font></b></p>
	<p><font size="4" color="#800000"><b>卖出成功后：</b></font></p>
	<p><b><font size="4">扣除10%的手续费您共得到：<font color="#800080"><%=dqpay%></font></font></b></p>
	<p><b><font size="4">其中70%分配到一币账户：<font color="#800080"><%=mc70%></font> 一币</font></b></p>
	<p><b><font size="4">其中30%分配到金币账户：<font color="#800080"><%=mc30%></font></font></b></p>
	<p align="center"><a onClick="return confirm('提示：您确定了吗？')" href="mcslok.asp?sl=<%=tgpay%>&gj=<%=jygj%>"><input type="button" value="确定无误" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
		</tr>
		<tr>
	<td><p align="center"><b><font color="#FF0000" style="font-size: 11pt">提示：此为挂牌，等待买家确认后一币和金币才可以得到分配！</font></b></td>
		</tr>
	</table>
	<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
<p align="center">　</div>