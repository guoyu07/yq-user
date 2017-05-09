<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.624662580'/>|<s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
  <link rel="stylesheet" href="${ctx}/css/member-index.css">
</head>

<body>
  <!-- 通用头部 -->
   <%@ include file="/mainUI/common/head.jsp" %>
  <!-- 通用头部 end -->
  <div class="container">
    <!-- 首页活动公告 -->
    <div class="index-top" id="J_memberIndexTop">
      <div class="active">
        <p class="title"><s:text name='activity'/></p>
        <!-- <img src="img/banner.png" width="348" height="168"> -->
        <div class="banner"><img src="${ctx}/img/banner.png" />
        
          <%-- <ul class="banList">
            <li class="active">
              <a href="#"><img src="${ctx}/img/banner.png" /></a>
            </li>
            <li>
              <a href="#"><img src="${ctx}/img/img2.jpg" /></a>
            </li>
            <li>
              <a href="#"><img src="${ctx}/img/img3.jpg" /></a>
            </li>
          </ul> --%>
         <!--  <div class="fomW">
            <div class="jsNav">
              <a href="javascript:;" class="trigger current"></a>
              <a href="javascript:;" class="trigger"></a>
              <a href="javascript:;" class="trigger"></a>
            </div>
          </div> -->
        </div>
      </div>
      <div class="news">
        <p class="title"><s:text name='viewindex2.jsp.index2.jsp.667742'/></p>
        <div class="news-content">
          <!--文摘的所有内容 start-->
          <span><s:text name='viewindex2.jsp.index2.jsp.803273677'/>！</span>
	<s:text name='viewjflc-recharge-ok.jsp.jflc-recharge-ok.jsp.-836674711'/>：${gcuserup.qq}<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="<s:text name='Click_here_to_send_me_a_message'/>" title="<s:text name='Click_here_to_send_me_a_message'/>"></a><br /><br />

          <br>
         <!--  <span>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！ 有任何事情请联系：中国一川【②号】客服QQ：613</span>
          <br>
          <span>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！ 有任何事情请联系：中国一川【②号】客服QQ：613</span> -->
          <!--文摘的所有内容 end-->
        </div>
      </div>
    </div>
    <!-- 首页活动公告 end -->
  </div>
  <div class="container">
    <!-- 首页内容 -->
    <div class="member-content" id="J_memberContent">
      <!-- 会员中心左边栏 -->
      <div class="member-aside-index">
       <%@ include file="/mainUI/common/userLeft.jsp" %>
       <%@ include file="/mainUI/common/licaiLeft2.jsp" %>
      </div>
      <!-- 会员中心左边栏 end -->
      <!-- <s:text name='viewindex2.jsp.index2.jsp.70014993'/> -->
     <div class="member-main-index">
        <div class="main-widget admin-news">
          <p class="widget-title-line"><s:text name='viewindex2.jsp.index2.jsp.70014993'/></p>
          <ul class="news-list">
          <s:iterator var="data" value="dataList">
            <li class="item">
              <p class="article-info">
                <span class="time"><fmt:formatDate value="${data.ggdate}" type="date"/></span>
                <br/>
                <span class="article-title"><a href="/ggck?ck=${data.id}">${data.ggbt}</span>
              </p>
              <a class="more" href="/ggck?ck=${data.id}"><s:text name='See'/></a>
            </li>
           </s:iterator>
          </ul>
          <p class="widget-pages">
          <aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"/>
          </p>
        </div>
      </div>
      <!-- <s:text name='viewindex2.jsp.index2.jsp.70014993'/> end -->
    </div>
    <!-- 首页内容 end -->
  </div>
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  <script type="text/javascript" src="${ctx}/js/member-index.js"></script>
</body>

</html>
