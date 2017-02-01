<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|金币卡明细</title>
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
      <ul class="nav-secondary">
       <%@ include file="/mainUI/common/scendhead.jsp" %>
      </ul>
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
        <!-- 金币卡明细 大概是一页10行数据-->
        <div class="main-widget">
          <p class="widget-title">金币卡明细</p>
          <div class="widget-table mt5 middle-size">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  <th>消费编号</th>
                  <th>金币面值</th>
                  <th>生成时间</th>
                  <th>该卡目前状态</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
               <s:iterator var="data" value="dataList">
               <tr>
                  <td>${data.pdid}</td>
				  <td>${data.bf2}0</td>
                  <td><span class="text">${data.gmdate}</span></td>
                  <td>还没有激活，请通知客户尽快激活以便购买积分增值。</td>
                  <td><c:if test="${data.gpa>1}"><a  href="javascript:void(0);" class="JQ_goDialog" data-url="glfhk?id=${data.pdid}">已查看过密码，需要重置或激活</a></c:if>
					<c:if test="${data.gpa<=1}"><a  href="javascript:void(0);" class="JQ_goDialog" data-url="glfhk?id=${data.pdid}" >重置(查看)该卡密码或激活</a></c:if></td>
                </tr>
				</s:iterator>
              </tbody>
            </table>
          </div>
          <p class="widget-pages">
            <aldtags:pageTag/>
          </p>
        </div>
        <!-- 金币卡明细 end -->
      </div>
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
