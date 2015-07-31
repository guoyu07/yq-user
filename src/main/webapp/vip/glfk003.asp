<!--#include file="../ct0618.asp"-->
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
end if
%>
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
if rs("addqu")<>rs0("addqu") then 
   response.write"<script>alert('注意：不在您的"&rs("addshi")&"-"&rs("addqu")&"内的消费者暂时不可以为他发卡！\n\n请您让他联系["&rs0("addsheng")&"--"&rs0("addshi")&"--"&rs0("addqu")&"]的发卡中心，谢谢！');history.go(-1);</script>"
end if
%>
<%
response.cookies("lsyh")="120"
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmsl.value==0) {      alert("请选择你要购买的面值!");      return false;    } 
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
			<table border="0" width="81%" id="table3" cellspacing="1" height="98" bgcolor="#FFFFFF">
				<tr>
	<b>
			<td align="center" width="97%" bgcolor="#FFF4DF" height="33">
	　</td>
				</tr>
				<b>
				<tr>
					<td height="62">

<div align="center">

<table width="636" border="0" cellpadding="0" class="border" style="border-color:#C0C0C0; border-width: 0; " bordercolor="#111111" id="table4" height="70">
  
  <tr>
    <td align="center" valign="top" width="632" style="color: #304618; font-size: 12px" bordercolor="#669933"> 
      <form method="POST" align="center" action="glfk004.asp?lkid=<%=lkid%>" name="Form" onSubmit="return checkdate()">
      <div align="center">
      <TABLE width="610" border=0 cellPadding=5 cellSpacing=1 id="table5" height="20">
  <TBODY>
    <TR class=content> 
      <TD width="266" bgColor=#ffffff align="left" style="color: #304618; font-size: 12px">
		<p align="right" style="line-height: 200%; margin-top: 0; margin-bottom: 0">
		<b>
		<font size="3" color="#FF0000">请选择要购买的金币卡面值：</font></b></TD>
      <TD width="321" bgColor=#ffffff style="color: #304618; font-size: 12px" align="left">  
              <p style="line-height: 200%; margin-top: 0; margin-bottom: 0">  
              <font size="3">  
              <select size="1" name="gmmj">
				<option value="0" selected>==请选择金币卡面值==</option>
				<option value="1">10金币（15一币/张）</option>
				<option value="5">50金币（75一币/张）</option>
				<option value="10">100金币（150一币/张）</option>
				<option value="30">300金币（450一币/张）</option>
				<option value="50">500金币（750一币/张）</option>
				<option value="100">1000金币（1500一币/张）</option>
				</select>
				</font>
				<font color="#FF0000" style="font-size: 11pt">** </font><b>&nbsp;<INPUT class=normalButton type=submit value="提 交" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
					</div>
					</td>
				</tr>
			</table>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0">　</p>
			<p style="line-height: 200%; margin-top: 0; margin-bottom: 0"><a href="glfk001.asp" style="text-decoration: none; font-weight:700"><font color="#000000" size="6">返 回 搜 索</font></a></div>
		</td>
	</tr>
</table></div>