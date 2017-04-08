<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1713705348'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.834213896'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1543089961'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-817035023'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2053058834='/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.165401067'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.939890499'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1027680370'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2057159235'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='VIP_users_can_not_withdraw_cash'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='nosuremanytimesforclose'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('未激活账户不能提现！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==-1}"><script language=javascript>alert('您的发布已经成功提交，发布成功后如有认购一币方向您下单后2小时内打到您的收款账号上！请您及时查收！');location.replace('epmcjl?secondThisState=249&thisState=244');</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币卖出</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body> <!-- 通用头部 -->
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
   <div class="member-main-full">
      <!-- 一币卖出说明 -->
      <div class="main-widget">
        <p class="widget-title-line">一币卖出说明</p>
        <div class="widget-article">
          <p class="widget-tips">最低100一币起就可以发布卖出，每次发布需等上一次处理（您确认收到款）了才可以发起第二次，发布成功后我们认购一币-方向下单后2小时内打到您的收款账号上！</p>
          <p class="widget-tips widget-warning mt15">一币卖出低于500（含500），交易手续费为15%，高于500为10%</p>
        </div>
      </div>
      <!-- 一币卖出说明 end -->
      <!-- 当前卖出一币的账户信息 -->
      <div class="main-widget mt15">
        <p class="widget-title-line">确认当前账户信息</p>
        <from class="widget-form">
          <p class="item mt15">
            <label class="title">真实姓名：</label><span class="text">${gcuser.name}</span>
          </p>
          <p class="item">
            <label class="title">手机号码：</label><span class="text">${gcuser.simpleCall}</span>
          </p>
          <p class="item">
            <label class="title">收款方式：</label><span class="text">${gcuser.bank}</span>
          </p>
          <p class="item">
            <label class="title">账号：</label><span class="text">${gcuser.card}</span>
          </p>
          <p class="item">
            <label class="title">开户行：</label><span class="text">${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}支行</span>
          </p>
        </from>
      </div>
      <!-- 当前卖出一币的账户信息 end -->
      <!-- 一币卖出表单 -->
      <div class="main-widget mt15">
        <form class="widget-form mt15" method="POST" name="Form" id="Form" onSubmit="return checkdate1()" action="userpay?status=1">
          <p class="item">
            <label class="title">用户名：</label><span class="text">${userName}</span></p>
          <p class="item">
            <label class="title">卖出一币数量：</label>
            <select class="widget-select" name="txpay">
              <option selected value="0">=选择一币卖出数量=</option>
              <option value="100">100</option>
              <option value="200">200</option>
              <option value="500">500</option>
              <option value="1000">1000</option>
              <option value="2000">2000</option>
              <option value="5000">5000</option>
              <option value="10000">10000</option>
              <option value="20000">20000</option>
              <option value="30000">30000</option>
            </select>
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input name="pa3" type="password" />
          </p>
          <p class="button-line mt15 tc">
            <button class="widget-button" type="submit" id="btn" onClick="return confirm('提示：发布卖出的一币如低于500（含500）交易手续费为15%，高于500的则为10%，您确定了吗？')">发布卖出</button>
          </p>
        </form>
        <p class="widget-tips widget-warning mt15">警告：请认真核对以下收款信息，如有错误请马上点<a href="login2j?inputUrl=login2j.jsp"><b>修改个人资料</b></a>，再进行发布卖出！如不认真核对，造成付款不成功，该笔卖出将冻结，申请解冻将加收20%手续费！</p>
      </div>
      <!-- 一币卖出表单 end -->
    </div>
  </div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
function checkdate() {
  if (Form.txpay.value == 0) {
    alert("请选择卖出一币的数量!");
    return false;
  }
  if (!chkinteger(Form.txpay.value)) {
    alert('卖出一币只能为整字!');
    document.Form.txpay.focus;
    return false;
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


  if (Form.txpay.value > ${gcuser.pay}) {
	  <c:if test="${transferType==1}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977'/>"); </c:if> <c:if test="${transferType==2}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977a'/>"); </c:if>     return false;   
  }
  if (Form.txpay.value < 100) {
    alert("您的发布不能小于100一币!");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("请输入二级密码密码!");
    return false;
  }

  $("#btn").attr("disabled", "disabled");
  var data = $("#Form").serialize();
  $.post("/sms?op=3", data, function(response) {
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
  if (Form.ybcodeid.value == "") {
    alert("请先点击获取验证码，然后再填入您的手机收到的验证码");
    Form.ybcodeid.focus();
    return false;
  }
  return true;
}
</script>
</body>

</html>
