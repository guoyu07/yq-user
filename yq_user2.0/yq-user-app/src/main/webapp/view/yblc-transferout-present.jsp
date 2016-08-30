<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.630954966'/>不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2053458535'/>0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2011642676'/>100！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewlinks.html.links.html.1159182'/><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1597545170'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('转入<s:text name='resetUserPass.jsp.resetUserPass.jsp.-1597545170'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.859836633'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('YB<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.655686'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！捐助<s:text name='reg1.jsp.reg1.jsp.799375'/>！');location.replace('datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language="JavaScript"> 
function checkdate()  {  
	  if (Form.jzpay.value=="") {      alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");      return false;    } 
	  if (Form.jzpay.value<99) {      alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.387731406'/>100!");      return false;    } 
	  if (Form.jzpay.value>${gcuser.pay})    {   alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2136440982'/>${gcuser.pay}");      return false;    } 
	  if (Form.pa3.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='reg.jsp.reg.jsp.630954966'/>!");      return false;    } 
	  if (Form.pa.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>!");      return false;    } 
	  if (!chkinteger(Form.jzpay.value)){
		alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1582955249'/>!');
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
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/yblc.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2003028320'/></span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g"><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1396688147'/> <span class="c-r">${userName}</span></p>
						<p class="z-b" style="padding-left:70px;"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1994385923'/>：<b class="c-r">${gcuser.pay}</b></p>
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="ybPresent?status=1">
							<p><label><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.778584440'/>：</label><input style="width:100px;" type="text" name="jzpay" size="15" maxlength="10"></p>
							<p><label><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1306168857'/>：</label><input type="password" name="pa" size="20"></p>
							<p><label><s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1603016952'/>：</label><input type="password" name="pa3" size="20"></p>
							<p><label></label><button class="but1" type=submit  name=submit2  onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')">确 定 转 账</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
