<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('该订单号已支付完成，请不要重要操作！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('订单信息有误，请重新提交！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('输入的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('输入的登录密码不正确，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('输入的二级密码不正确，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您的一币余额不足，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('手机验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('参数校验失败！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('您的购物卷余额不足，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('支付成功！');location.replace('${url}?act=payment&resultstr=${resultstr}&op=returnyibi&sn=${sn}&paycode=success&payamount=${gwpay}&pid=1&order_sn=${order}&&payuser=${user}');</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('充值成功！');location.replace('${url}?act=payment&op=returnyibi&sn=${sn}&paycode=success&payamount=${gwpay}&pid=2&order_sn=${order}&&payuser=${user}');</script></c:if>
<html>
<head>
<title></title>
<head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script src="/scripts/sms.js"></script>
<script language="JavaScript"> 
function checkdate()  {
  if (Form.user.value=="") {     alert("请填入您的用户名!");  Form.user.focus();      return false;    }
  if (Form.pa01.value=="") {      alert("请填入您的登录密码!");  Form.pa01.focus();      return false;    }
  if (Form.pa02.value=="") {      alert("请填入您的二级密码!");  Form.pa02.focus();      return false;    }
  	
    $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms2?op=7&toUserName="+Form.user.value, data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		settime($("#btn"));
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.hgcode.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.mcygcode.focus();   return false;    }
  return true;
} 
</script>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="ybpay?ybf=actok&url=${url}" id="Form" name="Form">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	　<p><font size="6" color="#FF0000">${title}</font></p>
	<table border="0" id="table1" height="308" width="560">
		<tr>
			<td width="214" align="right">订单号：</td>
			<td width="336" align="left" colspan="2"><font color="#008000">${order}<input type="hidden" name="order" size="20" value="${order}"></font></td>
			</tr>
		<tr>
			<td width="214" align="right">订单金额：</td>
			<td width="336" align="left" colspan="2"><input type="hidden" name="ybstr" size="20" value="${ybstr}" readonly><input type="hidden" name="gwpay" size="20" value="${gwpay}" readonly>${gwpay}<input type="hidden" name="sid" size="20" value="${sid}" readonly><input type="hidden" name="pid" size="20" value="${pid}" readonly></td>
		</tr>
		<tr>
			<td width="214" align="right">一币服务费(2%)：</td>
			<td width="336" align="left" colspan="2">${fee}</td>
		</tr>
		<tr>
			<td width="214" align="right">合计一币：</td>
			<td width="336" align="left" colspan="2"><b><font color="#FF0000">${ybsl}<input type="hidden" name="ybpay" size="20" value="${ybsl}"></font></b></td>
		</tr>
		<c:if test="${pid==1">
		<tr>
			<td width="214" align="right">购物券服务费(2%)：</td>
			<td width="336" align="left" colspan="2">${feeScores}</td>
		</tr>
		<tr>
			<td width="214" align="right">合计购物券：</td>
			<td width="336" align="left" colspan="2"><b><font color="#FF0000">${allScores}<input type="hidden" name="ybstr" size="20" value="${ybstr}"><input type="hidden" name="sign" size="20" value="${sign}"></font></b></td>
		</tr>
		</c:if>
		<tr>
			<td width="214" align="right">用户名：</td>
			<td width="336" align="left" colspan="2"><b><font color="#0000FF"><input type="text" name="user" size="20"><input type="hidden" name="remark" size="5" value="8" readonly></font></b></td>
			</tr>
		<tr>
			<td width="214" align="right">登录密码：</td>
			<td width="336" align="left" colspan="2"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right">二级密码：</td>
			<td width="336" align="left" colspan="2"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right" height="30">手机验证码：</td>
			<td width="81" align="right" height="30"><input type="text" name="hgcode" size="10"></td>
			<td width="252" align="right" height="30"><p align="left"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="46"><p align="center">　</td>
			<td width="336" align="right" height="46" colspan="2"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定支付" name="B1" onClick="{if(confirm('确定支付吗?')){this.style.visibility='hidden';return true;}return false;}" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p>请不要使用它人账户进行操作，一经发现3倍罚款！</p>
	<p>如果购物券不足，将扣除同等数量的一币！</p>
	</div>
</form>
<script type="text/javascript">
btnStatus($("#btn"));
</script>