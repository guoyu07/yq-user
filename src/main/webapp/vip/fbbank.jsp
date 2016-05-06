<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<title>一币交易-发布方账号</title>
<blockquote>
	<p>　</p>
	<p><span style="font-size: 11pt">本次交易发布方用户名：</span><b><font color="#FF0000"><span style="font-size: 11pt">${txpay.payusername}</span></font></b></p>
	<p><span style="font-size: 11pt">银行账号户名：</span><b><font color="#0000FF"><span style="font-size: 11pt">${txpay.payname}</span></font></b></p>
	<p><span style="font-size: 11pt">所属银行：</span><font color="#0000FF"><span style="font-size: 11pt">${txpay.paybank}</span></font></p>
	<p><span style="font-size: 11pt">银行账号：</span><font color="#0000FF"><span style="font-size: 11pt">${txpay.paycard}</span></font></p>
	<p><span style="font-size: 11pt">银行所在地：${gcuser.addsheng}${gcuser.addshi}${gcuser.addqu}支行</span></p>
	<p><span style="font-size: 11pt">您必须于<b><font color="#0000FF">${txpay.rgdate}</font></b>前付款不低于<b><font color="#FF0000">${txpay.paynum9}</font></b>元，请及时付款后通知发布方！</span></p>
	<p align="center"><b><a href="javascript:window.close();" style="text-decoration: none">关闭本窗口</a></b></p>
</blockquote>