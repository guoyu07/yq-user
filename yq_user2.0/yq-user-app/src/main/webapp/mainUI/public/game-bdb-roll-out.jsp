<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('vip<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1100795047'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.386612509'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1556510827'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.594399145'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.1926370358'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.306392805'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.231633818'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1495661441'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.571194964'/>vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-2079296314'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|报单币转账</title>
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

<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
      <!-- 会员中心左边栏 -->
<div class="member-aside">
  <!-- VIP中心左边栏 -->
  <%@ include file="/mainUI/common/vipleft.jsp" %>
  <!-- VIP中心左边栏  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 报单币转账 -->
      <div class="main-widget">
        <p class="widget-title-line">报单币转账</p>
        <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="bdbzz?status=1">
          <p class="item mt15">
            <label class="title widget-warning">转出用户名：</label>
            <input type="text" name="jcname" value="${userName}" readonly="" />
          </p>
          <p class="item">
            <label class="title">转账数量：</label>
            <select class="widget-select" name="jzpay">
              <option selected="" value="10000">---- 1万 ----</option>
              <option value="20000">---- 2万 ----</option>
              <option value="30000">---- 3万 ----</option>
              <option value="50000">---- 5万 ----</option>
            </select>
            <span class="text"> 剩余：<b class="widget-warning">${sybdb}</b></span>
          </p>
          <p class="item">
            <label class="title">接受用户名：</label>
            <input type="text" name="syuser" />
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa3" />
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" onclick="return confirm('提示：您确定了吗？')">确定转账</button>
          </p>
        </form>
      </div>
      <!-- 报单币转账 end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.jcname.value == "") {
    alert("请写入转出用户名!");
    return false;
  }
  if (Form.jzpay.value < 5000) {
    alert("转账的金额必须大于5000!");
    return false;
  }
  if (Form.syuser.value == "") {
    alert("请填写接收用户名!");
    return false;
  }
  if (Form.jcname.value == Form.syuser.value) {
    alert("不能转给自己!");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码!");
    return false;
  }
  if (!chkinteger(Form.jzpay.value)) {
    alert('转账金额只能为整字!');
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
