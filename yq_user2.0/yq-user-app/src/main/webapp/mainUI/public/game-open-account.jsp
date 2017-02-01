<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('结算期间暂停开户，明天开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('此功能，需联系推荐人选择适合的位置升级！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|开户</title>
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
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
   <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/gameservice.jsp" %>
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 开户 -->
      <div class="main-widget">
        <p class="widget-title-line">开户</p>
        <p class="small-button-line">
          <a class="widget-warning" href="javascript:history.back();">返回上一页</a>
        </p>
        <form class="widget-form" method="POST" action="bdreg" name="Form" onSubmit="return checkdate()">
          <input type="hidden" name="status" value="${status}">
          <p class="item">
            <label class="title">选择接点人：</label><b class="widget-warning"><input type="hidden" name="up" readonly value="${myup}">${myup}</b></p>
          <p class="item">
            <label class="title">开户用户名：</label>
            <input type="text" name="bduser" value="${bdid}" /><span class="text"> 系统默认从左到右放置</span></p>
          <p class="item">
            <label class="title">选择套餐：</label>
            <select class="widget-select" name="cjpay">
              <option selected value="0">==请选择您要消费的套餐==</option>
              <option value="10000">1万-报单币</option>
              <option value="20000">2万-报单币</option>
              <option value="50000">5万-报单币</option>
              <option value="1000">1千（一币）</option>
              <option value="2000">2千（一币）</option>
              <option value="5000">5千（一币）</option>
            </select>
          </p>
          <p class="item">
            <label class="title">输入登录密码：</label>
            <input type="password" name="pa1j" />
          </p>
          <p class="item">
            <label class="title">输入二级密码：</label>
            <input type="password" name="pa2j" />
          </p>
          <p class="widget-notice mt15">费用将从您的(<span class="widget-warning">${userName}</span>)报单币或一币帐户扣除</p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button">提交</button>
          </p>
        </form>
      </div>
      <!-- 开户 end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.bduser.value == "") {
    alert("开户用户名不能为空!");
    return false;
  }
  if (Form.cjpay.value == 0) {
    alert("请选择一个套餐！");
    return false;
  }
  if (Form.pa1j.value == "") {
    alert("请输入登录密码！");
    return false;
  }
  if (Form.pa2j.value == "") {
    alert("请输入二级密码！");
    return false;
  }
  return true;
}
</script>
</body>

</html>
