<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-125850672'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-271901504'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.386612509'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.2022589602'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1681297541'/>60w！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1612326297'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1681297541'/>5w！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.306392805'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.231633818'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1495661441'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.571194964'/>vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-2079296314'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.246684949'/>！');location.replace('datepay');</script></c:if>
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
	  if (Form.jzpay.value<99) {      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1705620723'/>100!");      return false;    } 
	  if (Form.jzpay.value>${gcuser.pay})    {   alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.2136440982'/>${gcuser.pay}");      return false;    } 
	  if (Form.jzuser.value=="") {      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.1569959089'/>!");      return false;    }
	  if (Form.jzuser.value=="${gcuser.username}") {      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");      return false;    }
	  if (Form.pa3.value=="") {      alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1989247238'/>!");      return false;    } 
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

function Check(user)
{
	if ( user==""){
		alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
		return false;
	}
	$.post("checkUserName?user="+user,null, function(response) {
		if(response.code==0){//注册<s:text name='reg1.jsp.reg1.jsp.799375'/>
			alert('<s:text name='reg.jsp.reg.jsp.29623262'/>：['+user+']，<s:text name='reg.jsp.reg.jsp.734362'/>:['+response.name+"]");
		}else{
			alert('<s:text name='reg.jsp.reg.jsp.29623262'/>：'+user+'，<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1911170702'/>！');
		}
		return true;
	});
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
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewlinks.html.links.html.1159182'/></span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g"><s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1396688147'/> <span class="c-r">${userName}</span></p>
						<p class="z-b" style="padding-left:70px;"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1994385923'/>：<b class="c-r">${gcuser.pay}</b></p>
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="vipjzpay?status=1">
							<p><label class="c-r"><s:text name='vipbdbjzpay.jsp.bdbjzpay.jsp.-1410198515'/>：</label><input type="text" name="jzuser" id="jzuser" size="15"><input type="button" onClick="Check(document.getElementById('jzuser').value)" value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792a'/>" name="B3" style="cursor: pointer"></p>
							<p><label><s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.1129174203'/>：</label><input style="width:100px;" type="text" name="jzpay" size="15" maxlength="10"></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3" size="20"></p>

							<p><label></label><button class="but1" type=submit  name=submit2  onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')"><s:text name="viewyblc-mallback.jsp.yblc-mallback.jsp.537856614a"></s:text></button></p>
							<c:if test="${gcuser.vip==2}"><p><a href="vipcjb"><s:text name="viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139"></s:text>（<s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.989728617'/>：${gcuser.vipljcjb}）（<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139a'/>：${gcuser.vipsycjb}）（<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/>：${gcuser.vipcjcjb}）</a></p></c:if>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
