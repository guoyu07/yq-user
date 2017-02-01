<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还没有到结算时间（每星期二22点后）！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('选择报单金额错误，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('登录密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码错误，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('报单币余额小于开户金额${cjpay}，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('一币余额小于开户金额${cjpay}，无法完成开户，请充值后再试！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('要开户的用户名不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('系统调试中，请重新注册新的用户名进行操作或联系您的推荐人！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('该姓名持有5万的账户已达到3个，不能再开设5万的账户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('开户人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('只能给自己的直接推荐的人开户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==15}"><script language=javascript>alert('接点人位置已被占用，请重新选择！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==16}"><script language=javascript>alert('验证码错误，请检查输入是否正确！');history.go(-2);</script></c:if>
<c:if test="${erroCodeNum==17}"><script language=javascript>alert('接点人必须在自己的团队下，请重新选择！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('为给家人们提供更好的服务，报单功能正在维护！预计上午8点完成！给您带来的不便请见谅！');history.go(-1);</script></c:if>
 
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|确认开户信息</title>
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
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <%@ include file="/mainUI/common/accountpart.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 业绩查询内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
<div class="member-aside">
  <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
  <%@ include file="/mainUI/common/gameservice.jsp" %>
  <!-- 账户概览  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 确认开户信息 -->
      <div class="main-widget">
        <p class="widget-title-line">确认开户信息</p>
        <p class="small-button-line">
          <a class="widget-warning" href="javascript:history.back();">返回上一页</a>
        </p>
        <form class="widget-form" method="POST" action="bdreg?step=7" name="Form" id="Form" onSubmit="return showZz()">
          <input type="hidden" name="status" value="${status}">
          <p class="item">
            <label class="title">选择接点人：</label>
            <b class="text widget-warning"><input type="hidden" name="up" readonly value="${up}">${up}</b>
          </p>
          <p class="item">
            <label class="title">开户用户名：</label>
            <b class="text widget-warning"><input type="hidden" name="bduser" readonly value="${bduser}">${bduser}</b>
          </p>
          <p class="item">
          	<label class="title">选择套餐：</label>
			<font color="#008000"><b>${cjpay}</b></font><input type="hidden" name="pa1j" size="8" value="${pa1j}"><input type="hidden" name="pa2j" size="8" value="${pa2j}">
		  </p>
         <p class="widget-notice mt15 ml10">（将从您的（<b>${userName}</b>）<c:if test="${cjpay<9000}">一币</c:if><c:if test="${cjpay>=9000}">报单币</c:if>账户扣除${cjpay}）</p> 
         <c:if test="${cjpay<9000}">
          <p class="item">
            <label class="title">您的手机号码：</label><span class="text">${call}</span>
          </p>
          <p class="item">
            <label class="title">手机验证码：</label>
            <input type="text" name="ceid" />
            <input class="widget-button-small" id="btn" type="button" onclick="checkdate()" value="获取验证码" name="B2" />
          </p>
          </c:if>
          <p class="button-line mt15">
            <input class="widget-button" type="submit" value="确认无误" name="B1" onclick="{if(confirm('确定开通该会员吗?')){this.style.visibility='hidden';return true;}return false;}">
          </p>
        </form>
        <p class="widget-notice mt15"><b class="widget-warning">重要提示：</b>确认无误后，系统进入核算中...期间请停止其它操作，更不要关闭本页！</p>
      </div>
      <!-- 确认开户信息 end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=2", data, function(response) {
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
  if (Form.ceid.value == "") {
    alert("请先点击获取验证码，然后再填入您的手机收到的验证码");
    Form.ceid.focus();
    return false;
  }
  return true;
}
</script>
<script type="text/javascript">
btnStatus($("#btn"), '#SESSION_LOCALE');

function showZz() {
  $('.zzbg').fadeIn(200);
  $('.zzcontent').fadeIn(400);
  return true;
}
</script>
</body>

</html>
