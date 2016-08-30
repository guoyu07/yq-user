<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="85" id="tablen">
										<p style="text-align:center; font-size: 18px; display:block; border:1px solid #333; border-bottom: none;"><s:text name='vipgpjymy.jsp.gpjymy.jsp.861017881'/></p>
  								<tr>
					    		 <td width="100%" style="border: 1px solid #E5EAC2; border-top:none;" height="62" >
									<div align="center">    
							          <table border="1" cellspacing="0" bgcolor="#f1f1f1" style="border-collapse: collapse" cellpadding="0" height="58" id="table2">
							           <tr bgcolor="#6fbec2" align="center" height="30" > 
								          <td width="200"><font size="2"><strong><s:text name='vipgpjymy.jsp.gpjymy.jsp.861201610'/></strong></font></td>
								          <td width="160"><b><font size="2"><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></font></b></td>
								          <td width="200"><font color="#000000" size="2"><strong><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></strong></font></td>
								          <td width="180"><b><font color="#000000" size="2"><s:text name='vipgpjymc.jsp.gpjymc.jsp.21392295'/></font></b></td>
								          <td width="238"><b><font size="2"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></font></b></td>
							          </tr>
							          
         <s:iterator var="data" value="dataList">
							          <tr align="center" height="25"> 
								          <td width="200"><b><font style="font-weight: lighter;" size="2">${data.mysl}</font></b></td>
								          <td width="160"><b><font color="#FF0000" size="2"><c:if test="${data.pay<1}">${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></font></b></td>
								          <td width="200"><font size="2" color="#614039">${data.jypay}</font></td>
								          <td  width="180"><font size="2">
								          <c:choose>
										     <c:when test="${fn:length(data.username) > 8}">
										      <c:out value="${fn:substring(data.username, 0, 8)}.." />
										     </c:when>
										     <c:otherwise>
										      <c:out value="${data.username}" />
										     </c:otherwise>
										    </c:choose>
								          </font></td>
								          <td  width="238">
								         <c:if test="${data.mysl>0}"><a onClick="return confirm('<s:text name='vipgpjymy.jsp.gpjymy.jsp.1046836541'/>？')" target="main" href="wymc?id=${data.id}&sl=${data.mysl}"><span style="font-size: 11pt; font-weight: 700"><font color="#008000"><s:text name='vipgpjymy.jsp.gpjymy.jsp.1046836541a'/></font></span></a></c:if>
								          </td>
							          </tr>
		</s:iterator> 
					    			</table> 
								</div> 
							</td>


								</tr> 
								</table>
<script>
		 $("#table2 tr:odd, #table3 tr:odd").css("background","#bcbcbc");
</script>								
