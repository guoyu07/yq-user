<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('请于开户后第二天再进行卖出操作，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('卖出单价不能小于 0.77 ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('卖出单价不能大于${fcxt.jygj+0.03}  哦！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您卖出数量不能小于零，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('您好，您卖出数量不能大于您剩余数量 ${gcuser.jyg} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('交易市场已有求购信息，请按需求点击 [我要卖给] ！');location.replace('gpjysc');</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('卖出挂牌成功!');location.replace('gpjy');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|确认发布积分卖出</title>
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
    <!-- 会员中心左边栏 -->
<div class="member-aside">
        <%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 确认发布积分买入 -->
      <div class="main-widget">
        <p class="widget-title-line">再次确认积分是否挂牌卖出</p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=1">
            <p class="item">
              <label class="title">您要卖出积分数量：</label><span class="text">${txpay}</span>
            </p>
            <p class="item">
              <label class="title">选择单价是：</label><span class="text">>${jygj}</span>
            </p>
            <p class="mt10">卖出成功后：</p>
            <p class="item mt10">
              <label class="title">扣除10%的手续费得到：</label><span class="text"><b class="widget-warning">${dqpay}</b></span>
            </p>
            <p class="item">
              <label class="title">其中70%分配到一币账户：</label><span class="text"><b class="widget-warning">${mc70}</b></span>
            </p>
            <p class="item">
              <label class="title">其中30%分配到金币账户</label><span class="text"><b class="widget-warning">${mc30}</b></span>
            </p>
            <p class="button-line mt15">
              <a href="/mcsl?status=2&txpay=${txpay}&jygj=${jygj}" class="widget-button">确定无误</a>
            </p>
          </form>
          <p class="widget-warning mt15">提示：此为挂牌，等待买家确认后一币和金币才可以得到分配！</p>
        </div>
      </div>
      <!-- 确认发布积分买入 end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
