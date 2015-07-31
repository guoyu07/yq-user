<!--#include file="../ct0618.asp"-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
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
end if
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.zhgc.value=="") {      alert("请写入要转换的数量!");      return false;    } 
  if (Form.zhgc.value==0) {      alert("转换的数量不能为0!");      return false;    } 
  if (Form.zhgc.value><%=rs("gdgc")%>) {      alert("转换分红点数量不能大于 <%=rs("gdgc")%> 哦!");      return false;    }
  if (!chkinteger(Form.zhgc.value)){
	alert('转换数量只能为整字!');
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
  if (Form.gcpa.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (Form.gcpa.value!=="<%=rs("password3")%>") {      alert("二级密码不正确!");      return false;    }
  return true;  }
</script>
<body topmargin="0">
	<form method="POST" action="gdgctosfgok.asp" name="Form" onSubmit="return checkdate()" target="main">
		<p><font style="font-size: 11pt">您当前剩余分红点：<font color="#FF0000"><%=rs("gdgc")%></font> 现需要转换<input type="text" name="zhgc" size="10">个分红点 二级密码：</font><b><span style="font-size: 11pt"><font size="4"><input name="gcpa" size="20" type="password"></font></span><font size="2">
		</font><span style="font-size: 11pt"><font size="4"> <input type="submit" value="提交" name="B1"></font></span></b></p>
	</form>