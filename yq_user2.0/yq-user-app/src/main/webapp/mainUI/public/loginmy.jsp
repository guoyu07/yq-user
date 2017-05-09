<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='Two_level_password_login'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
  
</head>
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.1099577248'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
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
  <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/> end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- <s:text name='Money_transaction_rules'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Money_transaction_rules'/></p>
        <div class="widget-article scroll-y small-size">
          <!-- 以下是直接引入的文章内容 -->
                  <s:text name='viewlogin3j.jsp.login3j.jsp.1072980487'/>
<br/>1、<s:text name='viewlogin3j.jsp.login3j.jsp.1178622703'/>。
<br/>2、<s:text name='viewlogin3j.jsp.login3j.jsp.1078412623'/>。
<br/>3、一币交易认购后（VIP）没有及时汇款或者漏汇款，除了周末汇款延后外，尽量提前在5点前（银行当天到账）认购一币及时汇款，认购方（VIP财务人员）也应该当天及时核对转账明细避免漏打款。做到<b>当天账目当天结清！ </b>
<br/>4、认购方（VIP）发现没有办法正常汇款的账户当天反映给到总部客服，总部客服撤销这笔交易后进行限制提现设置，直到账户资料修改正确后提交《大VIP特殊业务申请书》才开通卖出。认购方不能没有打款成功就确认已付款设置。
<br/>5、针对认购方没有核对正确的金额汇款或者银行账户无法正常汇款导致交易问题情况的，认购方（少汇款）或者（多汇款给）卖出方，账户（欠款方）暂停任何的交易设置（锁户处理），直到汇款（还账）情况解决后方可开通账户。
<br/>
<s:text name='viewlogin3j.jsp.login3j.jsp.203331168'/>
<br/>1、<s:text name='viewlogin3j.jsp.login3j.jsp.98672732'/>！
<br/>2、<s:text name='viewlogin3j.jsp.login3j.jsp.-1363913732'/>。
<br/>3、<s:text name='viewlogin3j.jsp.login3j.jsp.-9035302'/>。
<br/>
<b>（温馨提示：一币卖出交易后在48小时内未确认用户系统将会自动扣信誉星一枚，用户在5天后还未确认（包含前面48小时），系统将会自动确认，系统确认后就会直接封锁用户无法操作卖出一币的，要再卖出一币，要先向公司提交申请书，书面承诺平台系统规则，申请机会只有三次（包含同名账户，同名账户有一个用户被系统自动确认后，所有同名的都是不能操作一币卖出。）同一证件超出三次申请的用户永久不能卖出一币！感谢您的配合！）</b> 
        </div>
      </div>
      <!-- <s:text name='Money_transaction_rules'/> end -->
      <!-- 二级密码登录验证 -->
      <div class="main-widget mt15">
        <form class="widget-form" method="POST" action="" name="secondLoginForm" id="J_secondLoginForm" onsubmit="return false">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>
            <input type="text" value="${userName}" readonly="">
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="password3">
          </p>
          <p class="button-line mt15 tc">
            <a class="widget-button JQ_secondLoginBtn" value="登陆管理"><s:text name='viplogin8j.jsp.login8j.jsp.665975448'/></a>
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
