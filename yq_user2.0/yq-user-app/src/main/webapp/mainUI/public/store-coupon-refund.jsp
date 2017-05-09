<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-61194610'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1523887120'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1770252909'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1147694370'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3001}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-47326774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.246684949'/>！');location.replace('/userscoreslog?secondThisState=291&thisState=244');</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='Mall_management'/></p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 商城管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- <s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/> -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/></p>
        <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/backscores?status=1">
          <p class="item">
            <label class="title widget-warning"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792'/>:</label>
            <input type="text" name="fromUser" size="15" maxlength="20" />
            <input type="button" class="widget-button-small" value="<s:text name='setsellerasmerchant'/>" name="btnn" id="btnn" onclick="setmaller(3)" style="cursor: pointer" />
            <input type="button" class="widget-button-small" value="<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1081070777b'/>" name="btnn" id="btnn" onclick="setmaller(0)" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-377971233'/>:</label>
            <input type="text" name="jzuser" size="15" maxlength="20" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129727398'/>：</label>
            <input type="text" name="jzpay" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.789039466'/>：</label>
            <input type="password" name="pa3" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129224748'/>：</label>
            <input type="text" name="yy" />
          </p>
          <p class="item special">
            <label class="title">
              <input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614'/>：</label>
            <input type="text" name="dbz" id="dbz"/>
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" value="<s:text name='Definite_transfer'/>" name="submit2" onClick='return confirm("<s:text name='vipgpjymy.jsp.gpjymy.jsp.1046836541'/>")'><s:text name='Definite_transfer'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 商城管理内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.jzpay.value == "") {
    alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1476772112'/>!");
    return false;
  }
  if (Form.jzpay.value < 0) {
    alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.778936623'/>0!");
    return false;
  }
  if (Form.jzuser.value == "") {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1569959089'/>!");
    return false;
  }
  if (Form.adgl.value == "") {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-201974515'/>!");
    return false;
  }
  if (Form.dbz.value == "" && document.getElementById("C1").checked) {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1237533928'/>!");
    return false;
  }
}

function setmaller(txlb) {
  if (Form.fromUser.value == "") {
    alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.618310955'/>!");
    return false;
  }
  $("#btnn").attr("disabled", "disabled");
  //var data = $("#Form").serialize();
  $.post("/maller?fromUser=" + Form.fromUser.value + "&txlb=" + txlb, null, function(response) {
    $("#btnn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1097836932'/>");
      return false;
    }
    if (txlb == 3) {
      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1580305552'/>");
    } else {
      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1059539826'/>！");
    }
  });

}

function dbz_show() {
  if (document.getElementById("C1").checked)
    document.getElementById("dbz").style.display = "";
  else {
    document.getElementById("dbz").style.display = "none";
    document.getElementById("dbz").value = "";
  }
}
dbz_show();
</script>
</body>

</html>
