<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，本次交易积分数量大于您剩余积分数量 ${myjyg} ，暂时不能交易，本次交易需要 ${gpjy.mysl} 积分，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('卖出${gpjy.mysl}积分成功！');location.replace('/gpjysc');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|我要卖积分</title>
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
    <ul class="nav-secondary">
      <li class="cur"><a href="point-recharge.html">积分理财</a></li>
      <li><a href="second-login.html">一币理财</a></li>
      <li><a href="game.html">业绩查询</a></li>
      <li><a href="eb-change-detail.html">账户概览</a></li>
    </ul>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
   		<%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <div class="main-widget">
        <p class="widget-title-line">我要卖积分</p>
        <form class="widget-form" action="/wymc?status=1&id=${id}" method="POST" onSubmit="return confirm('提示：您确定了吗？')">
          <p class="item">
            <lable class="title">本次卖出交易积分数量为：</lable>
            <span class="text widget-warning">${gpjy.mysl}</span>
          </p>
          <p class="item">
            <lable class="title">将在您的账户里扣除：</lable>
            <span class="text widget-warning">${gpjy.mysl}</span>积分
          </p>
          <p class="item">
            <lable class="title">单价是：</lable>
            <span class="text widget-warning"><c:if test="${gpjy.pay<1}">0${gpjy.pay}</c:if><c:if test="${gpjy.pay>=1}">${gpjy.pay}</c:if></span>
          </p>
          <p class="item">
            <lable class="title">总额为：</lable>
            <span class="text widget-warning">${gpjy.jypay}</span>
          </p>
          <p class="item">
            <lable class="title">卖出成功后：</lable>
           <%--  <span class="text widget-warning">${dqpay}</span> --%>
          </p>
          <p class="item">
            <lable class="title">扣除10%手续费您共得到：</lable>
            <span class="text widget-warning">${dqpay}</span>一币
          </p>
          <p class="item">
            <lable class="title">其中70%分配到一币账户：</lable>
            <span class="text widget-warning">${mc70}</span>一币
          </p>
          <p class="item">
            <lable class="title">其中30%分配到金币账户：</lable>
            <span class="text widget-warning">${dqpay}</span>金币
          </p>
          <p class="item">
            <lable class="title">二级密码:</lable>
            <input type="password" name="pa3" />
          </p>
          <p class="button-line mt15">
            <input type="submit" class="widget-button" value="确定无误" name="B1" />
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
