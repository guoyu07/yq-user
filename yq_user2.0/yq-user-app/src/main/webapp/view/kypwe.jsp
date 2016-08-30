<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('该<s:text name='viphgyb.jsp.hgyb.jsp.35034724'/>已支付完成，请不要重要<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.274591465'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('输入的<s:text name='reg.jsp.reg.jsp.29623262'/>不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1103003435'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('输入的<s:text name='reg.jsp.reg.jsp.630954966'/>不正确，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1747166923'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.806479'/>验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='vipkypwe.jsp.kypwe.jsp.-1572413666'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('支付<s:text name='reg1.jsp.reg1.jsp.799375'/>！');location.replace('http://www.kypwb.com/interface/YiBiPayReturn?act=payment&op=returnyibi&sn=${sn}&paycode=success&payamount=<fmt:formatNumber type="number" value="${gwpay}" pattern="0.00" maxFractionDigits="2" minFractionDigits="2"/>&pid=1&order_sn=${order}&payuser=${user}');</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('充值<s:text name='reg1.jsp.reg1.jsp.799375'/>！');location.replace('http://www.kypwb.com/interface/YiBiPayReturn?act=payment&op=returnyibi&sn=${sn}&paycode=success&payamount=<fmt:formatNumber type="number" value="${gwpay}" pattern="0.00" maxFractionDigits="2" minFractionDigits="2"/>&pid=2&order_sn=${order}&payuser=${user}');</script></c:if>
<html>
<head>
<title></title>
<head>

<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script src="/scripts/sms.js"></script>

<script language="JavaScript"> 
function checkdate()  {
  if (Form.user.value=="") {     alert("请填入您的<s:text name='reg.jsp.reg.jsp.29623262'/>!");  Form.user.focus();      return false;    }
  if (Form.pa01.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1841070946'/>!");  Form.pa01.focus();      return false;    }
  if (Form.pa02.value=="") {      alert("请填入您的<s:text name='reg.jsp.reg.jsp.630954966'/>!");  Form.pa02.focus();      return false;    }
  	
    $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms2?op=10&toUserName="+Form.user.value, data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='reg.jsp.reg.jsp.806479'/>验证码发送失败"); return false; }
		settime($("#btn"));
		alert("<s:text name='reg.jsp.reg.jsp.806479'/>验证码发送<s:text name='reg1.jsp.reg1.jsp.799375'/>");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.hgcode.value=="") {   alert("请先点击<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>，然后再填入您的<s:text name='reg.jsp.reg.jsp.806479'/>收到的验证码");  Form.mcygcode.focus();   return false;    }
  return true;
} 
</script>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="POST" action="kypwe?ybf=actok" id="Form" name="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	<p>　</p>
	<p><font size="6" color="#FF0000">${title}</font></p>
	<p><font color="#0000FF">测试期间同一<s:text name='reg.jsp.reg.jsp.734362'/>及证件号30天内只能消费10000</font></p>
	<table border="0" id="table1" height="308" width="560">
		<tr>
			<td width="214" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.35034724'/>：</td>
			<td width="336" align="left" colspan="2"><font color="#008000">${order}<input type="hidden" name="order" size="20" value="${order}"></font></td>
			</tr>
		<tr>
			<td width="214" align="right"><s:text name='viphgyb.jsp.hgyb.jsp.1086606367'/>：</td>
			<td width="336" align="left" colspan="2"><input type="hidden" name="gwpay" size="20" value="${gwpay}" readonly>${gwpay}<input type="hidden" name="sid" size="20" value="${sid}" readonly><input type="hidden" name="pid" size="20" value="${pid}" readonly></td>
		</tr>
		<tr>
			<td width="214" align="right"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.26044037'/>(2%)：</td>
			<td width="336" align="left" colspan="2">${fee}</td>
		</tr>
		<tr>
			<td width="214" align="right"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.675858010'/>：</td>
			<td width="336" align="left" colspan="2"><b><font color="#FF0000">${ybsl}<input type="hidden" name="ybpay" size="20" value="${ybsl}"></font></b></td>
		</tr>
		<tr>
			<td width="214" align="right"><s:text name='reg.jsp.reg.jsp.29623262'/>：</td>
			<td width="336" align="left" colspan="2"><b><font color="#0000FF">${gwuser}<input type="text" name="user" size="20" onKeyUp="value=value.replace(/[\W]/g,'')"><input type="hidden" name="remark" size="5" value="11" readonly></font></b></td>
			</tr>
		<tr>
			<td width="214" align="right"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>：</td>
			<td width="336" align="left" colspan="2"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right"><s:text name='reg.jsp.reg.jsp.630954966'/>：</td>
			<td width="336" align="left" colspan="2"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right" height="30"><s:text name='reg.jsp.reg.jsp.806479'/>验证码：</td>
			<td width="81" align="right" height="30"><input type="text" name="hgcode" size="10"></td>
			<td width="252" align="right" height="30"><p align="left"><input id="btn" type="button" onclick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="46"><p align="center">　</td>
			<td width="336" align="right" height="46" colspan="2"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="确定支付" name="B1" onClick="{if(confirm('确定支付吗?')){this.style.visibility='hidden';return true;}return false;}" style="font-family: <s:text name='sfz_eng.html.sfz_eng.html.857276'/>_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p>请不要使用它人账户进行<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/>，一经发现3倍罚款！</p>
	</div>
</form>
<script type="text/javascript">
btnStatus($("#btn"));
</script>
