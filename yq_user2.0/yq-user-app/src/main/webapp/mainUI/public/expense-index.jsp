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
  <title><s:text name='Member_center'/>|<s:text name='Consumption_management'/></title>
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
  <div class="expense-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='viewhead.jsp.head.jsp.871093494'/></p>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 消费管理内容 -->
<div class="container">
  <div class="member-content-grey" id="J_memberContent">
    <div class="member-main-grey-full">
      <!-- <s:text name='Young_leaders_of_the_future_training_camp_eloquence_notice'/> -->
      <div class="widget-list">
        <a class="item"  target="_blank" href="http://www.qlsme.com/shop/index.php?act=login&op=ycvipindex&userName=<%=gcuserJflc2xxx.getUsername()%>&sign=<%=sign%>&time=<%=time%>"><img src="${ctx}/img/expense_list_01${SESSION_LOCALE}.jpg" alt="<s:text name='HAPPY100_online'/>" title="<s:text name='HAPPY100_online'/>"></a>
        <a class="item"  target="_blank" href="http://www.kypwe.com/Ebooking/index!toindex.jspx"><img src="${ctx}/img/expense_list_02${SESSION_LOCALE}.jpg" alt="<s:text name='keshanpiaowu'/>" title="<s:text name='keshanpiaowu'/>"></a>
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
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1822162869'/>!");
    Form.babyName.focus();
    return false;
  }
  if (Form.babyAge.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1822106815'/>!");
    Form.babyAge.focus();
    return false;
  }
  if (Form.dadyName.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1644201045'/>!");
    Form.dadyName.focus();
    return false;
  }
  if (Form.dadyAge.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1644144991'/>!");
    Form.dadyAge.focus();
    return false;
  }
  if (Form.dadyCall.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.775311534'/>!");
    Form.dadyCall.focus();
    return false;
  }
  if (Form.momName.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1838553685'/>!");
    Form.momName.focus();
    return false;
  }
  if (Form.momAge.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1838497631'/>!");
    Form.momAge.focus();
    return false;
  }
  if (Form.momCall.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1313981778'/>!");
    Form.momCall.focus();
    return false;
  }
  if (Form.address.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-1846478333'/>!");
    Form.address.focus();
    return false;
  }
  if (Form.details.value == "") {
    alert("<s:text name='viewxfgl-baby.jsp.xfgl-baby.jsp.-645253644'/>!");
    Form.details.focus();
    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    Form.pa3.focus();
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=12", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
      return false;
    }
    settime($("#btn"), '#SESSION_LOCALE');
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
  });
  return false;
}

function checkdate1() {
  if (Form.smsCode.value == "") {
    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");
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
