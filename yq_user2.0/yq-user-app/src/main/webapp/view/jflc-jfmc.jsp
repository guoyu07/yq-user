<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-949213936'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1341989901'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-498016988'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/><s:text name='vipmcsl2.jsp.mcsl2.jsp.440060053'/> ${fcxt.zdj} ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.908656802'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2045778169'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.115010359'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1038261267'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.809721657'/>！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1997417452'/>!');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
<script language="JavaScript">
 function checkdate()  {  
  if (Form.jygj.value=="") {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1510332280'/>");  Form.jygj.focus();    return false;    } 
  if (Form.jygj.value<${fcxt.zdj}) {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.440060053'/> ${fcxt.zdj} !");  Form.jygj.focus();    return false;    }
  if (Form.jygj.value>${fcxt.jygj}+0.03) {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1972445948'/>");  Form.jygj.focus();    return false;    } 
    if (!chkinteger1(Form.jygj.value)){
	alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2139966856'/>');
	document.Form.jygj.focus;
	return (false);
 }
function chkinteger1(checkStr1)
{
var re=/^(0|[1-9]+)\.\d{0,2}$|^(0|[1-9]+)$/;
return re.test(checkStr1)
}
  if (Form.txpay.value=="") {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1510493077'/>!");  Form.txpay.focus();    return false;    } 
  if (Form.txpay.value==0) {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1384480305'/>");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1416619015'/>!');
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
  if (Form.txpay.value<10) {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.603950472'/>!");      return false;    }
  if (Form.txpay.value>3000) {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1469760371'/>!");      return false;    }
  if (Form.txpay.value>${gcuser.jyg}) {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1086289612'/>");      return false;    } 
  if (Form.pa3.value=="") {      alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>");   Form.pa3.focus();   return false;    } 
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
						<span><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.1817700589'/></span>
					</div>
					<div class="content-form">
						<p><s:text name='vipmcsl.jsp.mcsl.jsp.227454429'/>：<strong>${gcuser.jyg}</strong><s:text name='vipmcsl.jsp.mcsl.jsp.227454429a'/>：<strong><c:if test="${fcxt.jygj<1}">${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></strong></p>
						<form class="form form1 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="mcsl?status=1">
							<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>${userName}</p>
							<p><label><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/>：</label><input type="text" name="jygj" size="10" maxlength="4"></p>
							<p><label><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1291663539'/>：</font><font style="font-size: 9pt" color="#008000">${gcuser.jyg}</font></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3"></p>
							<p><label></label><button class="but1 but2"  type=submit><s:text name='vipmcsl.jsp.mcsl.jsp.-378816520'/></button></p>
						</form>
						<p class="z-tc"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-602511626'/></p>
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
					<div class="content-tabledown ">
						<table>
							<tr>
								<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/></th>
								<th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/></th>
								<th><s:text name='viewjflc-details.jsp.jflc-details.jsp.784049096'/></th>
								<th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.747890431'/></th>
								<th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.635139184'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.mcsl}</td>
								<td>${data.sysl}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td>${data.pay}</td>
			                    <td><a href="/diyjygj?sgid=${data.id}"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.635139184'/></a></td>
			                    <td><c:if test="${data.newjy!=3}"><a href="qxyjg?qxid=${data.id}" style="text-decoration: none"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.836270'/></a></c:if></td>
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
