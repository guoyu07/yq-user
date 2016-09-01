<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1873291783'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.2022589602'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-495031333'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-879132281'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.773789335'/>！');location.replace('baby');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	
	<script language="JavaScript">
	 function checkdate()  {
	  if (Form.babyName.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1822162869'/>!");  Form.babyName.focus();      return false;    }
	  if (Form.babyAge.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1822106815'/>!");  Form.babyAge.focus();      return false;    }
	  if (Form.dadyName.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1644201045'/>!");  Form.dadyName.focus();      return false;    }
	  if (Form.dadyAge.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1644144991'/>!");  Form.dadyAge.focus();      return false;    }
	  if (Form.dadyCall.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.775311534'/>!");  Form.dadyCall.focus();      return false;    }
	  if (Form.momName.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1838553685'/>!");  Form.momName.focus();      return false;    }
	  if (Form.momAge.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1838497631'/>!");  Form.momAge.focus();      return false;    }
	  if (Form.momCall.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1313981778'/>!");  Form.momCall.focus();      return false;    }
	  if (Form.address.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1846478333'/>!");  Form.address.focus();      return false;    }
	  if (Form.details.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-645253644'/>!");  Form.details.focus();      return false;    }
	  if (Form.pa3.value=="") {      alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1989247238'/>!");    Form.pa3.focus();  return false;    }
	  
	  $("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=12", data, function(response) {
			$("#btn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1886666017'/>"); return false; }
			settime($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
			alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1886721436'/>");
		});
		return false;
	}
	  
	  function checkdate1()  {  
	  if (Form.smsCode.value=="") {   alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
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
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/xfgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.80813473'/>）</span>
					</div>
					<div class="content-txt">
						<form class="form form3" style="height:463px;" action="?st=1" method="post" onSubmit="return checkdate1()" name="Form" id="Form">
							<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>${userName}</p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.721961018'/>：</label><input type="text" name="babyName" value="${babyName}"></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.722017072'/>：</label><input type="text"  name="babyAge" value="${babyAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1539373977'/></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.899922842'/>：</label><input type="text" name="dadyName" value="${dadyName}"></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.899978896'/>：</label><input type="text"  name="dadyAge" value="${dadyAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1010272733'/>：</label><input type="text"  name="dadyCall" value="${dadyCall}" /></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.705570202'/>：</label><input type="text" name="momName" value="${momName}"></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.705626256'/>：</label><input type="text"  name="momAge"  value="${momAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.1010272733'/>：</label><input type="text"  name="momCall"  value="${momCall}" /></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.714256'/>：</label><input type="text" name="address" value="${address}"></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.842903009'/>：</label><textarea rows="5" name="details" cols="30" value="${details}"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.842903009a'/></textarea></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3"></p>
							<p><label><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-204321051'/></p>
							<p><label></label><button class="but1" type="submit"><s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-204321051a'/></button></p>
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
