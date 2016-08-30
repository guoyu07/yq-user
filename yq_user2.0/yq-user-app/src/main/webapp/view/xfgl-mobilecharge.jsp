<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-265534370'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-2137282093'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.111039607'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1068487521'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.410350332'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1213017603'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.537403443'/>！');location.replace('datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	
	<script language="JavaScript">
	 function checkdate()  {
	  if (Form.call.value=="") {      alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>!");  Form.call.focus();      return false;    }
	  if (Form.call2.value=="") {      alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-2071172198'/>!");  Form.call2.focus();      return false;    }
	  if (Form.call.value.length<11) {      alert("<s:text name='reg.jsp.reg.jsp.-415194682'/>!"); Form.call.focus();     return false;    }
	  if (Form.call.value.length>11) {      alert("<s:text name='reg.jsp.reg.jsp.-669883811'/>!"); Form.call.focus();     return false;    }
	  if (Form.call2.value.length<11) {      alert("<s:text name='reg.jsp.reg.jsp.-415194682'/>!"); Form.call2.focus();     return false;    }
	  if (Form.call2.value.length>11) {      alert("<s:text name='reg.jsp.reg.jsp.-669883811'/>!"); Form.call2.focus();     return false;    }
	  if (Form.call.value != Form.call2.value) {      alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1355749389'/>!"); Form.call.focus();    return false;    }
	  if (Form.pa3.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-1989247238'/>!");    Form.pa3.focus();  return false;    }
	  
	  $("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=9", data, function(response) {
			$("#btn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1886666017'/>"); return false; }
			settime($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
			alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1886721436'/>");
		});
		return false;
	}
	  
	  function checkdate1()  {  
	  if (Form.smsCode.value=="") {   alert("<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
	  return true;
	} 
	</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/xfgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/></span>
					</div>
					<div class="content-form">
						<form class="form form3" style="height:523px;" action="?status=1" method="post" onSubmit="return checkdate1()" name="Form" id="Form">
							<p><label class="c-r"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>${userName}</p>
							<p><label class="c-r"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.772129628'/>：</label><input type="text" name="call"  size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')" /></p>
							<p><label><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1462957751'/>：</label><input type="text"  name="call2"  size="20" maxlength="11" onKeyUp="value=value.replace(/[^\d]/g,'')" /></p>
							<p><label><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/>：</label>100</p>
							<p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.26044037'/>(10%)：</label>10</p>
							<p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.675858010'/>：</label>110</p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3"></p>
							<p><label><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-204321051'/>：</label><input type="text" name="smsCode"><input id="btn" type="button" onClick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2"></p>
							<p><label></label><button class="but1" type="submit"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.-204321051a'/></button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
</script>
