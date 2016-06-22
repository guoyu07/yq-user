<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('登录密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('捐助数量不能小于0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('捐助数量最低为100！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('转出用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('转入用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('添加失败！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('YB不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！捐助成功！');location.replace('datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language="JavaScript"> 
function checkdate()  {  
	  if (Form.jzpay.value=="") {      alert("请填写您要转账的一币!");      return false;    } 
	  if (Form.jzpay.value<99) {      alert("捐助的一币必须大于等于100!");      return false;    } 
	  if (Form.jzpay.value>${gcuser.pay})    {   alert("您的转账一币不能超过您剩余的一币${gcuser.pay}");      return false;    } 
	  if (Form.pa3.value=="") {      alert("请输入二级密码!");      return false;    } 
	  if (Form.pa.value=="") {      alert("请输入登录密码!");      return false;    } 
	  if (!chkinteger(Form.jzpay.value)){
		alert('转账一币只能为整字!');
		document.Form.jzpay.focus;
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
return true;  
}  
</script>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/yblc.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>一币捐助区</span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g">您的用户名是 <span class="c-r">${userName}</span></p>
						<p class="z-b" style="padding-left:70px;">您的一币为：<b class="c-r">${gcuser.pay}</b></p>
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="ybPresent?status=1">
							<p><label>捐助数量：</label><input style="width:100px;" type="text" name="jzpay" size="15" maxlength="10"></p>
							<p><label>输入登录密码：</label><input type="password" name="pa" size="20"></p>
							<p><label>输入二级密码：</label><input type="password" name="pa3" size="20"></p>
							<p><label></label><button class="but1" type=submit  name=submit2  onClick="return confirm('提示：您确定了吗？')">确 定 转 账</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>