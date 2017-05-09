<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1923400400'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.1141572332'/>！');location.replace('epmcjl');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewlogin3j.jsp.login3j.jsp.-830018135'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-898207976'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.529929694'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.174913287'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.262431727'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.1396615689'/>！');location.href='tjz?secondThisState=275&thisState=245'</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.594399145'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.1926370358'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='Transferpolicycurrencylessthan0'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='Cannotgiveoneselfto'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-1964813948'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==101}"><script language=javascript>alert('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.573081321'/>');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-48484697'/></title>
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
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-48484697'/></p>
        <c:if test="${empty dataList}">
		<div class="a-transfer">
			<p><s:text name='No_transfer_of_the_same_name_account!'/></p>
		</div>
		</c:if>
		<c:if test="${not empty dataList}">
        <form class="widget-form" method="POST" action="tjz?status=1" name="form" id="form">
              <input type="hidden" name="thisState" value="${thisState}">
    <input type="hidden" name="secondThisState" value="${secondThisState}">
          <p class="item">
            <label class="title"><s:text name="Transferstype"></s:text>：</label>
            <select class="widget-select Transfer-type" name="tp">
              <option value="0"><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></option>
              <option value="1"><s:text name='viewuser.jsp.user.jsp.35660508'/></option>
              <option value="2"><s:text name='Order'/></option>
            </select>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa2j" size="15">
          </p>
          </p>
          <p class="item">
            <button class="widget-button-small" type="submit" onClick="return cf()"><s:text name='Batch_submission'/></button><s:text name='Current_login_username'/>：<b class="widget-warning">${userName}</b>
          </p>
          <div class="widget-table">
            <table border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  <td class="checked-all-wrap" colspan="6"><input class="checked-all" type='checkbox' name="chkall" onclick="CheckAll(this.form)"><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.682913'/></td>
                </tr>
              </thead>
              <tbody>
              <s:iterator var="data" value="dataList">
                <tr>
                  <td>
                    <input type="checkbox" name="fromUsers" value="${data.username}">
                  </td>
                  <td>${data.username}</td>
                  <td>${data.name}</td>
                  <td><s:text name='Convertible_currency'/>:
                  <c:choose>
                  		<c:when test="${data.pay-data.vippay<0}"><input type="hidden" name="tpay" size="10" value="0" readonly>0</c:when>
                  		<c:otherwise ><input type="hidden" name="tpay" size="10" value="${data.pay-data.vippay}" readonly>${data.pay-data.vippay}</c:otherwise>
                  </c:choose>
                  </td>
                  <td><s:text name='viewuser.jsp.user.jsp.35660508'/>:${data.scores}</td>
                  <td><s:text name='viewlinks.html.links.html.-1788801323'/>:${data.sybdb}</td>
                </tr>
                </s:iterator>
              </tbody>
            </table>
           
            <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="thisState,${thisState},secondThisState,${secondThisState}"  />
</p>
<!-- 会员中心翻页组件 end -->

          </div>
        </form>
         </c:if>
      </div>
    </div>
  </div>
    <!-- 账户管理内容 end -->
    <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
  //全选操作    
  function CheckAll(form) {
    for (var i = 0; i < form.elements.length; i++) {
      var e = form.elements[i];
      if (e.name != 'chkall') e.checked = form.chkall.checked;
    }
  }

  function cf() {
    if (form.tp.value == 0) {
      return confirm('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-474644738'/>?');
    }
    if (form.tp.value == 1) {
      return confirm('<s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.-1733349801'/>?');
    }
    if (form.tp.value == 2) {
      return confirm('<s:text name='querenbaodanbishuliang'/>?');
    }
  }
  </script>
  </body>

  </html>
