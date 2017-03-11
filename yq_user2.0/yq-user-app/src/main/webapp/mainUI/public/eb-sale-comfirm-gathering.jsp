<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-712205750'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-2080179417'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-51880318'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-1011373655'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='vipmcepok.jsp.mcepok.jsp.-373366424'/>！');location.replace('epmcjl?secondThisState=249&thisState=244');</script></c:if>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币卖出确认收款</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title">一币卖出确认收款</p>
      <div class="dialog-wrap-border main-widget">
        <form class="widget-form" method="POST" action="mcepok?status=1&payId=${payId}" id="Form" name="Form" onSubmit="return checkdate1()">
          <p class="widget-notice widget-warning mt15 ml10">您正在操作确认收款，请确认是否收到相关款项！</p>
          <p class="item mt15">
            <label class="title">用户名：</label><span class="text">${txpay.payusername}</span>
            <input type="hidden" name="user" size="10" value="${txpay.payusername}" readonly>
          </p>
          <p class="item">
            <label class="title">姓名：</label><span class="text">${txpay.payname}</span>
            <input type="hidden" name="remark" size="8" value="5" readonly>
          </p>
          <p class="item">
            <label class="title">收款银行：</label><span class="text">${txpay.paybank}</span></p>
          <p class="item">
            <label class="title">收款账号：</label><span class="text">${txpay.paycard}</span></p>
          <p class="item">
            <label class="title">实收金额：</label><span class="text">${txpay.paynum9}</span></p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="password3" />
          </p>
          <p class="item">
            <label class="title">联系手机：</label><span class="text">${gcuser.simpleCall}</span></p>
          <p class="item">
            <label class="title">手机验证码：</label>
            <input type="text" name="smsCode" />
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2"/>
          </p>
          <p class="button-line mt15">
            <input class="widget-button" type="submit" value="确认收到款" name="B1"/>
          </p>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.password3.value == "") {
    alert("请填入您的二级密码!");
    Form.password3.focus();
    return false;
  }
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=4", data, function(response) {
    $("#btn").removeAttr("disabled");
    if (response.erroCodeNum != 0) {
      alert("手机验证码发送失败");
      return false;
    }
    settime($("#btn"));
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
btnStatus($("#btn"))
</script>
</body>

</html>
