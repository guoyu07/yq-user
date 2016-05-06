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
  if(form.sfpay.value<=0){alert("消费金额必须大于0！");      return false;}
  if (form.sflb.value=='') {    alert("请选择支出类别！");      return false;    }
return true;  }  
 
 function choose(str){
	 if(str=='-1'){//自定义
		 form.sflb.style.display = "inline";
		 form.sflbchooes.style.display = "none";
	 }else{
		 if(str=='0'){
			 form.sflb.value='';
		 }else{
			 form.sflb.value=str;
		 }
	 }
 }
</script>
<form method="POST" action="epsf?status=1&uid=${uid}" name="form" onSubmit="return checkdate()">
	<div align="center">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<b>要消费的用户名：<font color="#008000">${uid}</font></b></p>
		<table border="0" width="100%" id="table1" cellspacing="3" height="70" cellpadding="2">
			<tr>
				<td align="right" width="83" height="27"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>当前EP：</b></font></td>
				<td height="27"><font color="#0000FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">${gcuser.pay}</b></font></td>
			</tr>
			<tr>
				<td align="right" width="83"><b><font size="2">消费额：</font></b></td>
				<td><input type="text" name="sfpay" size="8" ><b><font color="#FF00FF" size="2"><select size="1" name="sflbchooes" id="sflbchooes" onChange="choose(document.getElementById('sflbchooes').options[document.getElementById('sflbchooes').selectedIndex].value);">
				<option selected value="0">请选择</option>
				<option value="报单支出">报单</option>
				<option value="消费支出">消费</option>
				<option value="转户">转户</option>
				<option value="培训费">培训费</option>
				<option value="培训费">门票费</option>
				<option value="培训费">杂志费</option>
				<option value="商城业务">商城业务</option>
				<option value="报纸费">报纸费</option>
				<option value="提车手续费">提车手续费</option>
				<option value="爱心捐助">爱心捐助</option>
				<option value="培训餐费">培训餐费</option>
				<option value="-1">自定义</option>
				</select></font></b><input type="text" name="sflb" size="8" /></td>
			</tr>
		</table>
	</div>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" value="提交消费" name="B1"></p>
</form>
</body>
</html>
<script language="JavaScript"> 
form.sflb.style.display = "none";
</script>