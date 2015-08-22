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
						<span>一 币 交 易 市 场</span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th>流水号</th>
								<th>卖出方</th>
								<th>信用星</th>
								<th>求现金额</th>
								<th>认购后可换一币</th>
								<th>认购后可获利</th>
								<th>交易状态</th>
								<th>操作</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>***${data.simplePayid}</td>
								<td>${data.payusername}</td>
								<td>${data.cxt}</td>
								<td>${data.paynum9}</td>
								<td> ${data.paynum}</td>
								<td>${data.paynum-data.paynum9}</td>
								<td> <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc?qx=${data.payid}"><font color="#FF0000">撤销卖出</font></a></b></c:if><c:if test="${data.payusername!=userName}">等待认购中。。。</c:if></td>
								<td><a onClick="return confirm('提示：对方使用的收款方式是“${data.paybank}”您确定认购了吗？')" href="epmy?ep=${data.payid}"><font color="#FF0000" size="2">我要认购</font></a></td>
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