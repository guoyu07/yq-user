<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码不正确!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('修改卖出单价不能大于原来的定价！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('修改卖出单价成功！');location.replace('/mcsl');</script></c:if>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("请输入需要卖出的单价!");      return false;    } 
  if (Form.jygj.value<0.77) {      alert("卖出单价不能小于 0.77 !");      return false;    }
  if (Form.jygj.value>${gpjy.pay}) {      alert("修改卖出单价不能大于 ${gpjy.pay} 哦!");      return false;    } 
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
  return true;  }  
 </script>
<body topmargin="0">

<form method="POST" action="/diyjygj?status=1&sgid=${sgid}"  name="Form" onSubmit="return checkdate()">
	<div align="center">
	<table border="0" id="table1">
		<tr>
			<td width="223" align="center"><font size="2">交易额：</font></td>
			<td width="59" align="center"><b><font color="#FF0000" size="2">${gpjy.pay}</font></b></td>
			<td width="169" align="center"><font size="2">当前单价：</font></td>
			<td width="130" align="center" ><span style="font-size: 9pt"><font size="1">
			<!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." i-maximum-length="4" --><input type="text" name="jygj" size="6" value="${gpjy.pay}" maxlength="4"></font></span></td>
			<td width="190" align="center"><font size="2">二级密码：</font></td>
			<td width="180" align="center"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa3" size="20" maxlength="20"></font></span></td>
			<td width="133" align="center"><p align="left"><font size="2">&nbsp;</font><span style="font-size: 9pt"><font size="1"><input type="submit" value="修改" name="B1"></font></span></td>
		</tr>
	</table>
	</div>
</form>