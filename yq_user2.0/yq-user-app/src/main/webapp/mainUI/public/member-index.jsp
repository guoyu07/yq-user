<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${isHaveTxPayBuy==true}"><script language=javascript>alert('<s:text name='viewindex2.jsp.index2.jsp.1200989498'/>！');location.replace('epmyjl?secondThisState=253&thisState=244');</script></c:if>
<c:if test="${isHaveTxPaySale==true}"><script language=javascript>alert('<s:text name='viewindex2.jsp.index2.jsp.545255763'/>！');location.replace('epmcjl?secondThisState=249&thisState=244');</script></c:if>
<c:if test="${dq=='0' or dq=='2' or dq=='7' or dq=='8'}">
<c:set var="cz01" value="本公司【①号】客服QQ：613697151"></c:set>
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<c:if test="${dq=='1' or dq=='3' or dq=='4' or dq=='5' or dq=='6'}">
<c:set var="cz01" value="本公司【②号】客服QQ：613697152"></c:set>
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
</c:if>
<head>
  <meta chartset="UTF-8">
  <title>会员中心|首页</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
    <link rel="stylesheet" href="${ctx}/css/common.css">
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
     <!--  <p class="title">活动</p> -->
      <div class="banner">
      <!-- <img src="img/banner.png" width="348" height="168"> -->
      <a href="#"><img src="${ctx}/img/banner.png" /></a>
      </div>
    </div>
    <%-- <div class="news">
      <p class="title">公告</p>
      <div class="news-content">
        <!--文摘的所有内容 start-->
          <span>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</span>
	有任何事情请联系：${gcuserup.qq}<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${gcuserup.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${gcuserup.qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a><br /><br />
	各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题<a href="/bank?dq=${dq}" style="text-decoration: none">本服务中心已配备指定的客服人员，专用的收款账号名字为“${gcuserup.vipuser}”--点击查看汇款账号</a>
          <br>
         <!--  <span>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！ 有任何事情请联系：中国一川【②号】客服QQ：613</span>
          <br>
          <span>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！ 有任何事情请联系：中国一川【②号】客服QQ：613</span> -->
          <!--文摘的所有内容 end-->
      </div>
    </div> --%>
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

    <!-- 管理员公告 -->
    <div class="member-main-index">
      <div class="main-widget admin-news">
        <p class="widget-title-line">管理员公告</p>
        <ul class="news-list">
          <s:iterator var="data" value="dataList">
            <li class="item">
              <p class="article-info">
                <span class="time"><fmt:formatDate value="${data.ggdate}" type="date"/></span>
                <br/>
                <span class="article-title"><a href="/ggck?ck=${data.id}">${data.ggbt}</a></span>
              </p>
              <a class="more" href="/ggck?ck=${data.id}">查看</a>
            </li>
           </s:iterator>
        </ul>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
 <aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
    <!-- 管理员公告 end -->
  </div>
  <!-- 首页内容 end -->
</div>
<c:if test="${guanggao==1}">
<div id="mask"></div>
<div id="passport-login-pop-dialog">
<div id='tang-title'><span>幸福一百会员中心</span><span id="close"></span>
	<div class="dialog-content">
		<p>尊敬的家人您好:</p>
		<p class="p-indent">随着公司的不断发展，会员数量的不断增加，为了给您提供更加优质、高效的服务,公司决定增加服务器数量;新增访问入口为:vip.ycgje.com;同时vip.zgyce.com都是可登录我公司网站,望家人们相互告知~！</p>
		<p>这个是最终确认的公告内容···</p>
	</div>
</div>
</div>
</c:if>
<script>
	function $$(close){
		return document.getElementById(close)
	}
	$$('close').onclick=function(){
		$$('mask').style.display="none";
		$$('passport-login-pop-dialog').style.display="none";
	}
</script>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/member-index.js"></script>
</body>

</html>
