<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('大vip才能使用这个功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('被充值用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('被充值用户必须是小vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('充值用户必须是您团队下的！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('充值币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('备用报单币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('被充值用户的一币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('年终结算，暂停使用!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('此大vip用户所对应的法人不存在，请联系管理员添加！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='Member_center'/>|<s:text name='Account_currency_recharge'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body> <!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 <!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='vipadmin_menu.jsp.admin_menu.jsp.951062035'/></p>
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
      <!-- <s:text name='Account_currency_recharge'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='50000_coins_recharge'/></p>
        <form class="widget-form" method="POST" name="Form" action="bdbcz?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <p class="item">
            <label class="title"><s:text name='Current_recharge:'/></label><span class="text">${czgcuser.vipcjcjb}</span></p>
          <p class="item">
            <label class="title"><s:text name='The_current_reserve_currency:'/></label><span class="text">${czgcuser.syep}</span></p>
         <!--  <p class="widget-notice widget-warning mt15">本次操作需要消耗：</p>
          <p class="item mt15">
            <label class="title">当前用户充值币：</label><span class="text">5000</span></p>
          <p class="item">
            <label class="title">当前用户备用报单币：</label><span class="text">22200</span></p>
          <p class="item">
            <label class="title">被充值用户一币：</label><span class="text">22800</span></p> -->
           	<p class="widget-notice widget-warning mt15"> <s:text name='This_operation_requires_the_users_to_recharge_5000_coins,_22200_coins_and_spare_form_prepaid_users_22800_coins.'/></p>
          <p class="widget-notice widget-warning mt15"> <s:text name='Note:_only_a_small_VIP_recharge_to_the_team.'/></p>
          <p class="item mt15">
            <label class="title"><s:text name='recharge_user_name'/>：</label>
            <input type="text" name="touser" />
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
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
	            <label class="title"><s:text name='reg2.jsp.reg2.jsp.775723385'/>：</label>
	            <span class="text">${gcuser.call}</span>
	          </p>
	          <input type="hidden" name="toUserName" value="${gcuser.username}">
          </c:if>
         <p class="item">
			<label class="title"><s:text name='enter.phone.number'/>：</label>
			<input type="text" id="inputCall" name="inputCall" size="20" tabindex="18" ></input>
		</p>
           <p class="item">
            <label class="title"><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label>
            <input type="text" name="smsCode" size="20" onKeyUp="value=value.replace(/[\W]/g,'')">
            <input class="widget-button-small" name="B2" id="btn" type="button" onclick="sendmsg()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>"/>
          </p> --%>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" onclick='return confirm("<s:text name='vipepjysc.jsp.epjysc.jsp.1991539691'/>")'><s:text name='Definite_transfer'/></button>
          </p>
        </form>
      </div>
      <!-- <s:text name='Account_currency_recharge'/> end -->
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
	      alert('<s:text name='Enter_phone_number_error'/>！');
	      $("#btn").attr("disabled", false);
	      Form.inputCall.focus();
	      return false;

	    }
	    $("#btn").removeAttr("disabled");
	    if (response.erroCodeNum != 0) {
	      alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886666017'/>");
	      return false;
	    }
	    settime($("#btn"), '#SESSION_LOCALE');
	    alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.1886721436'/>");
	  });
	  return true;
}
</script>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
