<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('该用户不存在[${user}]！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('恭喜充值成功。。。！');location.href="searchUser?user=${user}";</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<p align="center">　</p>
<p align="center"><font face="黑体" size="6" color="#FF0000">请再次确认-</font><font face="黑体" size="6" color="#0000FF">购物充值到奖金</font></p>
<div align="center">
	<p align="center">　</p>
	<table border="0" width="35%" id="table1" cellspacing="1" height="196">
		<tr>
			<td align="right" width="184"><font face="黑体" size="5">收到会员：</font></td>
			<td align="left"><font face="黑体" size="5"><font color="#800000">${user}</font></font></td>
		</tr>
		<tr>
			<td align="right" width="184"><font face="黑体" size="5">充值款：</font></td>
			<td align="left"><font color="#0000FF" face="黑体" size="5">${cjpay}</font><font color="#800000" face="黑体">--购物充值</font></td>
		</tr>
		<tr>
			<td align="right" width="184" height="47"><font face="黑体" size="5">充值方式：</font></td>
			<td align="left" height="47">${cjfs}</td>
		</tr>
		<tr>
			<td align="right" width="184" height="45"><font face="黑体" size="5">操作员：</font></td>
			<td align="left" height="45"><font color="#008000" face="黑体" size="5">${userName}</font></td>
		</tr>
	</table>
</div>
<p align="center">　</p>
<p align="center"><a onClick="return confirm('提示：您确定收到 ${cjpay} 元了吗？')" href="chargeGw?cjpay=${cjpay}&user=${user}&cjfs=${cjfs}&status=2"><input type="button" value="确认无误" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">返回上一页</font></a></p>
<p align="center">　</p>