<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.2024869980'/> ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.-1321238879'/>！');location.replace('jztojb');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipmysl.jsp.mysl.jsp.-2099694066'/>！');location.replace('gpjy');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
	 function checkdate()  {  
	  if (Form.txpay.value=="") {      alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-477498021'/>!");  Form.txpay.focus();     return false;    } 
	  if (Form.txpay.value==0) {      alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.175650976'/>!");      return false;    }
	  if (Form.txpay.value<1) {      alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.2087317176'/>");      return false;    }
	  if (Form.txpay.value>2000) {      alert("<s:text name='iewjflc-jfmr.jsp.jflc-jfmr.jsp.1250924413'/>");      return false;    }
	  if (Form.txpay.value>${zdjyg}) {      alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.150034015'/>${zdjyg}");      return false;    }
	  if (!chkinteger(Form.txpay.value)){
		alert('<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1758918826'/>!');
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
	  if (Form.pa3.value=="") {      alert("<s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1989247238'/>!");  Form.pa3.focus();    return false;    } 
	return true;  }  
 </script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/></span>
					</div>
					<div class="content-form">
						<p><s:text name='vipmcsl.jsp.mcsl.jsp.227454429'/>：<strong>${jydb}</strong> <s:text name='vipmcsl.jsp.mcsl.jsp.227454429a'/>：<strong><c:if test="${jygj<1}">${jygj}</c:if><c:if test="${jygj>=1}">${jygj}</c:if></strong></p>
						<form class="form form1 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=1">
							<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>${userName}</p>
							<p><label><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.2135544875'/></font></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3"></p>
							<p><label></label><button class="but1 but2" type=submit><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.-380021763'/></button></p>
						</form>
					</div>
				</div>
				<div class="content-box2 mt10">
					<div class="content-title">
						<span><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1696499005'/></span>
					</div>
					<c:if test="${empty dataList}">
						<div class="content-tisp">
							<h5><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.807971267'/></h5>
						</div>
					</c:if>
					<c:if test="${not empty dataList}">
					<div class="content-tabledown " >
						<table>
							<tr>
								<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1172477375'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.787632912'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.861206825'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.mysl}</td>
								<td>${data.dbjc}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td><a href="qxqg?qxid=${data.id}" style="text-decoration: none"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.836270'/></a></td>
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
