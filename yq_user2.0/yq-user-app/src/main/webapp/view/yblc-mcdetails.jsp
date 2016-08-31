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
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>（<s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.2110934020'/>）</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></th>
								<th><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.-365289126'/></th>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.855285018'/></th>
								<th><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.663201424'/></th>
								<th><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.625799226'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>***${data.simplePayid}</td>
								<td>${data.payusername}</td>
								<td>${data.paynum9}<s:text name='yuan'/></td>
								<td><fmt:formatDate value="${data.paytime}" type="both"/></td>
								<td> 
								<c:if test="${not empty data.zftime}">
									<s:text name='reg1.jsp.reg1.jsp.799375'/>
									<c:if test="${data.tp==1}">
									（<s:text name='system'/>）
									</c:if> --<s:text name='viewjflc-details.jsp.jflc-details.jsp.755936'/>--${data.dfuser}--<fmt:formatDate value="${data.zftime}" type="both"/>
								</c:if>
								<c:if test="${empty data.zftime}">
						             <c:if test="${data.ep==1}">${data.dfuser}--<s:text name="viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.-507211912"></s:text>...</c:if>
						             <c:if test="${data.ep==2}">${data.dfuser}--<s:text name="viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.-875882008"></s:text>。。。</c:if>
						             <c:if test="${data.ep!=1&&data.ep!=2}"><s:text name="viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.1467453928"></s:text></font></a></b></c:if>
					            </c:if>
								</td>
								<td><a onClick="return confirm('<s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.-299506267'/>！')" href="/mcepok?payId= ${data.payid}"><font color="#FF0000" size="2">
					          		<c:if test="${data.ep==2}"><input type="button" value="<s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.1726063994'/>" name="B1" onclick=disabled=true style="font-size: 10pt; color: #0000FF; font-weight: bold">
					          		</c:if>
          </font>
          </a></td>
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
