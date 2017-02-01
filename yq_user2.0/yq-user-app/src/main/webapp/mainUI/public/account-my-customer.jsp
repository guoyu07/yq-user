<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|我的客户</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> 
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">账户管理 >> 同名账户管理</p>
     <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
   <div class="user-info">
     <%@ include file="/mainUI/common/userLeft.jsp" %>
   	 <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
   	 </div>
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 我的客户 -->
      <div class="main-widget">
        <p class="widget-title-line">推荐人信息</p>
        <div class="widget-form">
          <p class="widget-notice mt15 ml10">如果有问题请第一时间联系我(推荐人)。</p>
          <p class="item mt15">
            <lable class="title">推荐人：</lable>
            <span class="text">${upName}先生/小姐</span>
          </p>
          <p class="item">
            <lable class="title">QQ：</lable>
            <span class="text">${up.qq} <a target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=${up.qq}&amp;site=qq&amp;menu=yes"> 点击这里发消息</a></span>
          </p>
          <p class="item">
            <lable class="title">手机：</lable>
            <span class="text">${up.call}</span>
          </p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line">我的客户</p>
        <p class="small-button-line">
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" data-url="tgdown?status=1">查看更多</a>
        </p>
        <div class="widget-table mt5">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>QQ/Email</th>
                <th>注册时间</th>
                <th>累计充值</th>
                <th>双区玩家</th>
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
					<td><c:if test="${data.sjb==0}">否</c:if><c:if test="${data.sjb!=0}">${data.sjb}单</c:if></td>
				</tr>
			   </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 我的客户 end -->
      </div>
    </div>
  </div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
