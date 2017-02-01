<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|二级密码登录</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  
</head>
<%@ include file="/mainUI/common/head.jsp" %>
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
      <!-- 一币理财交易规则 -->
      <div class="main-widget">
        <p class="widget-title-line">一币理财交易规则</p>
        <div class="widget-article scroll-y small-size">
          <!-- 以下是直接引入的文章内容 -->
          一、认购方（付款方）责任
          <br/> 1、超过“2小时”没有成功付款到发布方指定银行账号，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。
          <br/>2、并没有成功付款到发布方指定银行账号，提前操作或恶意操作，影响正常交易流程，系统将没收暂扣下来的诚信金，解除本交易限制，让其它用户来完成此交易。
          <br/> 二、发布卖出方（收款方、求现方）责任
          <br/> 1、当付款方操作成功，收款方实际收到相应款项，必须于“48小时”内登录平台点“一币-理财”下“一币-卖出明细”查看该笔交易状态并进行“我已收到款项-通知系统给认购方增加相应的一币-余额”的操作！
          <br/> 2、发布卖出（求现）前请先确认自己的收款账号能正常使用，因您的收款账号错误或其它原因不能正常收款，影响付款方正常交易时间，付款人向客服提出申诉，该笔交易将绶发。
          <br/> 3、为了交易公平公正，交易双方有一定的约束，系统启动信星方案，每个用户初始为“5星”，每违反一次交易规则扣除“1星”，当剩下“3星”，将被限制发布和认购一星期，当剩下“2星”，将被限制发布和认购两星期，两星期内将不能获得平衡奖金，当剩下“1星”，将被限制发布和认购三星期，三星期内将不能获得平衡奖金和领导奖金，当剩下“0星”，将被限制发布和认购60天，60天内将不能获得平衡奖金和领导奖金。
          <br/> （温馨提示：一币卖出交易后在48小时内未确认用户系统将会自动扣信誉星一枚，用户在5天后还未确认（包含前面48小时），系统将会自动确认，系统确认后就会直接封锁用户无法操作卖出一币的，要再卖出一币，要先向公司提交申请书，书面承诺平台系统规则，申请机会只有三次（包含同名账户，同名账户有一个用户被系统自动确认后，所有同名的都是不能操作一币卖出。），超出三次申请的用户永久不能卖出一币！感谢您的配合！）
        </div>
      </div>
      <!-- 一币理财交易规则 end -->
      <!-- 二级密码登录验证 -->
      <div class="main-widget mt15">
        <form class="widget-form" method="POST" action="" name="secondLoginForm" id="J_secondLoginForm" onsubmit="return false">
          <p class="item">
            <label class="title">用户名：</label>
            <input type="text" value="${userName}" readonly="">
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="password3">
          </p>
          <p class="button-line mt15 tc">
            <a class="widget-button JQ_secondLoginBtn" value="登陆管理">同意规则</a>
          </p>
        </form>
      </div>
      <!-- 二级密码登录验证 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
