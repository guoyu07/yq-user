<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币卖出确认收款</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title">查看卖出方收款账号</p>
      <div class="dialog-wrap-border main-widget">
      <form class="widget-form" method="POST" action="mcepok?status=1&payId=${payId}" id="Form" name="Form" onSubmit="return checkdate1()">
          <!-- <p class="widget-notice widget-warning mt15 ml10">您正在操作确认收款，请确认是否收到相关款项！</p> -->
          <p class="item mt15">
            <label class="title">本次交易发布方用户名：</label><span class="text">${txpay.payusername}</span>
          </p>
          <p class="item">
            <label class="title">银行账号户名：</label><span class="text">${txpay.payname}</span>
          </p>
          <p class="item">
            <label class="title">所属银行：</label><span class="text">${txpay.paybank}</span></p>
          <p class="item">
            <label class="title">银行账号：</label><span class="text">${txpay.paycard}</span></p>
          <p class="item">
            <label class="title">银行所在地：</label><span class="text">${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}</span></p>
          <p class="item">
           	您必须于<b><font color="#0000FF">${txpay.rgdate}</font></b>前付款不低于<b><font color="#FF0000">${txpay.paynum9}</font></b>元，请及时付款后通知发布方
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
