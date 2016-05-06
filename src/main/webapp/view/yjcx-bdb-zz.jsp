<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('vip用户才能玩这个功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('不能转给自己！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('只能转给自己团队的并已进入双区的玩家！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('转账金额不能小于0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('转出用户名报单币不能大于剩余报单币 ');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('接收的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jcname.value=="") {      alert("请写入转出用户名!");      return false;    } 
  if (Form.jzpay.value<5000) {      alert("转账的金额必须大于5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("请填写接收用户名!");      return false;    }
  if (Form.jcname.value==Form.syuser.value) {      alert("不能转给自己!");      return false;    }
  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  if (!chkinteger(Form.jzpay.value)){
	alert('转账金额只能为整字!');
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
   return true;  }  
 </script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>
				<%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>报单币转账</span>
					</div>
					<div class="content-form">
						<form class="form form4 h463" method="POST" name="Form" onSubmit="return checkdate()" action="bdbzz?status=1">
							<p><label class="c-r">转出用户名：</label><input type="text" name="jcname" size="15" value="${userName}" readonly></p>
							<p><label>转账数量：</label><select size="1" name="jzpay">
		<option selected value="10000">--1万--</option>
		<option value="20000">--2万--</option>
		<option value="30000">--3万--</option>
		<option value="50000">--5万--</option>
		</select></font><font color="#008000" size="2">剩余：</font><b><font color="#0000FF" size="2">${sybdb}</font></b></p>
							<p><label>接受用户名：</label><input type="text" name="syuser" size="15"></p>
							<p><label>二级密码：</label><input type="password" name="pa3" size="20"></p>
							<p><label></label><button class="but1" type="submit" onClick="return confirm('提示：您确定了吗？')">确 定 转 账</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>