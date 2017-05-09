<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.852652361'/></title>
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
        <!-- 金币卡明细 大概是一页10行数据-->
        <div class="main-widget">
          <p class="widget-title"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.852652361'/></p>
          <div class="widget-table mt5 middle-size">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.871112722'/></th>
                  <th><s:text name='viewjflc-activie-gold-look.jsp.jflc-activie-gold-look.jsp.-1226774048c'/></th>
                  <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.918196047'/></th>
                  <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-2035480698'/></th>
                  <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
                </tr>
              </thead>
              <tbody>
               <s:iterator var="data" value="dataList">
               <tr>
                  <td>${data.pdid}</td>
				  <td>${data.bf2}0</td>
                  <td><span class="text">${data.gmdate}</span></td>
                  <td><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.1402093537'/>。</td>
                  <td><c:if test="${data.gpa>1}"><a   href="glfhk?id=${data.pdid}&secondThisState=${secondThisState}&thisState=${thisState}"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.544376205'/></a></c:if>
					<c:if test="${data.gpa<=1}"><a  href="glfhk?id=${data.pdid}&secondThisState=${secondThisState}&thisState=${thisState}" ><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-1380739490'/></a></c:if></td>
                </tr>
				</s:iterator>
              </tbody>
            </table>
          </div>
          <p class="widget-pages">
            <aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"/>
          </p>
        </div>
        <!-- <s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.852652361'/> end -->
      </div>
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
