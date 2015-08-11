<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('金币卡不存在或卡已被使用！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('你上次已经查看过该卡密码，如果密码已过给发给客户，请不要随便重置密码！');history.go(-1);</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	　<p>　</p>
	<table border="0" width="75%" id="table1" height="120" cellspacing="1">
		<tr>
		<td>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>你好！重置成功
			</b>
		</p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">消费编号是：<b><font color="#0000FF">${pdid}</font></b>&nbsp; 登录密码为：<b><font color="#FF0000">${pdpa}</font></b>&nbsp; 防伪编号为：<b><font color="#008000">${fwid}&nbsp; </font></b>金币面值：<b>${ejbk.bf2}0</b></p>
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">请牢记，并及时交给客户以便尽快激活购买积分增值！<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<a onClick="return confirm('提示：按此激活将是自己使用，不能再用于赠送，您确定了吗？')" href="activedGoldCard?pdid=${id}&pdpa=${pdpa}&fwid=${fwid}"><input type="button" value="快速激活--点这里！" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a><p>　</p>
		</tr>
	</table>
	<p align="center">　</p>
	<p>　</p>
	<p><a href="gmjh" style="text-decoration: none; font-weight: 700">
	<font size="4" color="#FF0000">点击返回</font></a></p>
	<p>　</div>