<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|积分充值汇款确认</title>
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
    <p class="breadcrumb-trail">财富中心 >> 金币管理</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
   <div class="member-main-full">
      <!-- 注意事项 -->
      <div class="main-widget">
        <p class="widget-title-line">注意事项</p>
        <div class="widget-article">
          <p>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</p>
          <p class="mt10">有任何事情请联系:
            ${cz01}QQ：613697152 客服QQ:${qq}<a target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=613697152&amp;site=qq&amp;menu=yes">点击这里发消息</a>
          </p>
          <p class="widget-warning mt10">各部门服务中心人员分工有序,请不要重复添加好友,更不要向每个客服在同一时段咨询同一个问题，感谢您的配合。</p>
          <br>
          <p>请大家尽量提前充值，尽量不要都挤压在晚上8点至10点，所有充值升级事宜要在晚上11点20分前办理 晚上11点30分后要求充值的不能及时处理属于正常现象，谢谢理解
          </p>
        </div>
      </div>
      <!-- 注意事项 end -->
      <!-- 汇款确认 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">汇款确认</p>
        <div class="widget-article">
          <p class="f30">您选择充值<b class="widget-warning">${cjpay}</b>元</p>
          <p class="widget-tips mt15">注：每次充值最低100元，并以100元的整数递增，如200,300,400,同时需要加尾数。</p>
          <p class="widget-tips mt10">充值成功后显示在可用一币里，可自由购买金币卡、消费或升级开通双区业务</p>
          <p class="widget-warning f30 tc mt20"><a href="/bank?dq=${gcuser.dqu}">点这里查看汇款账号</a></p>
        </div>
      </div>
      <!-- 汇款确认 end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
