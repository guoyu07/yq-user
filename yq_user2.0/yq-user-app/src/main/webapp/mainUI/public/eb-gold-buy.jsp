<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('注意：您的一币小于15，请充值！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('注意：您的一币不够本次购卡，请充值！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('二级密码不正确，请重新输入！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('电子卡发放及业绩更新成功！');location.href='datepay?secondThisState=${secondThisState}&thisState=${thisState}'</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币购金币卡</title>
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
    <p class="breadcrumb-trail">财富中心 >> 一币理财</p>
   <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
  <div class="member-main-full">
      <!-- 一币购金币卡规则 -->
      <div class="main-widget">
        <p class="widget-title-line">一币购金币卡规则</p>
        <div class="widget-article">
          <p class="widget-tips">按<span class="widget-warning">15-一币-买10金币</span>的比例，成功后显示相应金币卡,
            <br/>再到<span class="widget-warning">金币管理</span>下<a href="gmjh?secondThisState=251&thisState=244">激活金币卡</a>！</p>
        </div>
      </div>
      <!-- 一币购金币卡规则 end -->
      <!-- 一币购金币卡 -->
      <div class="main-widget mt10">
        <div class="widget-article">
          <form method="POST" action="jztojb?status=1&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
            <p class="widget-notice mt15"><b>请选择要购买的金币卡面值：</b></p>
            <p class="select-line">
              <select class="widget-select mt10" name="gmmj">
                <option value="0" selected="">==请选择金币卡面值==</option>
                <option value="1">10金币（15一币/张）</option>
                <option value="5">50金币（75一币/张）</option>
                <option value="10">100金币（150一币/张）</option>
                <option value="30">300金币（450一币/张）</option>
                <option value="50">500金币（750一币/张）</option>
                <option value="100">1000金币（1500一币/张）</option>
              </select>
              <span class="widget-warning">**</span>
              <button type="submit" class="widget-button ml60">确定购买</button>
              <div class="clear"></div>
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
<script>
/*验证交互*/
function checkdate() {
  if (Form.gmmj.value == 0) {
    alert("请选择你要购买的金币卡面值!");
    return false;
  }
  return true;
}
</script>
</body>

</html>
