<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='One_yuan_to_sell_confirmed_receivables'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='View_seller_account'/></p>
      <div class="dialog-wrap-border main-widget">
      <form class="widget-form" method="POST" action="mcepok?status=1&payId=${payId}" id="Form" name="Form" onSubmit="return checkdate1()">
          <!-- <p class="widget-notice widget-warning mt15 ml10"><s:text name='vipmcepok.jsp.mcepok.jsp.-1370693726'/>！</p> -->
          <p class="item mt15">
            <label class="title"><s:text name='vipfbbank.jsp.fbbank.jsp.1957118971'/>：</label><span class="text">${txpay.payusername}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='vipfbbank.jsp.fbbank.jsp.-215966947'/>：</label><span class="text">${txpay.payname}</span>
          </p>
          <p class="item">
            <label class="title"><s:text name='vipfbbank.jsp.fbbank.jsp.773244084'/>：</label><span class="text">${txpay.paybank}</span></p>
          <p class="item">
            <label class="title"><s:text name='vipfbbank.jsp.fbbank.jsp.1170722855'/>：</label><span class="text">${txpay.paycard}</span></p>
          <p class="item">
            <label class="title"><s:text name='Bank_Location'/>：</label><span class="text">${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}</span></p>
          <p class="item">

          </p>
          <p class="button-line mt15">
            <a class="widget-button" href="javascript:window.close();" style="text-decoration: none" name="B1"><s:text name='vipfbbank.jsp.fbbank.jsp.-1048715458'/></a>
          </p>
          </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
