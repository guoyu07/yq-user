<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>一 币 认 购 明 细</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th>流水号</th>
								<th>认购方（自己）</th>
								<th>认购一币数量</th>
								<th>认购时间</th>
								<th>卖出方</th>
								<th>交易状态</th>
								<th>操作</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>***${data.simplePayid}</td>
								<td>${data.dfuser}</td>
								<td>${data.paynum}</td>
								<td><fmt:formatDate value="${data.rgdate}" type="both"/></td>
								<td> ${data.payusername}</td>
								<td> <c:if test="${not empty zftime}">
                                                               交易成功-卖出方${data.payusername}已确认。
          </c:if>
          <c:if test="${empty zftime}">
                <c:if test="${data.ep==1}"><font color="#FF00FF">您已下单，等待您在</font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF">前付款，<b><a target="_blank" href="fbbank?fb=${data.payid}"><font color="#008000">点击查看卖出方收款账号！</font></a></b></font></c:if>                                                
                <c:if test="${data.ep==2}">${data.dfuser}--已付款，等待卖出方${data.payusername}的确认中。。。</c:if>
          </c:if></td>
          <td><a onClick="return confirm('提示：您确定已向发布方 ${data.payusername} 打款 ${data.paynum9}元了吗？')" href="myepok?ep=${data.payid}"><font color="#FF0000" size="2">
            <c:if test="${data.ep==1}">已打款${data.paynum9}元，通知卖出方确认。</c:if></font></a></td>
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