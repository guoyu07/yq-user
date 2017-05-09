<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-931208490'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.1935130424'/>！');location.href='userlist?secondThisState=292&thisState=245'</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='accountcannotcreatesamename'/>！');history.go(-1);</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.1616957653'/></title>
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
        <p class="widget-title-line"><s:text name='Add_a_user_with_the_same_specifications'/></p>
        <div class="widget-article">
          <p class="widget-notice"><s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.-1290755823'></s:text></p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewzhgl-regthesame.jsp.zhgl-regthesame.jsp.1616957653'/></p>
        <form class="widget-form" method="POST" action="regTheSame?status=1&thisState=${thisState}&secondThisState=292" name="Form" onSubmit="return checkdate()">
          <p class="item mt15">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>
            <input type="text" name="gguser" maxlength="12" onkeyup="value=value.replace(/[\W]/g,'')" />
          </p>
          </p>
          <p class="item">
            <label class="title"><s:text name='reg1.jsp.reg1.jsp.626784226'/>：</label><span class="text"><s:text name='vipreg.jsp.reg.jsp.-1975491897'/></span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><span class="text"><s:text name='vipreg.jsp.reg.jsp.-1975491897'/></span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.734362'/>：</label><span class="text">${gcuser.name}</span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.25579282'/>：</label><span class="text">${gcuser.username}</span></p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.-692292151'/>：</label>
            <select class="widget-select" name="sfz">
              <option selected="" value="0">==<s:text name='reg.jsp.reg.jsp.2105797912'/>==</option>
              <option value="0"><s:text name='reg.jsp.reg.jsp.19893584'/>！</option>
              <option value="1"><s:text name='reg.jsp.reg.jsp.1259576711'/>！</option>
            </select>
            <a class="widget-warning ml10" href="javascript:openwindow('/sfz.html')"><s:text name="viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-692292151"></s:text></a>
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit"><s:text name='reg.jsp.reg.jsp.-1871876984'/></button>
          </p>
        </form>
      </div>
    </div>
  </div>
  <!-- 账户管理内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  <SCRIPT>
  <!--
  function openwindow(url) {
    window.open(url, 'new', 'toolbar=no,scrollbars=yes,width=800,height=650');
  }
  //-->
  </SCRIPT>
  <script language="javascript" src="/js/ajax.js"></script>
  <script language="JavaScript">
  function Check() {
    if (Form.gguser.value == "") {
      alert("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
      Form.gguser.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.gguser.value) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
      alert("<s:text name='index.jsp.index.jsp.-1848386260'/>");
      Form.gguser.focus();
      return false;
    }
    var uName = document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url = "checkreg?gguser=" + uName;
    ajaxobj.callback = function() {
      var responseMsg = eval('(' + ajaxobj.gettext() + ')');
      if (responseMsg.erroCodeNum != 0) {
        alert("<s:text name='reg.jsp.reg.jsp.842685271'/>！");
        return;
      } else {
        alert("<s:text name='reg.jsp.reg.jsp.-259258343'/>：" + uName);
        return;
      }
    }
    ajaxobj.send();
  }

  function CheckIfEnglish(str) {
		if (/[a-z]/.test(str) && /[0-9]/.test(str)) {
			return true;
		} else {
			return false;
		}
	}
  
  function checkdate() {
    if (Form.gguser.value == "") {
      alert("<s:text name='reg.jsp.reg.jsp.-609490706'/>!");
      Form.gguser.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.gguser.value) || Form.gguser.value.length > 12 || Form.gguser.value.length < 4) {
      alert("<s:text name='index.jsp.index.jsp.-1848386260'/>！");
      Form.gguser.focus();
      return false;
    }

    if (Form.sfz.value == 0) {
      alert("<s:text name='reg.jsp.reg.jsp.741412114'/>");
      return false;
    }
    return true;
  }
  </script>
  </body>

  </html>
