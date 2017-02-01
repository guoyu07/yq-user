<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|同名账户列表详情</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title">同名账户列表详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>QQ/Email</th>
                <th>注册时间</th>
                <th>累计充值</th>
                <th>最近充值时间</th>
                <th>双区玩家</th>
                <th>升级时间</th>
              </tr>
            </thead>
            <tbody>
 				<s:iterator var="data" value="dataList">
				<tr>
					<td>${data.username}</td>
					<td>
					<c:choose>
						<c:when test="${fn:contains(data.qq,'@')!=true}">
								<a target="_blank" href="https://wpa.qq.com/msgrd?v=3&uin=${data.qq}&site=qq&menu=yes"><font size="2"><img border="0" src="http://wpa.qq.com/pa?p=2:${data.qq}:41" alt="<s:text name='viewservice.jsp.service.jsp.488997268'/>" title="<s:text name='viewservice.jsp.service.jsp.488997268'/>"></font></a><font size="2" color="#000000">${data.qq}</font>
						</c:when>
						<c:otherwise>
								<a target="_blank" href="mailto:${data.qq}"><font size="2"><img border="0" src="image/eamil.png" alt="<s:text name='sendemail'/>" title="<s:text name='sendemail'/>"></font></a><font size="2" color="#000000">${data.qq}</font>
						</c:otherwise>
					</c:choose>
					</td>
					<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
					<td>${data.cjtj}</td>
					<td><fmt:formatDate value="${data.gmdate}" type="both"/></td>
					<td><c:if test="${data.sjb==0}">否</c:if><c:if test="${data.sjb!=0}">${data.sjb}单</c:if></td>
					<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
				</tr>
			   </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="status,1"/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
