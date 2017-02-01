<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('注意：您的一币小于15，请充值！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('注意：您的一币不够本次购卡，请充值！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币购金币卡</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> <!-- 通用头部 -->
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
      <!-- 一币购金币卡 -->
      <div class="main-widget">
        <p class="widget-title-line">一币转换电子金币卡录入</p>
        <div class="widget-article">
          <form class="widget-form" action="jztojb?status=3&mj=${mj}&gmsl=${gmsl}" method="post" onSubmit="return checkdate();" name="Form" id="Form">
            <p class="item">
              <lable class="title">金币卡面值：</lable>
              <span class="text widget-warning">
							<c:if test="${mj==10}">10金币（15一币/张）</c:if>
							<c:if test="${mj==50}">50金币（75一币/张）</c:if>
							<c:if test="${mj==100}">100金币（150一币/张）</c:if>
							<c:if test="${mj==300}">300金币（450一币/张）</c:if>
							<c:if test="${mj==500}">500金币（750一币/张）</c:if>
							<c:if test="${mj==1000}">1000金币（1500一币/张）</c:if></span>
            </p>
            <p class="item">
              <lable class="title">购买金币卡数量：</lable>
              <span class="text"><b class="widget-warning">${gmsl}</b>张</span>
            </p>
            <p class="item">
              <lable class="title">将获取金币总数：</lable>
              <span class="text"><b class="widget-warning">${gmsl*mj}</b>个</span>
            </p>
            <p class="item">
              <lable class="title">消费一币数：</lable>
              <span class="text"><b class="widget-warning">${gmsl*mj*1.5}</b>一币</span>
            </p>
            <p class="item">
              <lable class="title">二级密码：</lable>
              <input type="password" name="pa3" />
            </p>
            <p class="button-line mt15">
              <button type="submit" class="widget-button">确定从我的一币-扣除</button>
            </p>
          </form>
        </div>
      </div>
      <!-- 一币购金币卡 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.pa3.value == "") {
    alert("请输入二级密码!");
    return false;
  }
  if (!confirm('提示：您确定了吗？ ')) {
    return false;
  }
  return true;
}
</script>
</body>

</html>
