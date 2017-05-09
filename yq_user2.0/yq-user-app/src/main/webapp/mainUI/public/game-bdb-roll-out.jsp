<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('vip<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1100795047'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.2022589602'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.386612509'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1556510827'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.594399145'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.1926370358'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.306392805'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.231633818'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1495661441'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.571194964'/>vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-2079296314'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('此大vip用户所对应的法人不存在，请联系管理员添加！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='Member_center'/>|<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1788295765'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='viewjflc.jsp.jflc.jsp.951062035'/></p>
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
      <!-- <s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1788295765'/> -->
      <div class="main-widget">
        <p class="widget-title-line"><s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1788295765'/></p>
        <form class="widget-form" method="POST" name="Form" onSubmit="return checkdate()" action="bdbzz?status=1&secondThisState=${secondThisState}&thisState=${thisState}">
          <p class="item mt15">
            <label class="title widget-warning"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792'/>：</label>
            <input type="text" name="jcname" value="${userName}" readonly="" />
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.1129373465'/>：</label>
            <select class="widget-select" name="jzpay">
              <option selected="" value="10000">---- 1<s:text name='wan'/> ----</option>
              <option value="20000">---- 2<s:text name='wan'/> ----</option>
              <option value="30000">---- 3<s:text name='wan'/> ----</option>
              <option value="50000">---- 5<s:text name='wan'/> ----</option>
            </select>
            <span class="text"> <s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/>：<b class="widget-warning">${sybdb}</b></span>
          </p>
          <p class="item">
            <label class="title"><s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1542679092'/>：</label>
            <input type="text" name="syuser" />
          </p>
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.630954966'/>：</label>
            <input type="password" name="pa3" />
          </p>
         
          <%--  <c:if test="${gcuser.vip==2}">
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
      <!-- <s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1788295765'/> end -->
    </div>
  </div>
</div>
</div>
<!-- 业绩查询内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.jcname.value == "") {
    alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-453586483'/>!");
    return false;
  }
  if (Form.jzpay.value < 5000) {
    alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.97164307'/>5000!");
    return false;
  }
  if (Form.syuser.value == "") {
    alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1479911832'/>!");
    return false;
  }
  if (Form.jcname.value == Form.syuser.value) {
    alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");
    return false;
  }
  if (Form.pa3.value == "") {
    alert("<s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-1396482625'/>!");
    return false;
  }
  if (!chkinteger(Form.jzpay.value)) {
    alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.375811844'/>!');
    document.Form.jzpay.focus;
    return (false);
  }
  /* if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
  if (Form.smsCode.value=="") {   alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");  Form.smsCode.focus();   return false;    } */
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


function sendmsg(){
	
	 if (Form.jcname.value == "") {
		    alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-453586483'/>!");
	    return false;
	  }
	  if (Form.jzpay.value < 5000) {
	    alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.97164307'/>5000!");
	    return false;
	  }
	  if (Form.syuser.value == "") {
	    alert("<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.-1479911832'/>!");
	    return false;
	  }
	  if (Form.jcname.value == Form.syuser.value) {
	    alert("<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1929667708'/>!");
	    return false;
	  }
	  if (Form.pa3.value == "") {
	    alert("<s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-1396482625'/>!");
	    return false;
	  }
	  if (!chkinteger(Form.jzpay.value)) {
	    alert('<s:text name='viewyjcx-bdb-zz.jsp.yjcx-bdb-zz.jsp.375811844'/>!');
	    document.Form.jzpay.focus;
	    return (false);
	  }
	  if (!chkinteger(Form.jzpay.value)) {
		    alert('<s:text name='viewyblc-transferout-present.jsp.yblc-transferout-present.jsp.-1582955249'/>!');
		    document.Form.jzpay.focus;
		    return (false);
		  }
	  if (Form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  Form.inputCall.focus();  return false;  }
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
</body>

</html>
