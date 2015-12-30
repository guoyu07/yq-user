<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您已申请的卖出尚未交易成功，暂时不能使用转账功能，谢谢！');location.replace('epmcjl');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('操作错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('选中了不存在的用户');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('非同名用户,不能转');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您至少选择一个需要转账的用户名，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('非双区用户不能使用该功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('您已成功批量转账！');location.href='tjz'</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('被转用户一币发生了改变');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language = "JavaScript"> 
//全选操作    
function CheckAll(form) {
 for (var i=0;i<form.elements.length;i++) {
 var e = form.elements[i];
 if (e.name != 'chkall') e.checked = form.chkall.checked;
 }
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
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>同姓名账户批量转账</span>
					</div>
					<c:if test="${empty dataList}">
					<div class="a-transfer">
						<p>没有可以转账的用户!</p>
					</div>
					</c:if>
					<c:if test="${not empty dataList}">
					<form method="POST" action="tjz?status=1" name="form">
					<div class="a-tableTop z-cb">
						<p class="z-l"><input type='checkbox' name=chkall onclick='CheckAll(this.form)'>全选</p>
						<p class="z-r">二级密码：<input type="password" name="pa2j" size="15"> <button type="submit" onClick="return confirm('一经转账的一币不再提供卖出，确定了吗?')">批量提交转至</button>当前登陆的用户名：<span class="c-r z-b">${userName}</span> </p>
					</div>
					<div class="content-table">
						<table>
						<s:iterator var="data" value="dataList">
							<tr>
								<td><input type="checkbox" name="fromUsers" value="${data.username}"></td>
								<td>${data.username}</td>
								<td>${data.name}</td>
								<td><input type="hidden" name="tpay" size="10" value="${data.pay}" readonly>${data.pay}</td>
							</tr>
						</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/></p>
						</div>
					</div>
					</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>