<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('暂时不能卖出！');"
   response.write "history.go(-1);" 
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   jybh=request("qxid")
end if
%>
<%
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
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
%>
<%
if rs_my("jy")>1 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能撒消，请选择其它交易！');location.href='sggpjy.asp?jyid="&username&"'</script>"
   response.end
else
   rs_my("jy")=2
   rs_my("dqdate")=now()
   rs_my.update
end if
%>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.nm3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>")  {      alert("二级密码不正确!");      return false;    }
  return true;  }  
 </script>
<form method="POST" action="qxyjgok.asp?qxid=<%=jybh%>"  name="Form" onSubmit="return checkdate()">
	<p align="center">　</p>
	<p align="center">请输入<font color="#FF0000"><%=username%></font>的二级密码：<input type="password" name="nm3" size="20">&nbsp; <input type="submit" value="确认无误" name="B1"></p>
</form>