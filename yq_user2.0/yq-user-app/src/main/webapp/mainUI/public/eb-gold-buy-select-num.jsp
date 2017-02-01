<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('注意：您的一币小于15，请充值！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币购金币卡</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> 
<!-- 通用头部 -->
<div class="header" id="J_header">
  <<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 一币理财</p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
	<div class="member-aside">
   <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
 	<%@ include file="/mainUI/common/yblc.jsp" %>
  <!-- 账户概览 end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 一币购金币卡规则 -->
      <div class="main-widget">
        <p class="widget-title-line">一币购金币卡</p>
        <div class="widget-article">
          <p class="widget-tips">您的一币剩余<b class="widget-warning">${pay}</b></p>
        </div>
      </div>
      <!-- 一币购金币卡规则 end -->
      <!-- 一币购金币卡 -->
      <div class="main-widget mt10">
        <div class="widget-article">
          <form class="widget-form" method="POST" action="jztojb?status=2" name="Form" onSubmit="return checkdate()">
            <p class="item">
              <label class="title">已选择的面值为：</label><span class="text">
              	<c:if test="${gmmj==1}">10金币（15一币/张）</c:if>
               	<c:if test="${gmmj==5}">50金币（75一币/张）</c:if>
                <c:if test="${gmmj==10}">100金币（150一币/张）</c:if>
                <c:if test="${gmmj==30}">300金币（450一币/张）</c:if>
                <c:if test="${gmmj==50}">500金币（750一币/张）</c:if>
               <c:if test="${gmmj==100}">1000金币（1500一币/张）</c:if>
              </span></p>
            <p class="widget-notice mt15"><b>请请选择要购买的数量：</b></p>
            <p class="select-line">
              <select class="widget-select" name="gmsl">
                <option value="0" selected="">==请选择数量==</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
              </select>
              <span class="widget-warning">**</span>
              <button type="submit" class="widget-button ml60">确定购买</button>
              <!-- 下一个页面是 eb-gold-buy-confirm.html -->
            </p>
            <input type="hidden" name="mj" size="5" value="${gmmj}0" readonly="">
          </form>
        </div>
      </div>
      <!-- 一币购金币卡 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
  function checkdate() {
    if (Form.gmsl.value == 0) {
      alert("请选择你要购买的数量!");
      return false;
    }
    return true;
  }
</script>
</body>

</html>
