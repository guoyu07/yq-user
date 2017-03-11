<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，本次交易金币大于您剩余金币 ${myjddb}，暂时不能交易，请充值或转换金币，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('买入${gpjy.mcsl}积分成功！');location.replace('/gpjysc?secondThisState=${secondThisState}&thisState=${thisState}');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|我要买积分</title>
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
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
  <%--   <!-- 会员中心左边栏 -->
<div class="member-aside">
  		<%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end --> --%>

    <!-- 我要买积分 -->
    <div class="member-main">
      <div class="main-widget">
        <p class="widget-title-line">我要买积分</p>
        <form class="widget-form">
          <p class="item">
            <lable class="title">本次买入需要金币为：</lable>
            <span class="text widget-warning">${gpjy.jypay}</span>
          </p>
          <p class="item">
            <lable class="title">将在您的金币钱包扣除：</lable>
            <span class="text widget-warning">${gpjy.jypay}</span>
          </p>
          <p class="button-line mt15">
            <a class="widget-button" onclick="return confirm('提示：您确定了吗？')" href="/wymy?status=1&id=${id}&secondThisState=${secondThisState}&thisState=${thisState}">确定无误</a>
          </p>
        </form>
      </div>
    </div>
    <!-- 我要买积分 end -->
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
