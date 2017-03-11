<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|确认发布积分买入</title>
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
   <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
       <div class="member-main-full">
      <!-- 确认发布积分买入 -->
      <div class="main-widget">
        <p class="widget-title-line">确认发布积分买入</p>
        <div class="widget-article">
          <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/mysl?status=2&txpay=${txpay}&secondThisState=${secondThisState}&thisState=${thisState}">
            <p class="item">
              <label class="title">您要买入积分数量：</label><span class="text">${txpay}</span>
            </p>
            <p class="item">
              <label class="title">当前单价是：</label><span class="text">${jygj}</span>
            </p>
            <p class="item">
              <label class="title">即将从您的金币账户扣除：</label><span class="text"><b class="widget-warning">${needJf}</b>金币</span>
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button" onclick="bitch()">确定买入</button>
            </p>
          </form>
        </div>
      </div>
      <!-- 确认发布积分买入 end -->
    </div>
  </div>
</div>
<!-- 积分理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function bitch() {
  if (confirm("提示：您确定了吗？")) {
    location.href = "/mysl?status=2&txpay=${txpay}&secondThisState=${secondThisState}&thisState=${thisState}";
  }
}
</script>
</body>

</html>
