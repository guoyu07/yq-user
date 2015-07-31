<!--#include file="../ct0618.asp"-->
<!--#include file="cfvip.asp"-->
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
   response.redirect"../login.aspx"  
   response.write "</script>"
   response.end
else
username=request.cookies("regid")
password=request.cookies("password")
end if
%>
<%
Set rs1= Server.CreateObject("ADODB.Recordset") 
sql1="select * from gcuser where username = '"&username&"'" 
rs1.open sql1,conn2,1,1
if rs1("addsheng")<>"" or rs1("addshi")<>"" or rs1("addqu")<>"" then
else
response.write"<script>alert('Note: Your good supplement your bank card details Address Bank city of! Thank you!');location.href='../vipadd.asp?addid="&username&"'</script>"
response.end
end if
%>
<%
dim action
action=request.QueryString("action")
'//保存信息
if action="save" then
  Dim rs2,sql2
  Set rs2= Server.CreateObject("ADODB.Recordset") 
  sql2="select * from gcuser where username = '"&username&"'" 
  rs2.open sql2,conn2,2,3
  rs2("card")=request("card")
  rs2("bank")=request("bank")
  rs2("call")=request("call")
  rs2("email")=request("email")
  rs2.update
  response.cookies("regid")=rs2("username")    '修改数据提交保存后用会员名和新密码自动登录
  response.cookies("password")=rs2("password")
  response.Write "<script language=javascript>alert('Profile changed successfully!');history.go(-1);</script>"
  if trim(request("password"))<>"" then
  dim pa,pa1
  pa2=trim(request("password"))
  pa5=LCase(pa2)
  rs2("password")=md5(pa5)
  rs2.update
  response.cookies("regid")=rs2("username")    '修改数据提交保存后用会员名和新密码自动登录
  response.cookies("password")=rs2("password")
  response.Write "<script language=javascript>alert('Profile changed successfully!！');history.go(-1);</script>"
  response.end
  end if
end if
%>
<%
  Set rs= Server.CreateObject("ADODB.Recordset") 
  sql="select * from gcuser where username = '"&username&"'" 
  rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.password2.value != Form.password.value) {      alert("Enter the password twice different!");      return false;    }
  if (Form.name.value=="") {      alert("Please enter your real name!");      return false;    }
  //if (Form.bank.value=="") {      alert("Please fill in your form of payment!");      return false;    }
  if (Form.card.value=="") {      alert("Please fill in your respective accounts receivable!");      return false;    }
  if (Form.email.value=="") {      alert("Please enter your e-mail!");      return false;    }
  if (document.Form.email.value.charAt(0)=="." ||        
         document.Form.email.value.charAt(0)=="@"||       
         document.Form.email.value.indexOf('@', 0) == -1 || 
         document.Form.email.value.indexOf('.', 0) == -1 || 
         document.Form.email.value.lastIndexOf("@")==document.Form.email.value.length-1 || 
         document.Form.email.value.lastIndexOf(".")==document.Form.email.value.length-1)
     {
      alert("Email address format is incorrect!");
      document.Form.email.focus();
      return false;
      }
  if (Form.call.value=="") {      alert("Please enter your phone number!");  Form.call.focus();      return false;    }
  if (Form.call.value.length<11) {      alert("Phone numbers of at least 11 digits!"); Form.call.focus();     return false;    } 
  if (Form.call.value.length>11) {      alert("Phone number up to 11 digits!"); Form.call.focus();     return false;    }
  if (Form.qq.value=="") {      alert("Please fill in your qq!");      return false;    }
return true;  }  
</script>
<html>
<head>
<title>Modify Personal Information</title>
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body bgcolor="#C9D8AD" topmargin="5" leftmargin="5">
<div align="center">
  <form  METHOD="POST" action="dateuser.asp?action=save" name="Form" onSubmit="return checkdate()">
    <div align="center"><center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="416">
      <tr bgcolor="#ffffdd">
		<td align="right" width="100%" height="25" colspan="2" bgcolor="#FFFFFF"><p align="center"><b><font face="楷体" style="font-size: 16pt">Modify Profile</font></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> <td align="right" width="491" height="29"><b>Username:</b></td>
       <td width="742" align="left" height="29"><font color="red" size="3"><b>&nbsp;<%=username%></b></font></td>
      </tr>
      <tr>
        <td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD">Password:</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD"><input type="password" name="password" size="16"><font color="#FF0000"> **Please do not change the password blank</font></td>
      </tr>
      <tr>
        <td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD">Confirm Password:</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD"><input type="password" name="password2" size="16"><font color="#FF0000"> **Please do not change the password blank</font></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD">Two passwords:</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD">*************<font color="#FF0000">&nbsp; **Please contact customer service changes.</font></td>
      </tr>
      <tr>
        <td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD">Receivables Bank:</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD"> 
          <select size="1" name="bank">
			<option selected><%=rs("bank")%></option>
			<option>ICBC</option>
			<option>ABC</option>
			<option>Construction Bank</option>
			</select></td>
      </tr>
      <tr bgcolor="#ffffdd">
		<td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD">Real name:</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD"><input type="text" maxlength=18 name="name" size="16" value="<%=rs("name")%>" readonly style="background-color: #C0C0C0"><font color="#FF0000"> **Please contact customer service changes.</font></td>
      </tr>
      <tr>
        <td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD">Account number:</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD"><input type="text" maxlength=32 name="card" size="22" value="<%=rs("card")%>" ><font color="#FF0000"> **Mandatory</font> </td>
      </tr>
      <tr bgcolor="#ffffdd">
		<td align="right" width="491" height="31" style="border-left: 1px solid #C9D8AD"><b><font face="Arial">Mobile number</font></b>：</td>
      <td width="742" align="left" style="border-right: 1px solid #C9D8AD"><input type="text" maxlength=11 name="call" value="<%=rs("call")%>" size="16" readonly></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="491" height="31" style="border-left: 1px solid #C9D8AD" bgcolor="#C9D8AD"><b><font face="Arial">ID Number</font></b>：</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#C9D8AD"><b><%=left(rs("userid"),4)%>**********<%=right(rs("userid"),4)%></b></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="491" height="31" style="border-left: 1px solid #C9D8AD"><font face="Arial">E-mail</font>：</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD"><input type="text" maxlength=25 name="email" value="<%=rs("email")%>" size="16"></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="491" height="30" style="border-left: 1px solid #C9D8AD" bgcolor="#C9D8AD"><b><font face="Arial">QQ</font></b>：</td>
        <td width="742" align="left" style="border-right: 1px solid #C9D8AD" bgcolor="#C9D8AD"><font color="#FF0000"><input type="text" name="qq" size="16" value="<%=rs("qq")%>" readonly maxlength="15" style="background-color: #D9D9D9"> **To modify please contact customer service by virtue of registered QQ.</font></td>
      </tr>
      <tr>
        <td align="center" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; " height="29" width="491" bgcolor="#D9D9D9"><p align="right">Account Bank Address:</td>
        <td align="center" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; " height="29" width="742" bgcolor="#D9D9D9"><p align="left"><font color="#0000FF"><%=rs("addsheng")%><%=rs("addshi")%><%=rs("addqu")%>Subbranch--<b><a href="../vipadd.asp?addid=<%=username%>" style="text-decoration: none"><font color="#FF0000">Modification</font></a></b></font></td>
      </tr>
      <tr>
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD;" height="38" bgcolor="#FFFFDD"><div align="center"><input type="submit" name="submit" width="34" height="20" alt="Submit" size="20" value="Modify the data to determine" class="lkbtn" style="font-size: 12pt"></div></td>
      </tr>
    </table>
      </center>
    </div>
</div>
</form>
<table border="0" width="100%" id="table1" height="33" cellspacing="1" bgcolor="#FFFFFF">
	<tr>
		<td width="20"></td>
		<td><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc" style="text-decoration: none; font-weight:700">Username integral gaming platform application for transfer</a></td>
	</tr>
</table>
<p align="center" style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="35%" width="100%" border="0" frameborder="0" src="dateuserjc.asp"></iframe></p>
</body>
</html>