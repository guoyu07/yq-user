<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Temporarily unable to sell!');"
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
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
dim rs_my,sql_my
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my="select * from gpjy where jyid ="&jybh&""
rs_my.open sql_my,conn2,2,3
%>
<%
if rs_my("jy")>1 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('Buying or have been conducted in this transaction by its people successful, not Caesar elimination, please choose other deals!');location.href='sgqg.asp'</script>"
   response.end
else
   rs_my("jy")=2
   rs_my("dqdate")=now()
   rs_my.update
end if
%>
<script language="JavaScript"> 
function checkdate()  {  
  if (Form.nm3.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.nm3.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
return true;  }  
 </script>

<form method="POST" action="qxqgok.asp?qxid=<%=jybh%>"  name="Form" onSubmit="return checkdate()">
	<p align="center">¡¡</p>
	<p align="center">Enter<font color="#FF0000"><%=username%></font>the two passwords:<input type="password" name="nm3" size="20">&nbsp; <input type="submit" value="Confirmation" name="B1"></p>
</form>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" face="ËÎÌå" size="2">Back to Previous Page</font></a></p>