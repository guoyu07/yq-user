<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.2073267590'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1239579686'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.2060105128'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1830047641'/>！');history.go(-1);</script></c:if>


<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.640340070'/>！');location.href='vipcjb?secondThisState=253&thisState=244';</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('此大vip用户所对应的法人不存在，请联系管理员添加！');history.go(-1);</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.624662580'/>|<s:text name='VIP_recharge_management'/></title>
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
    <p class="breadcrumb-trail"><s:text name='Wealth-center'/> >> <s:text name='VIP_recharge_currency_management'/></p>
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
      <!-- VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139'/> -->
      <div class="main-widget">
        <p class="widget-title-line">VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139'/></p>
        <form class="widget-form" method="POST" action="vipcj?secondThisState=${secondThisState}&thisState=${thisState}" name="form" onsubmit="return checkdate()">
          <p class="item">
            <label class="title"><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>
            <input type="text" name="cjuser">
          </p>
          <p class="item">
            <label class="title"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/>：</label>
            <select class="widget-select" name="cjpay">
              <option selected="" value="0">==<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.35601975'/>==</option>
              <option value="1000">1000</option>
              <option value="2000">2000</option>
              <option value="5000">5000</option>
            </select>
          </p>
          <p class="item">
            <label class="title widget-warning"><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.640299730'/>：</label>
            <input type="password" name="cjpass">
          </p>
          
          <%--  <c:if test="${gcuser.vip==2}">
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
          </p>--%>
          <p class="button-line mt15">
            <input class="widget-button" type="submit" value="<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1817777369'/>" name="B1" id="B1"><span class="widget-tips ml10">（<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1817777369a'/>：<b class="widget-warning">${gcuser.vipcjcjb}</b>）</span>
          </p>
        </form>
      </div>
      <!-- VIP<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.-1480031139'/> end -->
      <!-- VIP充值管理明细 -->
      <div class="main-widget mt15">
        <p class="widget-title-line"><s:text name='VIP_recharge_management_details'/></p>
        <p class="small-button-line"><a href="javascript:void(0)" class="widget-button-small JQ_moreDialog" data-url="vipcjbcjbdetail?status=1" id="J_ebSaleDetailMore"><s:text name='View_more'/></a></p>
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1030049'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1619451673'/></th>
                <th><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.789127981'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1365514950'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.cjid}</td>
					<td>${data.cjuser}</td>
					<td>${data.cjjo}</td>
					<td>${data.bz}</td>
					<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
					<td>${data.sycjb}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
      </div>
      <!-- VIP充值管理明细 end -->
    </div>
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (form.cjuser.value == "") {
    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1508540713'/>!");
    form.cjuser.focus();
    return false;
  }
  if (form.cjpay.value == 0) {
    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1837640058'/>!");
    form.cjpay.focus();
    return false;
  }
  if (form.cjpay.value > ${gcuser.vipcjcjb}) {
    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1671689850'/>!");
    form.cjpay.focus();
    return false;
  }
  if (form.cjpass.value == "") {
    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-127108265'/>!");
    form.cjpass.focus();
    return false;
  }
  if (form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  form.inputCall.focus();  return false;  }
  if (form.smsCode.value=="") {   alert("<s:text name='resetUserPass.jsp.resetUserPass.jsp.-352812950'/>");  form.smsCode.focus();   return false;    }
  if (confirm("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.138357933'/>？")) {
    $("#B1").hide();
    return true;
  }
  return false;
}


function sendmsg(){
	
	if (form.cjuser.value == "") {
	    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1508540713'/>!");
	    form.cjuser.focus();
	    return false;
	  }
	  if (form.cjpay.value == 0) {
	    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1837640058'/>!");
	    form.cjpay.focus();
	    return false;
	  }
	  if (form.cjpay.value > ${gcuser.vipcjcjb}) {
	    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1671689850'/>!");
	    form.cjpay.focus();
	    return false;
	  }
	  if (form.cjpass.value == "") {
	    alert("<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-127108265'/>!");
	    form.cjpass.focus();
	    return false;
	  }
	  if (form.inputCall.value=="") {  alert("<s:text name='reg.jsp.reg.jsp.1688991270'/>！");  form.inputCall.focus();  return false;  }
	  $("#btn").attr("disabled", "disabled");
	  var data = $("#Form").serialize();
	  $.post("/smsother?op=23&other=1&toUserName="+form.toUserName.value+"&inputCall="+form.inputCall.value, data, function(response) {
	    if (response.erroCodeNum == 2) {
	      alert('<s:text name='Enter_phone_number_error'/>！');
	      $("#btn").attr("disabled", false);
	      form.inputCall.focus();
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
