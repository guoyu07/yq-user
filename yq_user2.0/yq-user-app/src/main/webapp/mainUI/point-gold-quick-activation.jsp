<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|快速激活金币卡</title>
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
        <p class="dialog-title">快速激活金币卡</p>
        <!-- 图纸为一页13条数据 -->
        <div class="dialog-wrap-border main-widget">
          <form class="widget-form">
            <p class="item">
              <lable class="title">消费编号：</lable>
              <span class="text widget-warning">${id}</span>
            </p>
            <p class="item">
              <lable class="title">登录密码：</lable>
              <span class="text widget-warning">${pdpa}</span>
            </p>
            <p class="item">
              <lable class="title">防伪编号：</lable>
              <span class="text widget-warning">${fwid}</span>
            </p>
            <p class="item">
              <lable class="title">金币面值：</lable>
              <span class="text widget-warning">${ejbk.bf2}0</span>
            </p>
            <p class="button-line mt15">
              <a onClick="return confirm('提示：按此激活将是自己使用，不能再用于赠送，您确定了吗？')" href="activedGoldCard?pdid=${id}&pdpa=${pdpa}&fwid=${fwid}&status=1">快速激活</a>
            </p>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
