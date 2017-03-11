<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-61194610'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1119381593'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1476527375'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-47326774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.246684949'/>！');location.replace('/datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|商城退款</title>
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

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <div class="member-main-full">
      <!-- 商城退款 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">商城退款</p>
        <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="/glpay?status=1">
          <p class="item">
            <label class="title">转出用户名:</label>
            <input type="text" name="fromUser" id="fromUser" size="15" maxlength="20" value="${userName}">
            <input type="button" class="widget-button-small" onClick="Check(document.getElementById('fromUser').value)" value="查看姓名" name="B3" style="cursor: pointer">
          </p>
          <p class="item">
            <label class="title">转入用户名:</label>
            <input type="text" name="jzuser" id="jzuser" size="15" maxlength="20">
            <input type="button" class="widget-button-small" onClick="Check(document.getElementById('jzuser').value)" value="查看姓名" name="B3" style="cursor: pointer">
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
          <p class="item">
            <label class="title">选择折扣：</label>
            <select class="widget-select" name="ration">
              <option value="0.9" selected>0.9</option>
              <option value="0.95">0.95</option>
              <option value="0">无折扣</option>
            </select>
            <p class="item special">
              <label class="title"><input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1">退款订单号：</label>
              <input type="hidden" name="dbz" id="dbz"/>
            </p>
            <p class="button-line mt15">
              <button class="widget-button" type="submit" value="确定转账" name="submit2" onClick="return confirm('提示：您确定了吗？')">确定转账</button>
            </p>
        </form>
      </div>
      <!-- 商城退款 end -->
    </div>
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.jzpay.value == "") {
    alert("请填写您要转账的一币!");
    return false;
  }
  if (Form.jzpay.value < 0) {
    alert("转账的一币必须大于0!");
    return false;
  }
  if (Form.jzuser.value == "") {
    alert("请填写您要转入的用户名!");
    return false;
  }
  if (Form.adgl.value == "") {
    alert("操作!");
    return false;
  }
  if (Form.dbz.value == "" && document.getElementById("C1").checked) {
    alert("请写入商城订单号，必须为数字!");
    return false;
  }
}

function dbz_show() {
  if (document.getElementById("C1").checked){
    document.getElementById("dbz").type = "text";
  }
  else {
    document.getElementById("dbz").type = "hidden";
    document.getElementById("dbz").value = "";
  }
}

function Check(user) {
  if (user == "") {
    alert("提示：用户名不能为空!！");
    return false;
  }
  $.post("checkUserName?user=" + user, null, function(response) {
    if (response.code == 0) { //注册成功
      alert('用户名：[' + user + ']，姓名:[' + response.name + "]");
    } else {
      alert('用户名：' + user + '，不存在，请重新写入！');
    }
    return true;
  });
}
</script>
</body>

</html>
