<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.1923400400'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.1141572332'/>！');location.replace('epmcjl');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-830018135'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-898207976'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.529929694'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.174913287'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.262431727'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.1396615689'/>！');location.href='tjz'</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='vipbdbjzpay.jsp.bdbjzpay.jsp.594399145'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='vipbdbjzpay.jsp.bdbjzpay.jsp.1926370358'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='Transferpolicycurrencylessthan0'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-1964813948'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==101}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.573081321'/>');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language = "JavaScript"> 
//<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.682913'/>操作    
function CheckAll(form) {
 for (var i=0;i<form.elements.length;i++) {
 var e = form.elements[i];
 if (e.name != 'chkall') e.checked = form.chkall.checked;
 }
 }
 
 function cf(){
	 if(form.tp.value==0){
		 return confirm('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-474644738'/>?');
	 }else{
		 return confirm('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-1733349801'/>?');
	 }
 }
</script>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-48484697'/></span>
					</div>
					<c:if test="${empty dataList}">
					<div class="a-transfer">
						<p><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.768356219'/>!</p>
					</div>
					</c:if>
					<c:if test="${not empty dataList}">
					<form method="POST" action="tjz?status=1" name="form" id="form">
					<div class="a-tableTop z-cb">
					<p class="z-r"><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-146135140'/>：<span class="c-r z-b">${userName}</span> </p>
					</div>
					<div class="a-tableTop z-cb">
					<p class="z-l"><input type='checkbox' name=chkall onclick='CheckAll(this.form)'><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.682913'/></p>
					</div>
					<div class="content-table">
						<table>
						<s:iterator var="data" value="dataList">
							<tr>
								<td><input type="checkbox" name="fromUsers" value="${data.username}"></td>
								<td>${data.username}</td>
								<td>${data.name}</td>
								<td><input type="hidden" name="tpay" size="10" value="${data.pay}" readonly>${data.pay}<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></td>
								<td>${data.scores}<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.35660508'/></td>
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
