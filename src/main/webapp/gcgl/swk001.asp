<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
lkid=request("lkid")
dim rs0,sql0
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0="select * from gcuser where username ='"&lkid&"'"
rs0.open sql0,conn2,1,1
if  rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('该用户不存在，请检查输入是否正确！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
response.cookies("lsyh")="120"
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.swkjl.value="") {      alert("请写入总面值!");      return false;    } 
  return true;  }  
 </script>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>管理发卡</title>
<style>
<!--
.border {
	border: 1px solid #669933;
}
-->
</style>
</head>
<body bgcolor="#99CCFF">

<div align="center">
<table border="0" width="100%" id="table1" cellspacing="1" height="700">
	<tr>
		<td height="71">
		　</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
			<table border="0" width="81%" id="table3" cellspacing="1" height="108" bgcolor="#FFFFFF">
				<tr>
	<b>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33">
	　</td>
				</tr>
				<b>
				<tr>
					<td height="72">

<form method="POST" action="swk002.asp?lkid=<%=lkid%>" name="form">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b>
		<font size="3" color="#FF0000">请写入实物卡总面值：</font></b><input type="text" name="swkjl" size="15"> 
	<b><font color="#FF0000">**</font></b> <input type="submit" value="提交" name="B1"></p>
</form>
					</td>
				</tr>
			</table>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><a href="xtbfk001.asp" style="text-decoration: none; font-weight:700"><font color="#000000" size="6">返 回 搜 索</font></a></div>
		</td>
	</tr>
</table></div>