<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==1}"><script language=javascript>alert('发布一币数量有误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您发布的一币数量不能大于您剩余一币  ${gcuser.pay}，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，您有 ${gcuser.vippay}-一币是[服务中心转入]或[游戏收益部分]，此额度不提供卖出，仅用于开户使用，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，您二级密码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，手机验证码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，您发布的一币数量不能小于100，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您已发布成功过，请耐心等待处理完成后再发布第二笔，或认购方已向您付款，请先确认收款再发布第二笔，谢谢！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==-1}"><script language=javascript>alert('您的发布已经成功提交，发布成功后如有认购一币方向您下单后2小时内打到您的收款账号上！请您及时查收！');location.replace('epmcjl');</script></c:if>
<html>
<head>
<title></title>
</head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value==0) {      alert("请选择卖出一币的数量!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('卖出一币只能为整字!');
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
  if (Form.txpay.value> ${gcuser.pay} ) { <c:if test="${transferType==1}"> alert("您的发布不能大于您可卖的${gcuser.pay-gcuser.vippay}一币哦!"); </c:if> <c:if test="${transferType==2}"> alert("您的发布不能大于您可卖的${gcuser.pay}一币哦!"); </c:if>     return false;    }
  if (Form.txpay.value<100) {      alert("您的发布不能小于100一币!");      return false;    } 
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
	
   $("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("手机验证码发送失败"); return false; }
		settime($("#btn"));
		alert("手机验证码发送成功");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.ybcodeid.value=="") {   alert("请先点击获取验证码，然后再填入您的手机收到的验证码");  Form.ybcodeid.focus();   return false;    }
  return true;
}
</script>
<body bgcolor="#FFF3D0" text="#000000" leftmargin="0" topmargin="3" marginheight="0"><div align="center"><b>
     <p></p>
     <p></p>
	 <p><font color="#008000" face="隶书" style="font-size: 30pt">发布一币卖出(求现)</font></p>
	<table border="0" width="75%" id="table1" height="58" bgcolor="#FFEEEE">
	 <tr>
	 <td><b>尊敬的玩家<font color="#FF0000">${gcuser.name}</font>您好！您申请发布后，认购一币-方向您下单后2小时内打到您的收款账号上！</td>
	 </tr>
	 <tr>
	 <td>您当前可卖一币为：<b><font color="#008000"><c:if test="${transferType==1}"><c:if test="${gcuser.pay<1}"> 0${gcuser.pay-gcuser.vippay} </c:if><c:if test="${gcuser.pay>=1}"> ${gcuser.pay-gcuser.vippay} </c:if></c:if><c:if test="${transferType==2}">${gcuser.pay}</c:if></font></b> 一币</td>
	 </tr>
	 </table>
	 <table width="75%" border="0" cellpadding="0" class="border" bgcolor="#800080">
    <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" width="935">
    <form method="POST" align="center" name="Form" id="Form" onSubmit="return checkdate1()" action="userpay?status=1">
    <input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
    <div align="center"><TABLE width="100%" border=0 height="352" cellpadding="2" bgcolor="#FFFFFF">
    <TBODY>
    <TR class=content><TD bgColor=#ffffff width="27" align="right" rowspan="11"><p align="center">　</TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="30"><font style="font-size: 11pt; font-weight:700">用户名：</font></TD>
    <TD width="571" bgColor=#ffffff height="30"><font color="#FF0000"><b>${userName}</b></font><input type="hidden" name="user" size="10" value="${userName}" readonly></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="33"><font style="font-size: 10pt">卖出一币数量：</font></TD>
      <TD width="571" bgColor=#ffffff height="33"><font style="font-size: 9pt" color="#FF0000">
		<select size="1" name="txpay">
		<option selected value="0">=选择卖出数据=</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="500">500</option>
		<c:if test="${transferType==1}">
		<option value="1000">1000</option>
		<option value="2000">2000</option>
		</c:if>
		</select> **</font><font style="font-size: 9pt">当前可卖一币为：</font><font style="font-size: 9pt; " color="#FF0000"><c:if test="${transferType==1}"><c:if test="${gcuser.pay<1}"> 0${gcuser.pay-gcuser.vippay} </c:if><c:if test="${gcuser.pay>=1}"> ${gcuser.pay-gcuser.vippay} </c:if></c:if><c:if test="${transferType==2}">${gcuser.pay}</c:if></font></TD>
    </TR>
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="28"><b>
     	<font style="font-size: 10pt; ">二级密码：</font></TD>
      <TD width="571" bgColor=#ffffff height="28"><b>
     	<font size="3"> <span style="font-size: 11pt"><INPUT name="pa3" size=15 type=password></span></font><font style="font-size: 9pt" color="#FF0000"> **</font><span style="font-size: 10pt"><input type="hidden" name="remark" size="8" value="4" readonly></span></TD>
    </TR><c:if test="${gcuser.ganew!=0}">
    <TR class=content> 
      <TD width="317" bgColor=#ffffff align="right" height="39"><b>
     	<font style="font-size: 10pt; ">手机验证码：</font></TD>
      <TD width="571" bgColor=#ffffff height="39"><input type="text" name="ybcodeid" size="15"><b><font style="font-size: 9pt" color="#FF0000"> **</font><input id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"></b></TD>
    </TR></c:if>
    <TR class=content> 
		<TD width="897" bgColor=#ffffff align="right" height="30" colspan="2"><p align="left"><font size="2" color="#0000FF"><b>警告：</b></font><font color="#FF0000" size="2">请认真核对以下收款信息，如有错误请马上点<a href="login2j?inputUrl=login2j.jsp" style="text-decoration: none">修改个人资料</a>，再进行发布卖出！如不认真核对，造成付款不成功，该笔卖出将冻结，申请解冻将加收20%手续费！</font></TD>
    </TR>
    <TR class=content> 
		<TD width="317" bgColor=#ffffff align="right" height="29"><span style="font-size: 10pt">真实姓名：</span></TD>
		<TD width="571" bgColor=#ffffff height="29"><font color="#800080">${gcuser.name}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="33"><b><span style="font-size: 10pt">手机号码：</span></TD>
		<TD width="571" bgColor=#ffffff height="33"><b><font color="#800080">${gcuser.simpleCall}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="25"><span style="font-size: 10pt">收款方式：</span></TD>
		<TD width="571" bgColor=#ffffff height="25"><font color="#800080">${gcuser.bank}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="27"><span style="font-size: 10pt">账号：</span></TD>
		<TD width="571" bgColor=#ffffff height="27"><b><font color="#800080">${gcuser.card}</font></TD>
    </TR>
    <TR class=content><TD width="317" bgColor=#ffffff align="right" height="24"><font size="2">开户行：</font></TD>
		<TD width="571" bgColor=#ffffff height="24"><font size="2">${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}支行</font></TD>
    </TR>
    <TR class=content>
		<TD colSpan=3 align=middle bgColor=#ffffff width="931" height="29"><p style="margin-top: 0; margin-bottom: 0"><p style="margin-top: 0; margin-bottom: 0"><INPUT class=normalButton type=submit value="发 布 卖 出" name=submit2 style="font-size: 11pt" onClick="return confirm('提示：发布卖出的一币如低于500（含500）交易手续费为15%，高于500的则为10%，您确定了吗？')"></TD>
    </TR>
  </TBODY>
</TABLE>
</div>
</form>
    </td>
    </tr>
  </table>
  <p style="margin-top: 0; margin-bottom: 0">　</p>
  <table border="1" width="75%" id="table2" style="border-collapse: collapse" bgcolor="#E6FFFF">
  <tr>
  <td><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 11pt" color="#FF0000">发布卖出说明：</font></p><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt">一、最低100一币起就可以发布卖出，每次发布需等上一次处理（您确认收到款）了才可以发起第二次，发布成功后我们认购一币-方向您下单后2小时内打到您的收款账号上！</font></p>
  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font style="font-size: 10pt" color="#800080">二、</font><font size="2" color="#800080">一币卖出低于500（含500），交易手续费为：15%，高于500则为10%。</font></p>
	</td>
	</tr>
	</table>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font size="5" color="#FF0000" face="楷体_GB2312">一币-理财交易规则</font></p>
		<font size="3">
			  <table border="0" width="90%" id="table3">
					<tr>
						<td>
						<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
						一、认购方（付款方）责任<br>
						1、超过“2小时”没有成功付款到发布方指定银行账号，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。<br>
						2、并没有成功付款到发布方指定银行账号，提前操作或恶意操作，影响正常交易流程，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。<br>
						二、发布卖出方（收款方、求现方）责任<br>
						1、当付款方操作成功，收款方实际收到相应款项，必须于“48小时”内登录平台点“一币-理财”下“一币-卖出明细”查看该笔交易状态并进行“我已收到款项-通知系统给认购方增加相应的一币-余额”的操作！<br>
						2、发布卖出（求现）前请先确认自己的收款账号能正常使用，因您的收款账号错误或其它原因不能正常收款，影响付款方正常交易时间，付款人向客服提出申诉，该笔交易将绶发。<br>
						3、为了交易公平公正，交易双方有一定的约束，系统启动信星方案，每个用户初始为“5星”，每违反一次交易规则扣除“1星”，当剩下“3星”，将被限制发布和认购一星期，当剩下“2星”，将被限制发布和认购两星期，两星期内将不能获得平衡奖金，当剩下“1星”，将被限制发布和认购三星期，三星期内将不能获得平衡奖金和领导奖金，当剩下“0星”，将被限制发布和认购60天，60天内将不能获得平衡奖金和领导奖金，您当前为：<b><font color="#FF0000">“${gcuser.cxt}星”</font></b>。</td>
					</tr>
				</table>
	<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</font></div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"));
</script>