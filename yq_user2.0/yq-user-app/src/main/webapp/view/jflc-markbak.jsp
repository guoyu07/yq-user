<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></span>
					</div>
					<div class="content-txt">

<table border="0" cellspacing="0" width="100%" cellpadding="0" height="80">
    <tr>
      <td height="25">
      	<p style="font-size:16px;" class="z-tc c-b z-b"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.1460814497'/> <span class="c-r"><c:if test="${fcxt.jygj<1.0}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1.0}">${fcxt.jygj}</c:if></span></p>
      </td> 
    </tr>
   <tr>
    <td width="100%"  height="80">
	<div align="center">
		<table border="1" width="85%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tbody>
			<tr class="mc">
				<td rowspan="2" bgcolor="#FFFFFF"><a class="a-mrmc" href="/mcsl"><s:text name='vipuserpay.jsp.userpay.jsp.-1517150275b'/></a></td>
				<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.24334879'/></td>
				<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.26588703'/></td>
				<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.25989225'/></td>
				<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.938311'/></td>
				<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.625926272'/></td>
				<td rowspan="2" bgcolor="#FFFFFF"><a class="a-mrmc" href="/mysl"><s:text name="vipgpjysc.jsp.gpjysc.jsp.1114150724"></s:text></a></td>
			</tr>
			<tr class="jg">
				<td>${fcxt.zdj}</td>
				<td><c:if test="${fcxt.zgj+0.03<1.0}">0${fcxt.zgj+0.03}</c:if><c:if test="${fcxt.zgj+0.03>=1.0}">${fcxt.zgj+0.03}</c:if></td>
				<td>0${fcxt.zdj}</td>
				<td><c:if test="${fcxt.jygj<1}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></td>
				<td><c:if test="${fcxt.zgj+0.03<1.0}">0${fcxt.zgj+0.03}</c:if><c:if test="${fcxt.zgj+0.03>=1.0}">${fcxt.zgj+0.03}</c:if>/0 ${fcxt.zdj}</td>
			</tr>
		</tbody></table>
	</div>
		<p class="z-tc"><font size="2"><s:text name='viewjflc-markbak.jsp.jflc-markbak.jsp.101873798'/>。</font>
		<table border="1" width="100%" id="table2" cellpadding="2">
			<tr>
				<td align="center">
					<iframe name="I1" marginwidth="1" marginheight="1" width="100%" height="768" align="center" border="0" frameborder="0" src="gpjymc" scrolling="no" ></iframe>
				</td>
				<td align="center">
					<iframe name="I2" marginwidth="1" marginheight="1" width="100%" height="768" align="center" border="0" frameborder="0" src="gpjymy" scrolling="no" ></iframe>
				</td>
			</tr>
		</table>
</p></td></tr> 
</tbody></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
