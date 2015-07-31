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
   jybh=request("sgid")  
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
mypay=rs_my("jypay")
pay=rs_my("pay")
if rs_my("pay")<1 then
   pay="0"&pay
else
   pay=rs_my("pay")
end if
%>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("请输入需要卖出的单价!");      return false;    } 
  if (Form.jygj.value<0.77) {      alert("卖出单价不能小于 0.77 !");      return false;    }
  if (Form.jygj.value><%=rs_my("pay")%>) {      alert("修改卖出单价不能大于 <%=rs_my("pay")%> 哦!");      return false;    } 
    if (!chkinteger1(Form.jygj.value)){
	alert('修改卖出单价只能为数字!');
	document.Form.jygj.focus;
	return (false);
 }
function chkinteger1(checkStr1)
{
var re=/^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
return re.test(checkStr1)
}
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>") {      alert("二级密码不正确!");      return false;    }
  return true;  }  
 </script>
<body topmargin="0">

<form method="POST" action="diyjygjok.asp?sgid=<%=jybh%>"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	<table border="0" id="table1">
		<tr>
			<td width="223" align="center"><font size="2">交易额：</font></td>
			<td width="59" align="center"><b><font color="#FF0000" size="2"><%=mypay%></font></b></td>
			<td width="169" align="center"><font size="2">当前单价：</font></td>
			<td width="130" align="center" ><span style="font-size: 9pt"><font size="1">
			<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="4" --><input type="text" name="jygj" size="6" value="<%=pay%>" maxlength="4"></font></span></td>
			<td width="190" align="center"><font size="2">二级密码：</font></td>
			<td width="180" align="center"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
			<td width="133" align="center"><p align="left"><font size="2">&nbsp;</font><span style="font-size: 9pt"><font size="1"><input type="submit" value="修改" name="B1"></font></span></td>
		</tr>
	</table>
	</div>
</form>