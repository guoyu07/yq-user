<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>
<body>
<script language="JavaScript"> 
 function checkdate()  {  
  if (form.cjb.value=="") {    alert("请写入充值金额");      return false;    }
  if ((form.cjb.value)%1000>0) {    alert("只能输入1000的整倍数如1000,2000,3000,4000,5000!");  form.cjb.focus();  return false;    }
return true;  }  
</script>
<form method="POST" action="vipcjb?status=1&sfid=${sfid}" name="form" onSubmit="return checkdate()">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>VIP用户名：<font color="#008000">${gcuser.username}</font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="center" height="27"><p align="center">(累计：<font color="#FF0000">${gcuser.vipljcjb}</font>)(剩余：<font color="#FF0000">${gcuser.vipcjcjb}</font>)</td>
			</tr>
			<tr>
                <td align="center"><b><font size="2">充值金额：</font></b><input type="text" name="cjb" size="8" />（负数为减充值币）</td>
			</tr>
		</table>
	</div>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交充值" name="B1"></p>
</form>
</body>
</html>