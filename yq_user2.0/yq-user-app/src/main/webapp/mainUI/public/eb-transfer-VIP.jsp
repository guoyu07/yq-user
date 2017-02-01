<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户名输入错误或不属于自己团队的玩家，请检查后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('充值密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('该用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('两分钟内只能充值一次，请稍后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您的充值币小于${cjpay}，无法完成充值，请联系管理员！！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('本次充值${cjpay}可一币小于${cjpay*9}，请先补充一币！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('充值成功！');location.href='vipcjb';</script></c:if>

<head>
  <meta chartset="UTF-8">
  <title>会员中心|VIP充值管理</title>
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
    <!-- 会员中心左边栏 -->
<div class="member-aside">
   <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
 	<%@ include file="/mainUI/common/yblc.jsp" %>
  <!-- 账户概览 end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- VIP充值管理 -->
      <div class="main-widget">
        <p class="widget-title-line">VIP充值管理</p>
        <form class="widget-form" method="POST" action="vipcj" name="form" onsubmit="return checkdate()">
          <p class="item">
            <label class="title">用户名：</label>
            <input type="text" name="cjuser">
          </p>
          <p class="item">
            <label class="title">充值金额：</label>
            <select class="widget-select" name="cjpay">
              <option selected="" value="0">==请选择==</option>
              <option value="1000">1000</option>
              <option value="2000">2000</option>
              <option value="5000">5000</option>
            </select>
          </p>
          <p class="item">
            <label class="title widget-warning">充值密码：</label>
            <input type="password" name="cjpass">
          </p>
          <p class="button-line mt15">
            <input class="widget-button" type="submit" value="提交充值" name="B1" id="B1"><span class="widget-tips ml10">（剩余：<b class="widget-warning">15000</b>）</span>
          </p>
        </form>
      </div>
      <!-- VIP充值管理 end -->
      <!-- VIP充值管理明细 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">VIP充值管理明细</p>
        <p class="small-button-line"><a href="javascript:void(0)" class="widget-button-small JQ_moreDialog" data-url="vipcjb?status=1" id="J_ebSaleDetailMore">查看更多</a></p>
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>编号</th>
                <th>充值用户名</th>
                <th>充值金额</th>
                <th>备注</th>
                <th>操作时间</th>
                <th>剩余充值币</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.cjid}</td>
					<td>${data.cjuser}</td>
					<td>${data.cjjo}</td>
					<td>${data.bz}</td>
					<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
					<td>${data.sycjb}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
      </div>
      <!-- VIP充值管理明细 end -->
    </div>
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (form.cjuser.value == "") {
    alert("请输入要充值的用户名!");
    form.cjuser.focus();
    return false;
  }
  if (form.cjpay.value == 0) {
    alert("请选择充值金额!");
    form.cjpay.focus();
    return false;
  }
  if (form.cjpay.value > ${gcuser.vipcjcjb}) {
    alert("您的余额不足!");
    form.cjpay.focus();
    return false;
  }
  if (form.cjpass.value == "") {
    alert("请输入您的充值密码!");
    form.cjpass.focus();
    return false;
  }
  if (confirm("温馨提示：请认真核对后再充值,一经充值不可以恢复,您确定了吗？")) {
    $("#B1").hide();
    return true;
  }
  return false;
}
</script>
</body>

</html>
