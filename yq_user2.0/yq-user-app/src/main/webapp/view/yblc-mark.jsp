<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mark.jsp.yblc-mark.jsp.-1628195825'/>！');location.replace('/vipup');</script></c:if>

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
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.-925818028'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.21178581'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.20607384'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.855285018'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.-1780098759'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.912665660'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.656576290'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.625799226'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${data.payid}</td>
								<td>${data.payusername}</td>
								<td>${data.cxt}</td>
								<td>${data.paynum9}</td>
								<td> ${data.paynum}</td>
								<td>${data.paynum-data.paynum9}</td>
								<td>${data.paytime}</td>
								<td> <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000"><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.625799226a'/></font></a></b></c:if><c:if test="${data.payusername!=userName}"><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.1991539691'/>。。。</c:if></td>
								<td><a onClick="<s:text name='viewyblc-mark.jsp.yblc-mark.jsp.1903383816'/>" href="epmy?ep=${data.payid}"><font color="#FF0000" size="2"><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.1903383816a'/></font></a></td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
						 
							<p>
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
