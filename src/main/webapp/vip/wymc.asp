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
   jybh=request("id")
end if
%>
<%
dim rs_mc,sql_mc
set rs_mc = Server.CreateObject("ADODB.Recordset")
sql_mc="select * from gpjy where id ="&jybh&""
rs_mc.open sql_mc,conn2,2,3
mypay=rs_mc("jypay")
mcsl=rs_mc("mysl")
dqpay=mypay*0.9
mc70a=0.7*dqpay
mc70=int(mc70a*1+0.1)/1
mc30a=0.3*dqpay
mc30=int(mc30a*1+0.1)/1
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
elseif rs("jyg")+0<0 or rs("jyg")+0=0 then
   response.write "<script language='javascript'>"
   response.write "alert('您好，交易积分数量不足，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif mcsl+0>rs("jyg") or rs("jyg")<1 then
   response.Write "<script language=javascript>alert('您好，本次交易积分数量大于您剩余积分数量 "&rs("jyg")&" ，暂时不能交易，本次交易需要 "&mcsl&" 积分，谢谢！');location.href='gpjysc.asp'</script>"
   response.end
end if
%>
<%
if rs_mc("jy")>1 or rs_mc("cgdate")<>"" then
   response.Write "<script language=javascript>alert('该股交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='gpjysc.asp'</script>"
   response.end
else
   rs_mc("jy")=2
   rs_mc("dqdate")=now()
   rs_mc.update
end if
%>
<script>
</script>
<p align="center">　</p>
<p align="center">本次交易倒计时还剩<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> 秒，超时没确认将会自动取消该交易！</p>
<p align="center">　</p>
<p align="center"><font size="6">本次卖出交易积分数量为：<font color="#FF0000"><%=mcsl%></font></font></p>
<p align="center"><font size="5">将在您的账户里扣除：<b><font color="#FF0000"><%=mcsl%></font></b></font><font size="6">积分</font></p>
<div align="center">
	<table border="0" width="52%" id="table1" cellspacing="1" bgcolor="#E6E6E6" height="210">
	<tr>
	<td><b><font size="4"><font color="#FF0000"><%=tgpay%></font>单价是：<font color="#FF0000"><%if rs_mc("pay")<1 then%>0<%=rs_mc("pay")%><%else%><%=rs_mc("pay")%><%end if%>&nbsp; </font>总额为：<font color="#FF0000"><%=rs_mc("jypay")%></font></font><font size="4" color="#800000"> </font></b>
	<p><b><font size="4" color="#800000">卖出成功后：</font></b></p>
	<p><b><font size="4">扣除10%的手续费您共得到：<font color="#800080"><%=dqpay%></font> 一币</font></b></p>
	<p><b><font size="4">其中70%分配到一币账户：<font color="#800080"><%=mc70%></font> 一币</font></b></p>
	<p><b><font size="4">其中30%分配到金币账户：<font color="#800080"><%=mc30%></font></font></b></p>
	</td>
	</tr>
	</table>
	</div>
<p align="center"><a onClick="return confirm('提示：您确定了吗？')" href="mcok.asp?jyg=<%=mcsl%>&id=<%=jybh%>"><input type="button" value="确定无误" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('提示：您确定取消本次交易吗？ ')" href="qxjy.asp?id=<%=jybh%>"><font color="#008000">返回交易市场</font></a></b></p>
<p align="center">　</p>
<%
Rs.close
Set Rs=Nothing
Rs_mc.close
Set Rs_mc=Nothing
conn2.close
set conn2=nothing
conn7.close
set conn7=nothing
%>
<script>
var secs = 30;  //6为倒计时秒数
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
   window.location="qxjy.asp?id=<%=jybh%>";  //2.htm为到时跳转的页面URL
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>