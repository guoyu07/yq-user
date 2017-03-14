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
  <title>会员中心|商城购物券退款</title>
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
    <p class="breadcrumb-trail">财富中心 >> 商城管理</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 商城管理内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- 商城购物券退款 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">商城购物券退款</p>
        <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/backscores?status=1">
          <p class="item">
            <label class="title widget-warning">转出用户名:</label>
            <input type="text" name="fromUser" size="15" maxlength="20" />
            <input type="button" class="widget-button-small" value="设置成商户" name="btnn" id="btnn" onclick="setmaller(3)" style="cursor: pointer" />
            <input type="button" class="widget-button-small" value="取消商家" name="btnn" id="btnn" onclick="setmaller(0)" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title">转入用户名:</label>
            <input type="text" name="jzuser" size="15" maxlength="20" />
          </p>
          <p class="item">
            <label class="title">转账金额：</label>
            <input type="text" name="jzpay" />
          </p>
          <p class="item">
            <label class="title">操作密码：</label>
            <input type="password" name="pa3" />
          </p>
          <p class="item">
            <label class="title">转账原由：</label>
            <input type="text" name="yy" />
          </p>
          <p class="item special">
            <label class="title">
              <input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1">退款订单号：</label>
            <input type="text" name="dbz" id="dbz"/>
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" value="确定转账" name="submit2" onClick="return confirm('提示：您确定了吗？')">确定转账</button>
          </p>
        </form>
      </div>
      <!-- 商城购物券退款 end -->
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
    alert("请填写您要转账的购物券!");
    return false;
  }
  if (Form.jzpay.value < 0) {
    alert("转账的购物券必须大于0!");
    return false;
  }
  if (Form.jzuser.value == "") {
    alert("请填写您要转入的用户名!");
    return false;
  }
  if (Form.adgl.value == "") {
    alert("请写入操作密码!");
    return false;
  }
  if (Form.dbz.value == "" && document.getElementById("C1").checked) {
    alert("请写入商城订单号，必须为数字!");
    return false;
  }
}

function setmaller(txlb) {
  if (Form.fromUser.value == "") {
    alert("请填写您设置的商户名!");
    return false;
  }
  $("#btnn").attr("disabled", "disabled");
  //var data = $("#Form").serialize();
  $.post("/maller?fromUser=" + Form.fromUser.value + "&txlb=" + txlb, null, function(response) {
    $("#btnn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("设置失败");
      return false;
    }
    if (txlb == 3) {
      alert("设置商户成功");
    } else {
      alert("取消商户成功！");
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
