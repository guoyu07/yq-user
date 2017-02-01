<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|金币卡重置密码</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${cxt}/css/common.css">
</head>

<body>
  <div class="member-dialog-container">
    <div class="member-main">
      <div class="dialog-widget">
        <p class="dialog-title">金币卡重置密码</p>
        <div class="dialog-wrap-border main-widget">
          <div class="widget-article">
            <p class="widget-notice">你好，你上次已查看过该消费编号<b class="widget-warning">william19jfizh</b>的登录密码</p>
            <p class="widget-notice mt10">如果已经把密码给到客户手上，请不要随便重置密码。</p>
            <p class="widget-notice mt10">客户真的忘记了密码，我决定再次<a href="czpa?id=${id}" class="widget-button-small">重置密码</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${cxt}/js/jquery.js"></script>
  <script type="text/javascript" src="${cxt}/js/common.js"></script>
</body>

</html>
