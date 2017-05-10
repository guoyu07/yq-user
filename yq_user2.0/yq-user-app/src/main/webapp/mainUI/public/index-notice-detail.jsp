<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg2.jsp.reg2.jsp.624662580'/>|<s:text name='viewzhgl-notice.jsp.zhgl-notice.jsp.642835069'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> <!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->

<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='vipbdbdate.jsp.bdbdate.jsp.1257887'/> >> <s:text name='viewindex2.jsp.index2.jsp.667742'/></p>
     <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
  <%--   <!-- 会员中心左边栏 -->
<div class="member-aside">
        <%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- <s:text name='viewzhgl.jsp.zhgl.jsp.1101502999'/>  end -->
      </div>
<!-- 会员中心左边栏 end -->

    <div class="member-main"> --%>
     <div class="member-main-full article-detail">
      <!-- <s:text name='viewzhgl-notice.jsp.zhgl-notice.jsp.642835069'/> -->
      <div class="main-widget">
    	<c:choose>  
		<c:when test="${SESSION_LOCALE=='en_US' && (data.ggbt_en!=null || data.ggbt_en!='')}"> 
		 <p class="widget-title-line">${dgag.ggbt_en}</p>
		 <div class="widget-article">
			 <c:if test=" ${dgag.ggny_en==null || dgag.ggny_en==''}">
			  ${dgag.ggny}
			 </c:if>
			  ${dgag.ggny_en}
	      </div>
		</c:when>
		<c:otherwise>
		 <p class="widget-title-line">${dgag.ggbt}</p>
        <div class="widget-article">
         ${dgag.ggny}
        </div>
		</c:otherwise> 
		</c:choose>
        <p class="button-line mt15 tc"><a href="javascript:history.go(-1);" class="widget-button"><s:text name='viewzhgl-notice.jsp.zhgl-notice.jsp.1118943080'/></a></p>
      </div>
      <!-- <s:text name='viewzhgl-notice.jsp.zhgl-notice.jsp.642835069'/> end -->
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/member-index.js"></script>
</body>
</html>
