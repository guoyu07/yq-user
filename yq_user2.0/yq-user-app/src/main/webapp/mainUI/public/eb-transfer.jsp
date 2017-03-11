<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，您转账一币不能小于零或超过100000，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('转账必须是100的倍整数如：100，200，300，400，500，1000，5000，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，不能转给自己，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('只能转给自己团队的并已进入双区的玩家！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('VIP玩家一币账户余额必须大于或等于60w！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您转账一币不能大于您剩余一币 ${gcuser.pay} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('转入的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('VIP玩家一币账户余额必须大于或等于5w！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('非vip不能操作该功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('该玩家的上级vip不是您！您不能转给他！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('该玩家是大vip！您不能转给他！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('您只是小vip！不能转给您团队下的小vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('被转对象vip标识错误，请截图后联系管理员！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('您好！转账成功！');location.replace('datepay?secondThisState=249&thisState=244');</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币转出</title>
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
    <p class="breadcrumb-trail">财富中心 >> 一币理财</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
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
      <!-- 一币转出 -->
      <div class="main-widget">
        <p class="widget-title-line">一币转出</p>
        <form class="widget-form" method="POST" name="Form" onsubmit="return checkdate()" action="vipjzpay?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <p class="item">
            <label class="title">用户名：</label><span class="text"><b class="widget-warning">${userName}</b></span></p>
          <p class="item">
            <label class="title">您的一币为：</label><span class="text"><b class="widget-warning">${gcuser.pay}</b></span></p>
          <p class="item">
            <label class="title widget-warning">接收用户名：</label>
            <input type="text" name="jzuser" id="jzuser" size="15"><a herf="#" class="widget-button-small" id="J_chkUserName">查看姓名</a></p>
          <p class="item">
            <label class="title">转账一币：</label>
            <input type="text" name="jzpay" size="15" maxlength="10">
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa3" size="20">
          </p>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" name="submit2" onclick="return confirm('提示：您确定了吗？')">确定转账</button>
          </p>
        </form>
        <%-- <c:if test="${gcuser.vip==2}"><p class="widget-tips mt10"><a href="vipcjb">VIP充值管理（累计充值币：${gcuser.vipljcjb}）（已使用：${gcuser.vipsycjb}）（剩余：${gcuser.vipcjcjb}）</a></p></c:if> --%>
      </div>
    </div>
    <!-- 一币转出 end -->
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
function checkdate() {
  if (Form.jzpay.value == "") {
    alert("请填写您要转账的一币!");
    return false;
  }
  if (Form.jzpay.value < 99) {
    alert("转账的一币必须大于等于100!");
    return false;
  }
  if (Form.jzpay.value > ${gcuser.pay}) {
    alert("您的转账一币不能超过您剩余的一币${gcuser.pay}");
    return false;
  }
  if (Form.jzuser.value == "") {
    alert("请填写您要转入的用户名!");
    return false;
  }
  if (Form.jzuser.value == "${gcuser.username}") {
    alert("不能转给自己!");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码密码!");
    return false;
  }
  if (!chkinteger(Form.jzpay.value)) {
    alert('转账一币只能为整字!');
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
$('#J_chkUserName').on('click', function() {
  var thatVal = $('#jzuser').val();
  Check(thatVal);
});

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
