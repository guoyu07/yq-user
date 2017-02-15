<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|同名账户列表</title>
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
  <%@ include file="/mainUI/common/userLeft.jsp" %>
   <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 同名账户列表 -->
      <div class="main-widget">
        <p class="widget-title-line">同名账户列表</p>
        <p class="small-button-line">
          <a href="javascript:void(0);" class="widget-button-small JQ_moreDialog" id="J_accountList" data-url="userlist?status=1">查看更多</a>
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>积分数量</th>
                <th>可用金币</th>
                <th>注册时间</th>
                <th>信誉星</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td><a href="/relogin?luserName=${data.username}">${data.username}</a><c:if test="${data.username==gcuser.username}"></font><b><font color="#FF00FF">(当前)</font></b></c:if></td>
					<td>${data.jyg}</td>
					<td>${data.jydb}</td>
					<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
					<td>${data.cxt}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 同名账户列表 end -->
      </div>
    </div>
  </div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
