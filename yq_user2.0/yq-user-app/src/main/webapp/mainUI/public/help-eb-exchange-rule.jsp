<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='Money_transaction_rules'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> 
<!-- 通用头部 -->
 <%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Support_help'/> >> <s:text name='Money_transaction_rules'/></p>
     <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='Money_transaction_rules'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='Money_transaction_rules'/></p>
        <div class="widget-article scroll-y full-size mt5">
         <blockquote>
            <p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="center"><b><font color="#FF00FF" size="5" face="楷体_GB2312"><s:text name='Money_transaction_rules'/></font></b></p>
              <br>
              <br/><b> <s:text name='viewlogin3j.jsp.login3j.jsp.1072980487'/></b>
              <br>
              <br/>1、<s:text name='viewlogin3j.jsp.login3j.jsp.1178622703'/>。<br/>
         			<br/> 2、<s:text name='viewlogin3j.jsp.login3j.jsp.1078412623'/>。<br/>
          		<br/>3、<s:text name='help-eb-exchange-rule01'/><br/>
          		<br/>4、<s:text name='helpeb_exchange_rule02'/><s:text name='helpeb_exchange_rule03'/><br/>
         		  <br/>5、<s:text name='helpeb_exchange_rule04'/><br/>
          		<br/>
              <br>
              <b><s:text name='viewlogin3j.jsp.login3j.jsp.203331168'/></b>
              <br>
              <br/>1、<s:text name='viewlogin3j.jsp.login3j.jsp.98672732'/>！<br/>
              <br/>2、<s:text name='viewlogin3j.jsp.login3j.jsp.-1363913732'/>。<br/>
              <br/>3、<s:text name='viewlogin3j.jsp.login3j.jsp.-9035302'/>。<br/>
              <br/>
			  <s:text name='helpeb_exchange_rule05'/><s:text name='helpeb_exchange_rule06'/>
              <br>
            </p>
            <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
            <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
          </blockquote>
        </div>
      </div>
      <!-- <s:text name='Money_transaction_rules'/> end -->
      <!-- 二级密码登录验证 -->
      <!-- <div class="main-widget mt15">
        <form class="widget-form" method="POST" action="" name="secondLoginForm" id="J_secondLoginForm" onsubmit="return false">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>
            <input type="text" value="william123" readonly="">
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="password3">
          </p>
          <p class="button-line mt15 tc">
            <a class="widget-button JQ_secondLoginBtn" value="登陆管理">同意规则</a>
          </p>
        </form>
      </div> -->
      <!-- 二级密码登录验证 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
