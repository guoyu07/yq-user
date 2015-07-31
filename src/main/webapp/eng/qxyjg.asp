<!--#include file="../ct0618.asp"--><head>
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
sql_my="select * from gpjy where id ="&jybh&""
rs_my.open sql_my,conn2,2,3
%>
<%
if rs_my("jy")>1 or rs_my("cgdate")<>"" then
   response.Write "<script language=javascript>alert('The integration of the transaction or the transaction has been succeeded by its people, not Caesar elimination, please choose other deals!');location.href='sggpjy.asp?jyid="&username&"'</script>"
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

<form method="POST" action="qxyjgok.asp?qxid=<%=jybh%>"  name="Form" onSubmit="return checkdate()">
	<p align="center">¡¡</p>
	<p align="center">Enter<font color="#FF0000"><%=username%></font>the two passwords:<input type="password" name="nm3" size="20">&nbsp; <input type="submit" value="Confirmation" name="B1"></p>
</form>