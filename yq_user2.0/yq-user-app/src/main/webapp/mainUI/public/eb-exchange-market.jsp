<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('请您联系您地区的VIP服务中心，谢谢！');location.replace('/vipup');</script></c:if>

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币交易市场</title>
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
 <%--   <!-- 会员中心左边栏 -->
<div class="member-aside">
  <!-- VIP中心左边栏 -->
  <%@ include file="/mainUI/common/vipleft.jsp" %>
  <!-- VIP中心左边栏  end -->
</div>
<!-- 会员中心左边栏 end -->

    <div class="member-main"> --%>
      <div class="member-main-full">
      <!-- 一币卖出明细表格 -->
      <div class="main-widget">
        <p class="widget-title-line">一币交易市场</p>
        <p class="small-button-line"><!-- <a href="javascript:void(0)" class="widget-button-small JQ_moreDialog" data-url="epjyscybmarketdetail?status=1" id="J_ebSaleDetailMore">查看更多</a></p> -->
        <div class="widget-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>流水号</th>
                <th>卖出方</th>
                <th>信用星</th>
                <th>求现金额</th>
                <th>认购后可获一币</th>
                <th>认购后可获利</th>
                <th>卖出时间</th>
                <th>交易状态</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              	<s:iterator var="data" value="dataList">
				<tr>
					<td>${data.payid}</td>
					<td>${data.payusername}</td>
					<td>${data.cxt}</td>
					<td>${data.paynum9}</td>
					<td> ${data.paynum}</td>
					<td>${data.paynum-data.paynum9}</td>
					<td>${data.paytime}</td>
					<td> <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('提示：您确定了吗？')" href="qxepmc?qx=${data.payid}&secondThisState=${secondThisState}&thisState=${thisState}"><font color="#FF0000">撤销卖出</font></a></b></c:if><c:if test="${data.payusername!=userName}">等待认购中。。。</c:if></td>
					<td><a onClick="return confirm('提示：对方使用的收款方式是“${data.paybank}”您确定认购了吗？')" href="epmy?ep=${data.payid}&secondThisState=${secondThisState}&thisState=${thisState}"><font color="#FF0000" size="2">我要认购</font></a></td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <p class="widget-pages">
  <aldtags:pageTag paraStr="status,${status},thisState,${thisState},secondThisState,${secondThisState}"/>
</p>
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
