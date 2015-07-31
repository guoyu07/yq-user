<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('结算期间暂停开户，明天开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('选择报单金额错误，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('登录密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('报单币余额小于开户金额${cjpay}，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('一币余额小于开户金额${cjpay}，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('要开户的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('系统调试中，请重新注册新的用户名进行操作或联系您的推荐人！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('该姓名持有5万的账户已达到3个，不能再开设5万的账户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('只能给自己的直接推荐的人开户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==15}"><script language=javascript>alert('接点人位置已被占用，请重新选择！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==16}"><script language=javascript>alert('验证码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<script type="text/javascript" src="images/jquery.min.js"></script>
<script language="JavaScript">
 function checkdate()  { 
  
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("sms.asp", data, function(data) {
		$("#btn").removeAttr("disabled");
		if (data != "success") { alert("手机验证码发送失败"); return false; }
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.ceid.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.ceid.focus();   return false;    }
  return true;
} 
</script>

<div align="center">
<p>　</p>
<p>　</p>
<p><font face="黑体" size="6" color="#FF0000">请再次确认</font></p>
	<form method="POST" action="bdreg?status=1" name="Form" id="Form" >
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<input type="hidden" name="cjpay" size="10" value="${cjpay}" readonly><input type="hidden" name="remark" size="8" value="3" readonly><input type="hidden" name="user" size="10" value="${userName}" readonly>
	<table border="0" width="52%" id="table1" height="220" cellspacing="1">
		<tr>
			<td align="right" width="42%">选择接点人：</td>
			<td width="56%" colspan="2"><font color="#000080"><b><input type="hidden" name="up" size="10" value="${up}" readonly>${up}</b></font></td>
		</tr>
		<tr>
			<td align="right" width="42%">开户用户名：</td>
			<td width="56%" colspan="2"><font color="#FF0000"><b><input type="hidden" name="bduser" size="10" value="${bduser}" readonly>${bduser}</b></font></td>
		</tr>
		<tr>
			<td align="right" width="42%">选择套餐：</td>
			<td width="56%" colspan="2"><font color="#008000"><b>${cjpay}</b></font><input type="hidden" name="pa1j" size="8" value="${pa1j}"><input type="hidden" name="pa2j" size="8" value="${pa2j}"></td>
		</tr>
		<c:if test="${cjpay<9000}">
		<tr>
			<td align="right" width="42%">您的手机号码：</td>
			<td width="56%" colspan="2">${call}</td>
		</tr>
		<tr>
			<td align="right" width="42%" height="34">手机验证码：</td>
			<td width="15%" height="34"><input type="text" name="ceid" size="8"></td>
			<td width="40%" height="34"><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></td>
		</tr>
		<tr>
			<td align="right" width="98%" colspan="3" height="27"><p align="center"><b><font color="#FF0000" size="2">为了账户安全，选择一币开户需写入手机验证码！</font></b></td>
		</tr>
       </c:if>
		<tr>
			<td align="right" colspan="3" bgcolor="#EAEAEA" height="31"><p align="center"><span style="font-size: 11pt"><font color="#800000">将从您的（</font><b>${userName}</b><font color="#800000">）<c:if test="${cjpay<9000}">一币</c:if><c:if test="${cjpay>=9000}">报单币</c:if>账户扣除</font><font color="#0000FF">${cjpay}</font></span></td>
		</tr>
	</table>
		<p><input type="submit" value="确认无误" name="B1" onClick="{if(confirm('确定开通该会员吗?')){this.style.visibility='hidden';return true;}return false;}" style="font-size: 14pt; color: #0000FF; font-weight: bold"></p>
</form>
<p align="center"> </p>
<p align="center"><b><font color="#FF0000">重要提示：</font></b>确认无误后，系统进入核算中...期间请停止其它操作，更不要关闭本页！</p>
<p align="center"> </p>
</div>