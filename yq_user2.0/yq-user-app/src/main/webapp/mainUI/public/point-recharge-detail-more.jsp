<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-253996823'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-1299761769'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.1309921904'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-47326774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2053058834'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.39306141'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='Activationsuccess'/>！');location.replace('gmjh?secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymy.jsp.gpjymy.jsp.624662580'/>|<s:text name='Recharge_details'/></title>
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
      <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='Gold_coin_management'/></p>
      <ul class="nav-secondary">
       <%@ include file="/mainUI/common/scendhead.jsp" %>
      </ul>
    </div>
  </div>
  <!-- 会员中心导航模块 end -->
  <!-- 积分理财内容 -->
  <div class="container">
    <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
      <div class="dialog-widget">
      <p class="dialog-title"><s:text name='Recharge_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
	          <thead>
	              <tr>
	                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.821575720'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.989728617'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640388245a'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640388245'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640372301'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.777033699'/></th>
	                <th><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.25449993'/></th>
	                <th>IP<s:text name='viewgrxx-loginlog.jsp.grxx-loginlog.jsp.714256'/></th>
	              </tr>
	            </thead>
            <tbody>
               <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.cjuser}</td>
					<td>${data.dqcj}</td>
					<td>${data.ljcj}</td>
					<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
					<td><fmt:formatDate value="${data.qldate}" type="both"/></td>
					<td>${data.cjfs}</td>
					<td>${data.bz}</td>
					<td>${data.cz}</td>
					<td>${data.ip}</td>
				</tr>
			   </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
 <aldtags:pageTag/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
