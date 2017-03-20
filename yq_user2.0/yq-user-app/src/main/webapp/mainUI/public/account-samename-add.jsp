<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('此用户名已有人使用！请更换！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('恭喜同姓名用户注册成功，请进行下一步的操作！');location.href='userlist?secondThisState=292&thisState=245'</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|添加同名用户</title>
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
    <p class="breadcrumb-trail">账户管理 >> 同名账户管理</p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 账户管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <div class="main-widget">
        <p class="widget-title-line">添加同名用户说明</p>
        <div class="widget-article">
          <p class="widget-notice">此处注册为当前登录账户快捷添加同姓名新用户使用，仅需要自定义一个新用户名，其它资料与当前登录账户相同！</p>
          <p class="widget-notice mt10">如您需要注册不同姓名的新用户<a class="widget-warning ml10" href="reg">点击这里注册新账户</a></p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line">添加同名用户</p>
        <form class="widget-form" method="POST" action="regTheSame?status=1&thisState=${thisState}&secondThisState=292" name="Form" onSubmit="return checkdate()">
          <p class="item mt15">
            <label class="title">用户名：</label>
            <input type="text" name="gguser" maxlength="12" onkeyup="value=value.replace(/[\W]/g,'')" />
          </p>
          </p>
          <p class="item">
            <label class="title">一级密码：</label><span class="text">与当前登录账户相同</span></p>
          <p class="item">
            <label class="title">二级密码：</label><span class="text">与当前登录账户相同</span></p>
          <p class="item">
            <label class="title">姓名：</label><span class="text">${gcuser.name}</span></p>
          <p class="item">
            <label class="title">推荐人：</label><span class="text">${gcuser.username}</span></p>
          <p class="item">
            <label class="title">协议及声明：</label>
            <select class="widget-select" name="sfz">
              <option selected="" value="0">==请选择是否同意协议及声明==</option>
              <option value="0">不同意！</option>
              <option value="1">同意协议及声明，自愿参与！</option>
            </select>
            <a class="widget-warning ml10" href="javascript:openwindow('/sfz.html')">阅读协议及声明</a>
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit">提交注册</button>
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
      alert("提示：用户名不能为空!！");
      Form.gguser.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.gguser.value) || Form.gguser.value.length > 10 || Form.gguser.value.length < 4) {
      alert("提示：您的用户名不符合规范，必须4-12个小写英文字母+数字！");
      Form.gguser.focus();
      return false;
    }
    var uName = document.Form.gguser.value;
    var ajaxobj = new Ajax();
    ajaxobj.url = "checkreg?gguser=" + uName;
    ajaxobj.callback = function() {
      var responseMsg = eval('(' + ajaxobj.gettext() + ')');
      if (responseMsg.erroCodeNum != 0) {
        alert("对不起，用户名：" + uName + "，已经被注册了！");
        return;
      } else {
        alert("恭喜，您可以注册用户名：" + uName);
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
      alert("用户名不能为空!");
      Form.gguser.focus();
      return false;
    }
    if (!CheckIfEnglish(Form.gguser.value) || Form.gguser.value.length > 12 || Form.gguser.value.length < 4) {
      alert("提示：您的用户名不符合规范，必须4-12个小写英文字母+数字！");
      Form.gguser.focus();
      return false;
    }

    if (Form.sfz.value == 0) {
      alert("请您认真查看协议及声明，只有同意后才可以继续");
      return false;
    }
    return true;
  }
  </script>
  </body>

  </html>
