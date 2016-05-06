<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<div align="center">
	　<p>　</p>
	<table border="1" width="40%" id="table1" height="249" style="border-collapse: collapse">
		<tr>
	<td><b><font size="6" face="隶书" color="#FF0000">请您再次确认</font></b><p><b><font size="4">您要买入积分数量<font color="#FF0000">${txpay}</font>当前单价是<font color="#FF0000">${jygj}</font></font></b></p>
	<p><b><font size="4">即将从您的金币账户扣除<font color="#800080">${needJf}</font>金币</font></b></p>
	<p>　</p>
	<p align="center"><a onClick="return confirm('提示：您确定了吗？')" href="/mysl?status=2&txpay=${txpay}"><input type="button" value="确定无误" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
	</tr>
	</table>
<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
<p align="center">　</div>