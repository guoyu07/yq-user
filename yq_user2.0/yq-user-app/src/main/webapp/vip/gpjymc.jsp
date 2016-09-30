<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
<table border="1" cellspacing="0" bgcolor="#f1f1f1" width="100%" cellpadding="0" id="tablem"> 
									 <p style="text-align:center; font-size: 18px; display:block; border:1px solid #333; border-bottom: none;"><s:text name='vipgpjymc.jsp.gpjymc.jsp.646808098'/></p> 
							          <tr bgcolor="#e8c479" align="center" height="30" > 
								          <td width="200"><font size="2"><strong><s:text name='vipgpjymc.jsp.gpjymc.jsp.646991827'/></strong></font></td>
								          <td width="160"><b><font size="2"><s:text name='viewjflc-details.jsp.jflc-details.jsp.681538'/></font></b></td>
								          <td width="200"><font color="#000000" size="2"><strong><s:text name='viewjflc-details.jsp.jflc-details.jsp.20195982'/></strong></font></td>
								          <td width="180"><b><font color="#000000" size="2"><s:text name='vipgpjymc.jsp.gpjymc.jsp.21392295'/></font></b></td>
								          <td width="238"><b><font size="2"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></font></b></td>
							          </tr>
								       
							         <s:iterator var="data" value="dataList">
								          <tr align="center" height="25"> 
									          <td width="200"><b><font style="font-weight: lighter;" size="2">${data.mcsl}</font></b></td>
									          <td width="160"><b><font color="#FF0000" size="2"><c:if test="${data.pay<1}">${data.pay}</c:if><c:if test="${data.pay>=1}">${data.pay}</c:if></font></b></td>
									          <td width="200"><font size="2" color="#614039">${data.jypay}</font></td>
									          <td  width="180"><font size="2">
                                             <c:choose>
										     <c:when test="${fn:length(data.username) > 10}">
										      <c:out value="${fn:substring(data.username, 0, 10)}.." />
										     </c:when>
										     <c:otherwise>
										      <c:out value="${data.username}" />
										     </c:otherwise>
										    </c:choose>

                                            </font></td>
									          <td  width="238">
									          <c:choose>
									          	<c:when test="${data.username==userName}"><a onClick="return confirm('<s:text name='canot_buy'/>!')" href="#"><font color="#FF0000" style="font-size: 11pt;text-decoration:line-through;"><s:text name="vipgpjymc.jsp.gpjymc.jsp.1526835300a"></s:text></font></a></c:when>
									          <c:otherwise>
									          	<c:if test="${data.mcsl>0}"><b><a onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>!')" target="main" href="wymy?id=${data.id}&pay=${data.jypay}"><font color="#FF0000" style="font-size: 11pt"><s:text name="vipgpjymc.jsp.gpjymc.jsp.1526835300a"></s:text></font></a></b></c:if>
									          </c:otherwise>
									          </c:choose>
									          <%-- <c:if test="${data.mcsl>0}"><b><a onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" target="main" href="wymy?id=${data.id}&pay=${data.jypay}"><font color="#FF0000" style="font-size: 11pt"><s:text name="vipgpjymc.jsp.gpjymc.jsp.1526835300a"></s:text></font></a></b></c:if> --%>
									          </td>
								          </tr>
							          </s:iterator>
									</table>
<script>
		 $("#table2 tr:odd, #table3 tr:odd").css("background","#bcbcbc");
</script>
