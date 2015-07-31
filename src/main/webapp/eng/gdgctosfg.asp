<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
if request.cookies("regid")="" or request.cookies("password")="" then
   response.write "<script language='javascript'>"
   response.write "alert('Account number or password is incorrect!');"
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
   response.write "alert('Operator error, please check the input is correct!');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.zhgc.value=="") {      alert("Please write the number to be converted!");      return false;    } 
  if (Form.zhgc.value==0) {      alert("Convert the number can not be 0!");      return false;    } 
  if (Form.zhgc.value><%=rs("gdgc")%>) {      alert("Bonus points can not be greater than the number of conversion <%=rs("gdgc")%> oh!");      return false;    }
  if (!chkinteger(Form.zhgc.value)){
	alert('Converted to an integer number only word!');
	document.Form.zhgc.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = true;
for (i=0; i<checkStr.length; i++) {
ch = checkStr.charAt(i);
if (checkOK.indexOf(ch) == -1) {
allValid = false;
break;
}
if ((ch == '+' || ch == '-') && i>0) {
allValid = false;
break;
}
}
return (allValid);
}
  if (Form.gcpa.value=="") {      alert("Please enter the two Password!");      return false;    } 
  if (Form.gcpa.value!=="<%=rs("password3")%>") {      alert("Two password is incorrect!");      return false;    }
  return true;  }
</script>
<body topmargin="0">
	<form method="POST" action="gdgctosfgok.asp" name="Form" onSubmit="return checkdate()" target="main">
		<p><font style="font-size: 11pt">Your current remaining bonus points:<font color="#FF0000"><%=rs("gdgc")%></font> Now need to convert<input type="text" name="zhgc" size="10">A bonus point two passwords:</font><b><span style="font-size: 11pt"><font size="4"><input name="gcpa" size="20" type="password"></font></span><font size="2">
		</font><span style="font-size: 11pt"><font size="4"> <input type="submit" value="Submit" name="B1"></font></span></b></p>
	</form>