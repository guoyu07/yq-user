<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<p align="center"><font color="#FF0000">${uid}</font>修改成功</p>
			<p align="center">原EP总额为：<font color="#800000">${gcuser.pay+sfpay}</font>&nbsp; </p>
			<p align="center">消费后为：<b><font color="#FF0000">${gcuser.pay}</font></b></p>
			</td>
		</tr>
	</table>
<p align="center"><b><a href="epsf?uid=${uid}" style="text-decoration: none">返回</a></b></div>