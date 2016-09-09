<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('vip<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1100795047'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.386612509'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1556510827'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.594399145'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.1926370358'/>');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.jcname.value=="") {      alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-453586483'/>!");      return false;    } 
  if (Form.jzpay.value<5000) {      alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.97164307'/>5000!");      return false;    } 
  if (Form.syuser.value=="") {      alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1479911832'/>!");      return false;    }
  if (Form.jcname.value==Form.syuser.value) {      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");      return false;    }
  if (Form.pa3.value=="") {      alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1989247238'/>!");      return false;    } 
  if (!chkinteger(Form.jzpay.value)){
	alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.375811844'/>!');
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
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
				<%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1788295765'/></span>
					</div>
					<div class="content-form">
						<form class="form form4 h463" method="POST" name="Form" onSubmit="return checkdate()" action="bdbzz?status=1">
							<p><label class="c-r"><s:text name='viewlinks.html.links.html.1159182'/><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><input type="text" name="jcname" size="15" value="${userName}" readonly></p>
							<p><label><s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.1129373465'/>：</label><select size="1" name="jzpay">
		<option selected value="10000">--1<s:text name='wan'/>--</option>
		<option value="20000">--2<s:text name='wan'/>--</option>
		<option value="30000">--3<s:text name='wan'/>--</option>
		<option value="50000">--5<s:text name='wan'/>--</option>
		</select></font><font color="#008000" size="2"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/>：</font><b><font color="#0000FF" size="2">${sybdb}</font></b></p>
							<p><label><s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1542679092'/>：</label><input type="text" name="syuser" size="15"></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3" size="20"></p>
							<p><label></label><button class="but1" type="submit" onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614a'/></button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
