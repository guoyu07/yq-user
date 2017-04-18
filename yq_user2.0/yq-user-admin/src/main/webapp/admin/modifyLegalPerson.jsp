<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改法人</title>
</head>
<body>
<form method="POST" action="modifylegalperson?status=1&uid=${uid}" name="form" onSubmit="return checkdate()">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>添加用户名[<font color="#FF0000">${uid}</font>]的法人：<font color="#008000"></font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="83" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>法人：</b></font></td>
				<td height="27"><font color="#0000FF"><b><input type="text" name="faren" value="${olduserp.faren}"></b></font></td>
			</tr>
		</table>
	</div>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交修改" name="B1"></p>
</form>
<script type="text/javascript">

	function checkdate(){
		if(form.faren.value==""){
			alert("法人不能为空");
			form.faren.focus();
			return false;
		}
	}


</script>
</body>
</html>
