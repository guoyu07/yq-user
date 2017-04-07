<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%
	UserService userServiceJflc2xxx = ServiceCacheFactory.getServiceCache().getService(UserService.class);
	Gcuser gcuserJflc2xxx = userServiceJflc2xxx.getUserByUserName(userServiceJflc2xxx.isLogin(request.getSession().getId()));
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>会员中心|消费管理</title>
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
  <div class="expense-header" id="J_memberHeader">
    <p class="breadcrumb-trail">消费管理</p>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 消费管理内容 -->
<div class="container">
  <div class="member-content-grey" id="J_memberContent">
    <div class="member-main-grey-full">
      <!-- 未来领袖青少年口才训练营报名须知 -->
      <div class="widget-list">
        <a class="item"  target="_blank" href="http://www.qlsme.com/shop/index.php?act=login&op=ycvipindex&userName=<%=gcuserJflc2xxx.getUsername()%>&sign=<%=sign%>&time=<%=time%>"><img src="${ctx}/img/expense_list_01.jpg" alt="幸福一百云购在线" title="幸福一百云购在线"></a>
        <a class="item"  target="_blank" href="http://www.kypwe.com/Ebooking/index!toindex.jspx"><img src="${ctx}/img/expense_list_02.jpg" alt="科赡票务" title="科赡票务"></a>
      </div>
    </div>
  </div>
</div>
</div>
<!-- 消费管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.babyName.value == "") {
    alert("请填入宝宝姓名!");
    Form.babyName.focus();
    return false;
  }
  if (Form.babyAge.value == "") {
    alert("请填入宝宝年龄!");
    Form.babyAge.focus();
    return false;
  }
  if (Form.dadyName.value == "") {
    alert("请填入爸爸姓名!");
    Form.dadyName.focus();
    return false;
  }
  if (Form.dadyAge.value == "") {
    alert("请填入爸爸年龄!");
    Form.dadyAge.focus();
    return false;
  }
  if (Form.dadyCall.value == "") {
    alert("请填入爸爸联系方式!");
    Form.dadyCall.focus();
    return false;
  }
  if (Form.momName.value == "") {
    alert("请填入妈妈姓名!");
    Form.momName.focus();
    return false;
  }
  if (Form.momAge.value == "") {
    alert("请填入妈妈年龄!");
    Form.momAge.focus();
    return false;
  }
  if (Form.momCall.value == "") {
    alert("请填入妈妈联系方式!");
    Form.momCall.focus();
    return false;
  }
  if (Form.address.value == "") {
    alert("请填入详细的地址!");
    Form.address.focus();
    return false;
  }
  if (Form.details.value == "") {
    alert("请填入宝宝的描述!");
    Form.details.focus();
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码密码!");
    Form.pa3.focus();
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=12", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("手机验证码发送失败");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("手机验证码发送成功");
  });
  return false;
}

function checkdate1() {
  if (Form.smsCode.value == "") {
    alert("请先点击获取验证码，然后再填入您的手机收到的验证码");
    Form.smsCode.focus();
    return false;
  }
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');
</script>
</body>

</html>
