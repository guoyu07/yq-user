<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('交易市场已有积分在出售中，请按需求点击 [我要买入] ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('操作错误，金币不足，请检查输入是否正确！');location.replace('jztojb');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('买入挂牌成功！');location.replace('gpjy');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
	 function checkdate()  {  
	  if (Form.txpay.value=="") {      alert("请输入需要买入的积分数量!");  Form.txpay.focus();     return false;    } 
	  if (Form.txpay.value==0) {      alert("买入数量不能为零!");      return false;    }
	  if (Form.txpay.value<1) {      alert("买入数量至少为1个积分");      return false;    }
	  if (Form.txpay.value>2000) {      alert("目前最大每次买入数量为2000，成功后可继续发布买入");      return false;    }
	  if (Form.txpay.value>${zdjyg}) {      alert("买入数量最大为${zdjyg}");      return false;    }
	  if (!chkinteger(Form.txpay.value)){
		alert('买入数量只能为整字!');
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
	  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");  Form.pa3.focus();    return false;    } 
	return true;  }  
 </script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>发布积分买入</span>
					</div>
					<div class="content-form">
						<p>您当前的金币剩余:<strong>${jydb}</strong> 当前的交易价为：<strong><c:if test="${jygj<1}">${jygj}</c:if><c:if test="${jygj>=1}">${jygj}</c:if></strong></p>
						<form class="form form1 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=1">
							<p><label>用户名：</label>${userName}</p>
							<p><label>买入数量：</label><input type="text" name="txpay"><font style="font-size: 9pt" color="#FF0000">** 最大可买入</font><font style="font-size: 9pt" color="#008000">${zdjyg}</font><font style="font-size: 9pt" color="#FF0000">个积分</font></p>
							<p><label>二级密码：</label><input type="password" name="pa3"></p>
							<p><label></label><button class="but1 but2" type=submit>确 定 买 入</button></p>
						</form>
					</div>
				</div>
				<div class="content-box2 mt10">
					<div class="content-title">
						<span>当前求购明细</span>
					</div>
					<c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5>暂无记录</h5>
						</div>
					</c:if>
					<c:if test="${not empty dataList}">
					<div class="content-table">
						<table>
							<tr>
								<th width="75">用户名</th>
								<th>求购积分数量</th>
								<th>所需金币</th>
								<th>求购时间</th>
								<th>操作</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.mysl}</td>
								<td>${data.dbjc}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td><a href="qxqg?qxid=${data.id}" style="text-decoration: none">撒销</a></td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag /></p>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>