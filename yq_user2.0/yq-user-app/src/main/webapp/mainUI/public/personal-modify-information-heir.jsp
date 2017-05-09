<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Account_manage'/> >> <s:text name='The_same_account_management'/></p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
     <div class="member-main-full">
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/> -->
      <!-- <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/></p>
        <div class="widget-article">
          <p class="widget-notice"><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《平台用户名转让申请书》</a></p>
        </div>
      </div> -->
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/> end -->
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/></p>
        <p class="small-button-line"><!-- <a href="userga" class="widget-button-small"><s:text name='viewgrxx-edit-userinfo.jsp.grxx-edit-userinfo.jsp.472164400'/></a> --></p>
        <form class="widget-form" method="post" action="" name="Form" id="Form" onSubmit="return false">
          <p class="widget-notice widget-warning mt15"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-2147423581'/>！</p>
          <p class="item mt15">
            <label class="title"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.708938076'/>：</label>
            <input type="text" maxlength="32" name="jcname" value="${gcuser.jcname}" <c:if test="${not empty gcuser.jcname}">readonly</c:if> />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1224987511'/>：</label>
            <input type="text" maxlength="19" name="jcuserid" value="${gcuser.jcuserid}" <c:if test="${not empty gcuser.jcuserid}">readonly</c:if>/>
          </p>
          <p class="button-line mt15">
            <button type="submit" class="widget-button" onClick="checkdate();"><s:text name='increase'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 账户管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {

  if (Form.jcname.value == "") {
    alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-849491093'/>!");
    Form.jcname.focus();
    return false;
  }
  if (Form.jcname.value.length < 2) {
    alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1970552070'/>!");
    Form.jcname.focus();
    return false;
  }
  if (Form.jcname.value.length > 8) {
    alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1715922523'/>!");
    Form.jcname.focus();
    return false;
  }
  if (Form.jcuserid.value == "") {
    alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1596209606'/>!");
    Form.jcuserid.focus();
    return false;
  }
  if (Form.jcuserid.value.length < 18) {
    alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1560156081'/>!");
    Form.jcuserid.focus();
    return false;
  }
  if (Form.jcuserid.value.length > 18) {
    alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1814845210'/>!");
    Form.jcuserid.focus();
    return false;
  }

  var data = $("#Form").serialize();
  $.post("updateuserjc?status=1", data, function(response) {
    if (response.erroCodeNum == 0) { //注册成功
      alert('<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1456138858'/>！');
      return false;
    } else if (response.erroCodeNum == 1) {
      alert('<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-26097813'/>');
      return false;
    } else {
      alert('<s:text name='resetUserPass.jsp.resetUserPass.jsp.-745085746'/>.[' + response.erroCodeNum + ']');
      return false;
    }
  });
  return true;
}
</script>
<script>
function openwindow2(url) {
  window.open(url, 'new', 'toolbar=no,scrollbars=yes,width=800,height=850');
}
</script>
</body>

</html>
