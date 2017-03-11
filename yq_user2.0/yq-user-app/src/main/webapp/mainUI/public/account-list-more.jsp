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
                <th>姓名</th>
                <th>游戏级别</th>
                <th>可用一币</th>
                <th>积分数量</th>
                <th>可用金币</th>
                <th>注册时间</th>
                <th>开户时间</th>
                <th>信誉星</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
							<tr>
								<td><%-- <a href="/relogin?luserName=${data.username}"> --%>${data.username}<!-- </a> --><c:if test="${data.username==gcuser.username}"></font><b><font color="#FF00FF">(当前)</font></b></c:if></td>
								<td>${data.name}</td>
								<td>${data.sjb}</td>
								<td>${data.pay}</td>
								<td>${data.jyg}</td>
								<td>${data.jydb}</td>
								<td><fmt:formatDate value="${data.regtime}" type="both"/></td>
								<td><fmt:formatDate value="${data.bddate}" type="both"/></td>
								<td>${data.cxt}</td>
							</tr>
							</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="status,1,thisState,${thisState},secondThisState,${secondThisState}"/>
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
