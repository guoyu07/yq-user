<!--#include file="../ct0618.asp"-->
<!--#include file="../mq0618.asp"-->
<!--#include file="cfvip.asp"-->
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
elseif rs("bddate")+100>Now() and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
%>
<%
set rs_my = Server.CreateObject("ADODB.Recordset")
sql_my = "SELECT * FROM sgxt where username = '"&username&"'"
rs_my.open sql_my,conn7,2,3
if not rs_my.eof then
if rs_my("mqfh")>0 and rs_my("mqfh")<rs_my("zfh") and rs_my("new")>0 and rs("jyg")<50000 then
   response.write "<script language='javascript'>"
   response.write "alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');"
   response.write "history.go(-1);"
   response.write "</script>" 
   response.end
end if
end if
%>
<%
sql_nd="select * from sgxt where username = '"&username&"' and DateDiff('d',date(),bddate)=0 " 
Set rs_nd= Server.CreateObject("ADODB.Recordset") 
rs_nd.open sql_nd,conn7,1,1
if not rs_nd.eof then
   response.write "<script language='javascript'>"
   response.write "alert('请于开户后第二天再进行卖出操作，谢谢！');"
   response.write "history.go(-1);"
   response.write "</script>"
   response.end
end if
%>
<%
dim rs1,sql1
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="select * from fcxt where id =2 "
rs1.open sql1,conn2,1,1
%>
<html>
<head>
<title></title>
</head>
</SCRIPT>
<script>
</script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript">
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("请输入需要卖出的单价!");  Form.jygj.focus();    return false;    } 
  if (Form.jygj.value<0.77) {      alert("卖出单价不能小于 0.77 !");  Form.jygj.focus();    return false;    }
  if (Form.jygj.value><%=rs1("jygj")%>) {      alert("卖出单价不能大于 0<%=rs1("jygj")%> 哦!");  Form.jygj.focus();    return false;    } 
    if (!chkinteger1(Form.jygj.value)){
	alert('卖出单价只能为数字!');
	document.Form.jygj.focus;
	return (false);
 }
function chkinteger1(checkStr1)
{
var re=/^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
return re.test(checkStr1)
}
  if (Form.txpay.value=="") {      alert("请输入需要卖出的数量!");  Form.txpay.focus();    return false;    } 
  if (Form.txpay.value==0) {      alert("卖出数量不能为零!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('卖出数量只能为整字!');
	document.Form.txpay.focus;
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
  if (Form.txpay.value<10) {      alert("卖出数量不能小于10积分!");      return false;    }
  if (Form.txpay.value>1000) {      alert("单笔卖出数量不能大于1000积分!");      return false;    }
  if (Form.txpay.value><%=rs("jyg")%>) {      alert("你的卖出数量不能大于你剩余的数量 <%=rs("jyg")%> 哦!");      return false;    } 
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");   Form.pa3.focus();   return false;    } 
  if (hex_md5(Form.pa3.value) != "<%=md5(rs("password3"))%>")  {      alert("二级密码不正确!");  Form.pa3.focus();    return false;    }
  return true;  }  
 </script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0">
<div align="center"><b><p><font color="#008000" face="隶书" style="font-size: 30pt">发 布 积 分 卖 出</font><font color="#FF0000" face="隶书" style="font-size: 30pt">(出售)</font></p>
			<table border="0" width="75%" id="table1" height="32" bgcolor="#FFEEEE">
			<tr>
			<td>您当前的积分剩余：<font color="#008000"><b><%=rs("jyg")%> </b></font>当前的交易价为：<b><font color="#FF0000"><%if rs1("jygj")<1 then%>0<%=rs1("jygj")%><%else%><%=rs1("jygj")%><%end if%></font></b></td>
			</tr>
			</table>
			<table width="75%" border="1" cellpadding="0" class="border" bgcolor="#800080">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="932"><form method="POST" align="center" name="Form" onSubmit="return checkdate()" action="mcsl2.asp">
      <div align="center">
      <TABLE width="888" border=0 height="128" cellpadding="2" bgcolor="#FFFFFF">
  <TBODY>
    <TR class=content> 
      <TD bgColor=#ffffff width="4" align="right" rowspan="4">
		<p align="center">　</TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="28"><font style="font-size: 11pt; font-weight:700">用户名：</font></TD>
      <TD width="527" bgColor=#ffffff height="28"><font color="#FF0000"><b><%=username%></b></font></TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="30">
		<span style="font-size: 10pt">写入卖出单价：</span></TD>
      <TD width="527" bgColor=#ffffff height="30">
		<!--webbot bot="Validation" s-display-name="只能写数字" s-data-type="Number" s-number-separators=",." i-maximum-length="4" --><input type="text" name="jygj" size="10" maxlength="4"><b><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </TR>
    <TR class=content> 
      <TD width="337" bgColor=#ffffff align="right" height="30"><font style="font-size: 10pt">卖出数量：</font></TD>
      <TD width="527" bgColor=#ffffff height="30"><font size="3"> <span style="font-size: 11pt"><INPUT name="txpay" size=20 ></span></font><font style="font-size: 9pt" color="#FF0000"> ** 可卖出为：</font><font style="font-size: 9pt" color="#008000"><%=rs("jyg")%></font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=2 align=middle bgColor=#ffffff width="347" height="29"><b><p align="right"><font style="font-size: 10pt">二级密码：</font></TD>
		<TD align=middle bgColor=#ffffff width="527" height="29"><p align="left"><input type="password" name="pa3" size="20"><font style="font-size: 9pt" color="#FF0000"> **</font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="880" height="29">
		<p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="确 定 卖 出" name=submit2 style="font-size: 11pt"></TD>
    </TR>
  </TBODY>
</TABLE>
		<p style="margin-top: 0; margin-bottom: 0"><b><font size="2" color="#0000FF">提示：如写入卖出的单价过高，买家可能会不接受，容易导致出售不成功，请慎重发布！</font></b></div>
</form>
    </td>
    </tr>
  </table>
	<p style="margin-top: 0; margin-bottom: 0">　</p>
	<p style="margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" border="0" frameborder="0" src="sggpjy.asp" scrolling="no"></iframe></p>
    <p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
	<p align="center"></p>
	<p style="margin-top: 0; margin-bottom: 0">　</div>
</body>
</html>