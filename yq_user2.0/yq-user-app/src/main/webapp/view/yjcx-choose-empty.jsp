<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.476428411'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1060799146'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1541818965'/>！');history.go(-1);</script></c:if>
 <!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.bduser.value=="") {      alert("<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/><s:text name='reg.jsp.reg.jsp.-609490706'/>!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.35601975'/>一个<s:text name='viewgrxx-rule.jsp.grxx-rule.jsp.748185'/>！");      return false;    }
  if (Form.pa1j.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>！");      return false;    }
  if (Form.pa2j.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='reg.jsp.reg.jsp.630954966'/>！");      return false;    }
  return true;  }  
 </script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box2">
					<div class="content-title">
						<span><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/></span>
					</div>
					<div class="form_tj">
						<a style="font-size: 16px; color: #ff6600; float:right;" href="javascript:history.back();"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></a>
						<form class="form form3 formtj"  method="POST" action="bdreg" name="Form" onSubmit="return checkdate()">
							<p><label><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.473018246'/>：</label><b style="color: #ff0000;"><input type="hidden" name="up" size="8" readonly value="${myup}">${myup}</b></p>
							<p><label><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><input type="text" name="bduser" size="15" value="${bdid}"><span style="color: #000080;"> <s:text name='vipsgreg.jsp.sgreg.jsp.1036238299'/></span></p>
							<p><label><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1123565209'/>：</label>
								<select size="1" name="cjpay">
									<option selected value="0">==<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.35003772'/>==</option>
									<option value="10000">1<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
									<option value="20000">2<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
									<option value="50000">5<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
									<option value="1000">1<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
									<option value="2000">2<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
									<option value="5000">5<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
								</select>
							</p>
							<p><label><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.-1306168857'/>：</label><input type="password" name="pa1j" size="20" /></p>
							<p><label><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.-1603016952'/>：</label><input type="password" name="pa2j" size="20"></p>
							<p style="color: #800000; padding-left: 220px;"><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.-1818598616'/></p>
							<p><label></label><button class="but1" type="submit"><s:text name='vipsgreg.jsp.sgreg.jsp.812244'/></button></p>
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
