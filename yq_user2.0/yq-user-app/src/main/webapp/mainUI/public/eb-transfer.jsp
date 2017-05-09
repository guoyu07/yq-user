<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-125850672'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-271901504'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.386612509'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1681297541'/>60w！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1681297541'/>5w！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.306392805'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.231633818'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1495661441'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.571194964'/>vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-2079296314'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.246684949'/>！');location.replace('datepay?secondThisState=249&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('此大vip用户所对应的法人不存在，请联系管理员添加！');history.go(-1);</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.624662580'/>|<s:text name='Currency_transfer'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewyblc.jsp.yblc.jsp.618950045'/></p>
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
        <p class="widget-title-line"><s:text name='Currency_transfer'/></p>
        <form class="widget-form" method="POST" name="Form" onsubmit="return checkdate()" action="vipjzpay?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><span class="text"><b class="widget-warning">${userName}</b></span></p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1994385923'/>：</label><span class="text"><b class="widget-warning">${gcuser.pay}</b></span></p>
          <p class="item">
            <label class="title widget-warning"><s:text name='vipbdbjzpay.jsp.bdbjzpay.jsp.-1410198515'/>：</label>
            <input type="text" name="jzuser" id="jzuser" size="15"><a herf="#" class="widget-button-small" id="J_chkUserName"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792a'/></a></p>
          <p class="item">
            <label class="title"><s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.1129174203'/>：</label>
            <input type="text" name="jzpay" size="15" maxlength="10">
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa3" size="20">
          </p>
          <%-- <c:if test="${vipgcuser==null || vipgcuser==''}">
          <c:if test="${gcuser.vip==2}">
	          <p class="item">
	            <label class="title"><s:text name='Corporate_phone_number'/>：</label>
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
          </p>
          </c:if> --%>
          <p class="button-line mt15">
            <button class="widget-button" type="submit" name="submit2" onclick="return confirm('<s:text name="vipgpjymc.jsp.gpjymc.jsp.1526835300"/>')"><s:text name='Definite_transfer'/></button>
          </p>
        </form>
        <%-- <c:if test="${gcuser.vip==2}"><p class="widget-tips mt10"><a href="vipcjb"><s:text name='VIP_recharge_management'/>（<s:text name='Cumulative_recharge'/>：${gcuser.vipljcjb}）（<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139a'/>：${gcuser.vipsycjb}）（<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1817777369a'/>：${gcuser.vipcjcjb}）</a></p></c:if> --%>
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
 if (Form.jzuser.value == "") {
	    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1569959089'/>!");
	    Form.jzuser.focus;
	    return false;
	  }
	  if (Form.jzuser.value == "${gcuser.username}") {
	    alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");
	    Form.jzuser.focus;
	    return false;
	  }
  if (Form.jzpay.value == "") {
    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");
    Form.jzpay.focus;
    return false;
  }
  if (Form.jzpay.value < 99) {
    alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1705620723'/>100!");
    Form.jzpay.focus;
    return false;
  }
  if (Form.jzpay.value > ${gcuser.pay}) {
    alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2136440982'/>${gcuser.pay}");
    Form.jzpay.focus;
    return false;
  }
 
  if (Form.pa3.value == "") {
    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
    Form.pa3.focus;
    return false;
  }
  if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
  if (Form.smsCode.value=="") {   alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    }
  if (!chkinteger(Form.jzpay.value)) {
    alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1582955249'/>!');
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
    alert("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
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

function sendmsg(){
	
	 if (Form.jzuser.value == "") {
		    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1569959089'/>!");
		    Form.jzuser.focus;
		    return false;
		  }
		  if (Form.jzuser.value == "${gcuser.username}") {
		    alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");
		    Form.jzuser.focus;
		    return false;
		  }
	if (Form.jzpay.value == "") {
	    alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");
	    Form.jzpay.focus;
	    return false;
	  }
	  if (Form.jzpay.value < 99) {
	    alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1705620723'/>100!");
	    Form.jzpay.focus;
	    return false;
	  }
	  if (Form.jzpay.value > ${gcuser.pay}) {
	    alert("<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.2136440982'/>${gcuser.pay}");
	    Form.jzpay.focus;
	    return false;
	  }
	 
	  if (Form.pa3.value == "") {
	    alert("<s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.-1989247238'/>!");
	    Form.pa3.focus;
	    return false;
	  }
	  if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
	  if (!chkinteger(Form.jzpay.value)) {
	    alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1582955249'/>!');
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
	  $("#btn").attr("disabled", "disabled");
	  var data = $("#Form").serialize();
	  $.post("/smsother?op=19&other=1&toUserName="+Form.toUserName.value+"&inputCall="+Form.inputCall.value, data, function(response) {
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
</body>

</html>
