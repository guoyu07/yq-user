<!--#include file="../ct0618.asp"-->
<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "top.location.replace('logout.asp');"
   response.write "</script>"
   response.end
elseif request.cookies("regid")="" or request.cookies("password")="" then
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
gmsl=request("gmsl")
gmmj=request("mj")
dlsy=request("gmsl")*request("mj")
dim sql
dim rs
sql="select * from gcuser where username = '"&username&"' and password = '" &password&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("jb")<>4 then
   response.write"<script>alert('注意：您还不是区级管理，只有区级管理才可以操作！谢谢！');history.go(-1);'</script>"
   response.end
elseif rs("pay")<15 then
   response.write"<script>alert('注意：您的一币余额小于15，请充值！');history.go(-1);</script>"
   response.end
elseif rs("pay")<dlsy*1.5 then
   response.write"<script>alert('注意：您的一币余额不够本次发卡，请充值！');history.go(-1);</script>"
   response.end
end if
%>
<%
lkid=request("lkid")
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from gcuser where username ='"&lkid&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该用户不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if 
%>
<p>　</p>
<p>　</p>
<div align="center">
<font style="font-size: 20pt; font-weight: 700" color="#800000">您正在操作的是</font><font style="font-size: 20pt; font-weight: 700" color="#008000">购买电子金币卡</font><font style="font-size: 20pt; font-weight: 700" color="#800000">录入</font><p><font style="font-size: 20pt; font-weight: 700" color="#800000">请认真确定一下购买的是否</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#FF0000"><%=gmsl%>张</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">面值<%if request("mj")=10 then %>10金币（15一币/张）<%elseif request("mj")=50 then %>50金币（75一币/张）<%elseif request("mj")=100 then %>100金币（150一币/张）<%elseif request("mj")=300 then %>300金币（450一币/张）<%elseif request("mj")=500 then %>500金币（750一币/张）<%elseif request("mj")=1000 then %>1000金币（1500一币/张）<%end if%></font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">已收到</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=dlsy*1.5%>一币</font><font style="font-size: 20pt; font-weight: 700" color="#800000">现金</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">=</font><font style="font-size: 20pt; font-weight: 700" color="#008000"><%=dlsy/10%>张</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">面值10金币的卡</font><font style="font-size: 20pt; font-weight: 700">累计金币面值<%=dlsy%>个</font></p>
<p>　</p>
<p>　</p>
<p><a onClick="return confirm('提示：您确定了吗？')" href="glfk006.asp?lkid=<%=lkid%>&mj=<%=request("mj")%>&jbpay=<%=dlsy%>&lksl=<%=gmsl%>"><input type="button" value="确定收到" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p>　</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF0000" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</div>