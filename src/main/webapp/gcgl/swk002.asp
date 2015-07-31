<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
if request.cookies("lsyh")="" then
   response.write "<script language='javascript'>"
   response.write "alert('已操作过，重新登录！');"
   response.write "window.location.replace('logout.asp');"
   response.write "</script>"
   response.end   
end if
%>
<%
swkmj=request("swkjl")
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

<font style="font-size: 20pt; font-weight: 700" color="#800000">您正在操作的是</font><font style="font-size: 20pt; font-weight: 700" color="#008000">实物金币卡</font><font style="font-size: 20pt; font-weight: 700" color="#800000">录入</font><p><font style="font-size: 20pt; font-weight: 700" color="#800000">请认真确定一下录入的是否</font></p>
<p><font style="font-size: 20pt; font-weight: 700">累计总金币面值<%=swkmj%>个</font><font style="font-size: 20pt; font-weight: 700" color="#800000">已收到</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=swkmj*1.5%>元</font><font style="font-size: 20pt; font-weight: 700" color="#800000">现金</font></p>
<p>　</p>
<p>　</p>
<p><a onClick="return confirm('提示：您确定了吗？')" href="sjswk.asp?lkid=<%=lkid%>&mj=<%=swkmj%>"><input type="button" value="确定录入" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p>　</p>
<p><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF0000" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>

</div>
