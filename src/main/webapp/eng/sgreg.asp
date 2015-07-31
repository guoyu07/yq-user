<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"--><head>
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
   'response.write "<script language='javascript'>"
   'response.write "alert('您好，此功能暂时维护，预计1小时完成，不便之处敬请谅解，谢谢！');"
   'response.write "history.go(-1);"
   'response.write "</script>" 
   'response.end
   username=request.cookies("regid")
   password=request.cookies("password")
end if
%>
<%
'开始把myid放置
tuser=request("up")
myid=request("bd")
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
'开始在新表sgxtuser搜索上级
set rs0 = Server.CreateObject("ADODB.Recordset")
sql0 = "SELECT * FROM gcuser where username = '"&username&"' and password = '" &password&"'"
rs0.open sql0,conn2,1,1
if rs0.eof and rs0.bof then
   response.write "<script language='javascript'>"
   response.write "alert('User does not exist, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
elseif rs0("sjb")=0 then
   response.write "<script language='javascript'>"
   response.write "alert('This function requires a contact person to select a suitable position to recommend the upgrade! !');"
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
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.bduser.value=="") {      alert("Account user name can not be empty!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("Please select a package!");      return false;    }
  if (Form.pa2j.value=="") {      alert("Please enter two passwords!");      return false;    }
  if (Form.pa2j.value!=="<%=rs0("password3")%>") {      alert("Two password input error!");      return false;    }
  return true;  }  
 </script>
<div align="center">
	<form method="POST" action="bdreg.asp?up=<%=tuser%>" name="Form" onSubmit="return checkdate()">
		<p>　</p>
		<p>　</p>
		<table border="0" width="53%" id="table1" height="160" cellspacing="1">
			<tr>
				<td align="right" width="31%">Select the contact person:</td>
				<td width="68%"><b><font color="#FF0000"><%=tuser%></font></b></td>
			</tr>
			<tr>
				<td align="right" width="31%">Account Username:</td>
				<td width="68%"><input type="text" name="bduser" size="15" value="<%=myid%>"><font size="2" color="#000080"> The default left to right place</font></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right">Select Package:</td>
				<td align="center" width="68%"><p align="left"><b>
              <select size="1" name="cjpay">
				<option selected value="0">==Please select consumer packages==</option>
				<option value="10000">10000 - declaration coins</option>
				<option value="20000">20000 - declaration coins</option>
				<option value="50000">50000 - declaration coins</option>
				<option value="1000">1000 (a coin)</option>
				<option value="2000">2000 (a coin)</option>
				<option value="5000">5000 (a coin)</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right">Enter two passwords:</td>
				<td align="center" width="68%"><p align="left"><input type="password" name="pa2j" size="20"></td>
			</tr>
			<tr>
				<td align="center" width="98%" colspan="2"><font color="#800000"><span style="font-size: 11pt">Expenses from your（</font><b><font color="#008000"><%=username%></font></b><font color="#800000">）Currency or a currency declaration deduction account</font></span></td>
			</tr>
		</table>
		<p><input type="submit" value="Submit" name="B1" onClick="return confirm('Tip: Are you sure it?')" style="font-size: 12pt; font-weight: bold" ></p>
	</form>
<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">Back to Previous Page</font></a></p>
<p>　</div>