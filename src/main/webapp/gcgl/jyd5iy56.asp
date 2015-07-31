<!--#include file="../shopwe.asp"-->
<!--#include file="check<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
dim rs,sql
set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from cfadmin where id =2 "
rs.open sql,conn,2,2
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.cf.value=="") {      alert("请输入需要拆分的数量!");      return false;    } 
  if (Form.cf.value==0) {      alert("拆分数量不能为零!");      return false;    }
  if (!chkinteger(Form.cf.value)){
	alert('拆分数量只能为整字!');
	document.Form.cf.focus;
	return (false);
 }
 function chkinteger(checkStr) {
var checkOK = "0123456789";
var allValid = t}
return (allValid);
}
  return true;  }  
 </script>
<div align="center">
	<form method="POST" name="form" action="diyok.asp">
		<p>　</p>
		<table border="1" width="50%" id="table1" style="border-collapse: collapse" height="110">
			<tr>
				<td width="250" align="right">固定股价：</td>
				<td align="left">
				<input type="text" name="dqgj" size="15" value="<%=rs("dqgj")%>"></td>
			</tr>
			<tr>
				<td width="250" align="right">交易股价：</td>
				<td align="left">
				<input type="text" name="jygj" size="15" value="<%=rs("jygj")%>"></td>
			</tr>
			<tr>
				<td width="250" align="right">发行数量：</td>
				<td align="left">
				<input type="text" name="jygsl" size="15" value="<%=rs("jygsl")%>"></td>
			</tr>
		</table>
		<p><input type="submit" value="提交" name="B1"></p>
		<hr color="#FF00FF" size="3">
	</form>
	<p>　<p>　<p>　</div>
<form method="POST" name="form2" action="cfok.asp">
	<p align="center">拆分为：<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="5" --><input type="text" name="cf" size="10" maxlength="5">
	<input type="submit" value="提交" name="B2"></p>
</form>
