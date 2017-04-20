<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('大vip才能使用这个功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('被充值用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('被充值用户必须是小vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('充值用户必须是您团队下的！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('充值币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('备用报单币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('被充值用户的一币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('年终结算，暂停使用!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('此大vip用户所对应的法人不存在，请联系管理员添加！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|报单币充值</title>
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
    <p class="breadcrumb-trail">财富中心 >> 积分理财</p>
    <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 业绩查询内容 -->
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
      <!-- 报单币充值 -->
      <div class="main-widget">
        <p class="widget-title-line">充值50000报单币</p>
        <form class="widget-form" method="POST" name="Form" action="bdbcz?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <p class="item">
            <label class="title">当前充值币：</label><span class="text">${czgcuser.vipcjcjb}</span></p>
          <p class="item">
            <label class="title">当前备用报单币：</label><span class="text">${czgcuser.syep}</span></p>
         <!--  <p class="widget-notice widget-warning mt15">本次操作需要消耗：</p>
          <p class="item mt15">
            <label class="title">当前用户充值币：</label><span class="text">5000</span></p>
          <p class="item">
            <label class="title">当前用户备用报单币：</label><span class="text">22200</span></p>
          <p class="item">
            <label class="title">被充值用户一币：</label><span class="text">22800</span></p> -->
           	<p class="widget-notice widget-warning mt15"> 本次操作需要消耗当前用户5000充值币，22200备用报单币及被充值用户22800一币。</p>
          <p class="widget-notice widget-warning mt15"> 注：只能给团队下的小vip充值。</p>
          <p class="item mt15">
            <label class="title">被充值用户名：</label>
            <input type="text" name="touser" />
          </p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="pa3" />
          </p>
          <%-- 
           <c:if test="${gcuser.vip==2}">
	          <p class="item">
	            <label class="title">法人手机号码：</label>
	            <span class="text">${farenUser.call}(${farenUser.name})</span>
	          </p>
	          <input type="hidden" name="toUserName" value="${farenUser.username}">
          </c:if>
          <c:if test="${gcuser.vip!=2}">
	          <p class="item">
	            <label class="title">手机号码：</label>
	            <span class="text">${gcuser.call}</span>
	          </p>
	          <input type="hidden" name="toUserName" value="${gcuser.username}">
          </c:if>
         <p class="item">
			<label class="title"><s:text name='enter.phone.number'/>：</label>
			<input type="text" id="inputCall" name="inputCall" size="20" tabindex="18" ></input>
		</p>
           <p class="item">
            <label class="title">手机验证码：</label>
            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
            <input class="widget-button-small" name="B2" id="btn" type="button" onclick="sendmsg()" value="获取验证码"/>
          </p> --%>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" onclick="return confirm('提示：您确定了吗？')">确定转账</button>
          </p>
        </form>
      </div>
      <!-- 报单币充值 end -->
    </div>
  </div>
</div>
</div>
<script type="text/javascript">

function sendmsg(){
	  if (Form.pa3.value == "") {
	    alert("请输入您的二级密码!");
	    Form.pa3.focus();
	    return false;
	  }
	  if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
	  $("#btn").attr("disabled", "disabled");
	  var data = $("#Form").serialize();
	  $.post("/smsother?op=23&other=1&toUserName="+Form.toUserName.value+"&inputCall="+Form.inputCall.value, data, function(response) {
	    if (response.erroCodeNum == 2) {
	      alert('输入的手机号与预留手机号不一致！');
	      $("#btn").attr("disabled", false);
	      Form.inputCall.focus();
	      return false;

	    }
	    $("#btn").removeAttr("disabled");
	    if (response.erroCodeNum != 0) {
	      alert("手机验证码发送失败");
	      return false;
	    }
	    settime($("#btn"), '#SESSION_LOCALE');
	    alert("手机验证码发送成功");
	  });
	  return true;
}
</script>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
