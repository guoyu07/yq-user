<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
else
   username=request.cookies("regid")
   password=request.cookies("password")
   tuser=request("up")
   bdds=request("bduser")
   cjpay=request("cjpay")
   myid=LCase(bdds)
end if
%>
<%
dim rs_js,sql_js
set rs_js = Server.CreateObject("ADODB.Recordset")
sql_js="select * from fcxt where id =2 "
rs_js.open sql_js,conn2,1,1
if Now()>rs_js("jsdate") then
   response.write "<script language='javascript'>"
   response.write "alert('Pause account settlement period, opening tomorrow!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT * FROM fcxt where id=10"
rs2.open sql2,conn2,1,1
%>
<%
if cjpay<1000 then
   response.write "<script language='javascript'>"
   response.write "alert('Select the declaration amounts error and could not complete the account, please try again after recharge!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
if cjpay<9000 then
   bdlb="A currency"
else
   bdlb="Currency declaration"
end if
%>
<%
dim rs_bd,sql_bd
set rs_bd = Server.CreateObject("ADODB.Recordset")
sql_bd="select * from gcuser where username ='"&username&"' and password = '" &password&"'"
rs_bd.open sql_bd,conn2,1,1
if rs_bd.eof and rs_bd.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
elseif rs_bd("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('This function requires a contact person to select a suitable position to recommend the upgrade! !');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end   
elseif cjpay>9000 and rs_bd("sybdb")<cjpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('Account balance is less than the amount of currency declaration"&cjpay&"Unable to complete the account, please try again after recharge!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif cjpay<9000 and rs_bd("pay")<cjpay+0 then
   response.write "<script language='javascript'>"
   response.write "alert('A currency account balance is less than the amount"&cjpay&"Unable to complete the account, please try again after recharge!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM gcuser where username = '"&myid&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('To account user name does not exist, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs0("regtime")<rs2("jsdate") then
   response.write "<script language='javascript'>"
   response.write "alert('System commissioning, re-register a new user name to operate or contact your sponsor!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
if cjpay>49980 then
sql_300="select sum(sjb) as tj300 from gcuser where sjb=100 and name='"&rs0("name")&"' and userid='"&rs0("userid")&"' " 
Set rs_300= Server.CreateObject("ADODB.Recordset") 
rs_300.open sql_300,conn2,1,1
if rs_300("tj300")>298 then
   response.write "<script language='javascript'>"
   response.write "alert('The name of the account holder 50000 has reached three, can not be opened 50,000 accounts!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
end if
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT * FROM sgxt where auid = '"&myid&"' or buid = '"&myid&"'"
rs1.open sql1,conn7,1,1
if not rs1.eof then
   response.write "<script language='javascript'>"
   response.write "alert('Account holders have been properly placed, can not be repeated, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif myid<>username and rs0("up")<>username then
   response.write "<script language='javascript'>"
   response.write "alert('Recommended only for people who own direct account!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
'开始在新表sgxtuser搜索上级
set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM sgxt where username = '"&tuser&"'"
rs.open sql,conn7,2,3
if rs.eof and rs.bof then
   response.write "<script language='javascript'>"
   response.write "alert('Contact person does not exist, can not be placed, please check whether correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<div align="center">
<p>　</p>
<p>　</p>
<p><font face="黑体" size="6" color="#FF0000">Please confirm again</font></p>
	<form method="POST" action="bdreg2.asp" name="form">
	<table border="0" width="57%" id="table1" height="148" cellspacing="1">
		<tr>
			<td align="right" width="45%">Select the contact person:</td>
			<td width="54%"><font color="#000080"><b><input type="hidden" name="gcr" size="10" value="<%=tuser%>" readonly><%=tuser%></b></font></td>
		</tr>
		<tr>
			<td align="right" width="45%">Account Username:</td>
			<td width="54%"><font color="#FF0000"><b><input type="hidden" name="uid" size="10" value="<%=myid%>" readonly><%=myid%></b></font></td>
		</tr>
		<tr>
			<td align="right" width="45%">Select Package:</td>
			<td width="54%"><font color="#008000"><b><input type="hidden" name="cj" size="10" value="<%=cjpay%>" readonly><%=cjpay%></b></font></td>
		</tr>
		<tr>
			<td align="right" colspan="2" bgcolor="#EAEAEA"><p align="center"><span style="font-size: 11pt"><font color="#800000">From your（</font><b><%=username%></b><font color="#800000">）<%=bdlb%>Account deduction：</font><font color="#0000FF"><%=cjpay%></font></span></td>
		</tr>
	</table>
		<p><input type="submit" value="Confirmation" name="B1" onClick="{if(confirm('Tip: Are you sure it?')){this.style.visibility='hidden';return true;}return false;}" style="font-size: 14pt; color: #0000FF; font-weight: bold"></p>
</form>
<p align="center"> </p>
<p align="center"> 　</p>
<p align="center"> 　</p>
<p align="center"> <a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">Back to Previous Page</font></a></p>
<p>　</p></div>