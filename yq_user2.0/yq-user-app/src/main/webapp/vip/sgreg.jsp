<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.476428411'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipsgreg.jsp.sgreg.jsp.1060799146'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1541818965'/>！');history.go(-1);</script></c:if>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.bduser.value=="") {      alert("<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/><s:text name='reg.jsp.reg.jsp.-609490706'/>!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.35601975'/>一个<s:text name='viewgrxx-rule.jsp.grxx-rule.jsp.748185'/>！");      return false;    }
  if (Form.pa1j.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>！");      return false;    }
  if (Form.pa2j.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='reg.jsp.reg.jsp.630954966'/>！");      return false;    }
  return true;  }  
 </script>
<div align="center">
	<form method="POST" action="bdreg" name="Form" onSubmit="return checkdate()">
		<p>　</p>
		<p>　</p>
		<table border="0" width="53%" id="table1" height="194" cellspacing="1">
			<tr>
				<td align="right" width="31%"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.473018246'/>：</td>
				<td width="68%"><input type="hidden" name="up" size="8" readonly value="${myup}"><b><font color="#FF0000">${myup}</font></b></td>
			</tr>
			<tr>
				<td align="right" width="31%"><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/><s:text name='reg.jsp.reg.jsp.29623262'/>：</td>
				<td width="68%"><input type="text" name="bduser" size="15" value="${bdid}"><font size="2" color="#000080"> <s:text name='vipsgreg.jsp.sgreg.jsp.1036238299'/></font></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right"><s:text name='vipsgreg.jsp.sgreg.jsp.1123565209'/>：</td>
				<td align="center" width="68%"><p align="left"><b>
              <select size="1" name="cjpay">
				<option selected value="0">==<s:text name='vipsgreg.jsp.sgreg.jsp.35003772'/>==</option>
				<option value="10000">1<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
				<option value="20000">2<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
				<option value="50000">5<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.1293756907'/></option>
				<option value="1000">1<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
				<option value="2000">2<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
				<option value="5000">5<s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.698380006'/>）</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right"><s:text name='vipsgreg.jsp.sgreg.jsp.-1306168857'/>：</td>
				<td align="center" width="68%"><p align="left"><input type="password" name="pa1j" size="20"></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right"><s:text name='vipsgreg.jsp.sgreg.jsp.-1603016952'/>：</td>
				<td align="center" width="68%"><p align="left"><input type="password" name="pa2j" size="20"></td>
			</tr>
			<tr>
				<td align="center" width="98%" colspan="2"><font color="#800000"><span style="font-size: 11pt"><s:text name="vipsgreg.jsp.sgreg.jsp.1572993517"></s:text></font></span></td>
			</tr>
		</table>
		<p><input type="submit" value="<s:text name='vipsgreg.jsp.sgreg.jsp.812244'/>" name="B1" style="font-size: 12pt; font-weight: bold" ></p>
	</form>
<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></font></a></p>
<p>　</div>
