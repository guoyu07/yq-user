<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币认购明细</title>
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
   <%@ include file="/mainUI/common/userLeft.jsp" %>
  <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
 	<%@ include file="/mainUI/common/yblc.jsp" %>
  <!-- 账户概览 end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main">
      <!-- 一币卖出明细表格 -->
      <div class="main-widget">
        <p class="widget-title-line">一币认购明细</p>
        <p class="small-button-line"><a href="javascript:void(0)" class="widget-button-small JQ_moreDialog" data-url="epmyjlmrdetail?status=1" id="J_ebSaleDetailMore">查看更多</a></p>
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>流水号</th>
                <th>认购方（自己）</th>
                <th>认购金额</th>
                <th>认购时间</th>
                <th>交易状态</th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
				<td>***${data.simplePayid}</td>
				<td>${data.dfuser}</td>
				<td>${data.paynum}</td>
				<td><fmt:formatDate value="${data.rgdate}" type="both"/></td>
				<td> 
				<c:if test="${not empty zftime}">
                                                               交易成功-卖出方${data.payusername}已确认。
          </c:if>
          <c:if test="${empty zftime}">
                <c:if test="${data.ep==1}"><font color="#FF00FF">您已下单，等待您在</font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF">前付款，<b><a target="_blank" href="fbbank?fb=${data.payid}"><font color="#008000">点击查看卖出方收款账号！</font></a></b></font></c:if>                                                
                <c:if test="${data.ep==2}">${data.dfuser}--已付款，等待卖出方${data.payusername}的确认中。。。</c:if>
          </c:if>
	          	</td>
				</tr>
			</s:iterator>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!-- 一币卖出明细表格 end -->
  </div>
</div>
</div>
<!-- 一币理财内容 end -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
/*验证交互*/
function checkdate() {
  if (Form.ebSaleNum.value == 0) {
    alert("请选择卖出一币的数量!");
    return false;
  }
  if (!chkinteger(Form.ebSaleNum.value)) {
    alert('卖出一币只能为整字!');
    document.Form.ebSaleNum.focus;
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

  if (Form.ebSaleNum.value > 109990) {
    alert("您的发布不能大于您可卖的109890一币哦!");
    return false;
  }
  if (Form.ebSaleNum.value < 100) {
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
