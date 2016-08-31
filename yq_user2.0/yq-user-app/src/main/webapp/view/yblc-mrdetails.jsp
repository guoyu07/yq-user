<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title><s:text name='reg1.jsp.reg1.jsp.624662580' /></title>
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
				<%@ include file="/view/yblc.jsp"%>

			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text
								name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-871299322' /></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404' /></th>
								<th><s:text
										name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1089491839' />）</th>
								<th><s:text
										name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.868743081' /></th>
								<th><s:text
										name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1100547719' /></th>
								<th><s:text
										name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.21178581' /></th>
								<th><s:text
										name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.625799226' /></th>
								<th><s:text
										name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.820271' /></th>
							</tr>
							<s:iterator var="data" value="dataList">
								<tr>
									<td>***${data.simplePayid}</td>
								<td>${data.dfuser}</td>
								<td>${data.paynum}</td>
								<td><fmt:formatDate value="${data.rgdate}" type="both"/></td>
								<td> ${data.payusername}</td>
								<td> 
								<c:if test="${not empty zftime}">
                                     <s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.691355938"></s:text>
										${data.payusername}
									 <s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.691355938a"></s:text>
          						</c:if>
          						
					          	<c:if test="${empty zftime}">
					                <c:if test="${data.ep==1}"><font color="#FF00FF"><s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130"/></font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF"><s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130a"/>，<b><a target="_blank" href="fbbank?fb=${data.payid}"><font color="#008000"><s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130b"/>！</font></a></b></font></c:if>                                                
					                <c:if test="${data.ep==2}">${data.dfuser}--<s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1073667942"/>${data.payusername}<s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1073667942a"/>。。。</c:if>
					          	</c:if>
					          	</td>
          						<td><a onClick="return confirm('<s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1689415574"/> ${data.payusername} <s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1689415574a'/>${data.paynum9}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1689415574'/>？')" href="myepok?ep=${data.payid}"><font color="#FF0000" size="2">
            						<c:if test="${data.ep==1}"><s:text name="viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.314771621"/>${data.paynum9}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.314771621a'/>。</c:if></font></a>
            					</td>
								</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p>
								<aldtags:pageTag />
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
