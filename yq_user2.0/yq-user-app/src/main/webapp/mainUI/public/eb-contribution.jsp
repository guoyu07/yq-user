<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('登录密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('捐助数量不能小于0');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('捐助数量最低为100！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('转出用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('转入用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('添加失败！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('YB不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！捐助成功！');location.replace('datepay');</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币捐助</title>
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
      <!-- 一笔捐助区 -->
      <div class="main-widget">
        <p class="widget-title-line">一币捐助区</p>
        <form class="widget-form" id="J_ebContributionForm" name="Form" method="POST" onSubmit="return checkdate()" action="ybPresent?status=1">
          <div class="form-content eb-content">
            <p class="item">
              <label class="title">捐助数量：</label>
              <input type="text" name="jzpay" />
            </p>
            <p class="item">
              <label class="title">输入登录密码：</label>
              <input type="password" name="pa" size="20"/>
            </p>
            <p class="item">
              <label class="title">输入二级密码：</label>
              <input type="password" name="pa3" size="20"/>
            </p>
            <p class="button-line mt15 tc">
              <button class="widget-button" type="submit" name="submit2" onClick="return confirm('提示：您确定了吗？')">同意捐助</button>
            </p>
          </div>
        </form>
      </div>
      <!-- 一笔捐助区 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript">
function checkdate() {
  if (Form.jzpay.value == "") {
    alert("请填写您要转账的一币!");
    return false;
  }
  if (Form.jzpay.value < 99) {
    alert("捐助的一币必须大于等于100!");
    return false;
  }
  if (Form.jzpay.value > 100) {
    alert("您的转账一币不能超过您剩余的一币100");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码!");
    return false;
  }
  if (Form.password.value == "") {
    alert("请输入登录密码!");
    return false;
  }
  if (!chkinteger(Form.jzpay.value)) {
    alert('转账一币只能为整字!');
    document.Form.jzpay.focus;
    return (false);
  }

  function chkinteger(checkStr) {
    var checkOK = "0123456789";
    var allValid = true;
    for (i = 0; i < checkStr.length; i++) {
      ch = checkStr.charAt(i);
      if (checkOK.indexOf(ch) == -1) {
        allValid = false;
        break;
      }
      if ((ch == '+' || ch == '-') && i > 0) {
        allValid = false;
        break;
      }
    }
    return (allValid);
  }
  return true;
}
</script>
</body>

</html>
