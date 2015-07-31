<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>
<%
userid=request("sfid")
set rs=server.createobject("adodb.recordset")
sql="select * from gcuser where username = '"&userid&"'"
rs.open sql,conn2,1,1
%>
<script language="JavaScript"> 
 function checkdate()  {  
  if (form.sflb.value==0) {    alert("请选择支出类别");      return false;    }
return true;  }  
</script>
<form method="POST" action="sfsave.asp?sfid=<%=userid%>" name="form" onSubmit="return checkdate()">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>要消费的用户名：<font color="#008000"><%=userid%></font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="83" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>当前EP：</b></font></td>
				<td height="27"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><%=rs("pay")%></b></font></td>
			</tr>
			<tr>
				<td align="right" width="83"><b><font size="2">消费额：</font></b></td>
				<td><input type="text" name="sfpay" size="8"><b><font color="#FF00FF" size="2"><select size="1" name="sflb">
				<option selected value="0">请选择</option>
				<option value="报单支出">报单</option>
				<option value="消费支出">消费</option>
				<option value="转户">转户</option>
				<option value="培训费">培训费</option>
				</select></font></b></td>
			</tr>
		</table>
	</div>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交消费" name="B1"></p>
</form>
</body>
</html>