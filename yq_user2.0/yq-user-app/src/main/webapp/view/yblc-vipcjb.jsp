<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.2073267590'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1239579686'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.2060105128'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1830047641'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1141343717'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-836805238'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.640340070'/>！');location.href='vipcjb';</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (form.cjuser.value=="") {    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1508540713'/>!");  form.cjuser.focus();  return false;    }
  if (form.cjpay.value==0) {    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1837640058'/>!");  form.cjpay.focus();  return false;    }
  if (form.cjpay.value>${gcuser.vipcjcjb}) {    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1671689850'/>!");  form.cjpay.focus();  return false;    }
  if (form.cjpass.value=="") {    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-127108265'/>!");  form.cjpass.focus();  return false;    }
  if(confirm("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.138357933'/>？")){
   $("#B1").hide();
   return true;
   }
  return false;  }
 </script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1488407247'/> -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>vip<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1624937649'/></span>
					</div>
					<div class="content-table">
							 <form method="POST" action="vipcj" name="form" onSubmit="return checkdate()">
								<p><s:text name='reg.jsp.reg.jsp.29623262'/>：<input type="text" name="cjuser" size="12">
								<s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/>：<select size="1" name="cjpay">
								<option selected value="0">==<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.35601975'/>==</option>
								<option value="1000">1000</option>
								<option value="2000">2000</option>
								<option value="5000">5000</option>
								</select>
								<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.640299730'/>：<input type="password" name="cjpass" size="12">
								<input type="submit" value="<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1817777369'/>" name="B1" id="B1">(<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1817777369a'/>)：<font color="#FF0000">${gcuser.vipcjcjb}</font>）</p>
							</form>
						<table>
							<tr>
								<th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1030049'/></th>
								<th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1619451673'/></th>
								<th><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/></th>
								<th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
								<th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.789127981'/></th>
								<th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.25461174'/></th>
								<th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1365514950'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.cjid}</td>
								<td>${data.cjuser}</td>
								<td>${data.cjjo}</td>
								<td>${data.bz}</td>
								<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
								<td>${data.vipuser}</td>
								<td>${data.sycjb}</td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag />
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
