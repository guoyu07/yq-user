<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
sfuser=request("sfid")
sfpay=request("cpsl")
dim sql
dim rs
sql="select * from gcuser where username = '"&sfuser&"'" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn2,1,1
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('操作错误，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs("pay")<sfpay+0 then
   response.write"<script>alert('注意：您的余额小于"&sfpay&"元，请充值！');history.go(-1);</script>"
   response.end
end if
%>
<div align="center">
　<p>　</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">您正在操作的是</font><font style="font-size: 20pt; font-weight: 700" color="#008000">EP-购产品</font><font style="font-size: 20pt; font-weight: 700" color="#800000">录入</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">请认真确定一下购买的是否</font></p>
<p>　</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">需要</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF"><%=sfpay%>元</font><font style="font-size: 20pt; font-weight: 700" color="#800000">EP</font></p>
<p>　</p>
<p><a onClick="return confirm('提示：您确定了吗？ ')" href="eptosf03.asp?sfid=<%=request("sfid")%>&sfpay=<%=sfpay%>">
<input type="button" value="确定从我的EP扣除" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a> </p>
<p>　<p>  
<b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一步</font></a></div>