<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，本次交易积分数量大于您剩余积分数量 ${myjyg} ，暂时不能交易，本次交易需要 ${gpjy.mysl} 积分，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('卖出${gpjy.mysl}积分成功！');location.replace('/gpjysc');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<script>
</script>
<p align="center">　</p>
<p align="center">　</p>
<p align="center"><font size="6">本次卖出交易积分数量为：<font color="#FF0000">${gpjy.mysl}</font></font></p>
<p align="center"><font size="5">将在您的账户里扣除：<b><font color="#FF0000">${gpjy.mysl}</font></b></font><font size="6">积分</font></p>
<div align="center">
	<table border="0" width="52%" id="table1" cellspacing="1" bgcolor="#E6E6E6" height="210">
	<tr>
	<td><b><font size="4"><font color="#FF0000"></font>单价是：<font color="#FF0000">
	<c:if test="${gpjy.pay<1}">0${gpjy.pay}</c:if><c:if test="${gpjy.pay>=1}">${gpjy.pay}</c:if>&nbsp; </font>总额为：<font color="#FF0000">${gpjy.jypay}</font></font><font size="4" color="#800000"> </font></b>
	<p><b><font size="4" color="#800000">卖出成功后：</font></b></p>
	<p><b><font size="4">扣除10%的手续费您共得到：<font color="#800080">${dqpay}</font> 一币</font></b></p>
	<p><b><font size="4">其中70%分配到一币账户：<font color="#800080">${mc70}</font> 一币</font></b></p>
	<p><b><font size="4">其中30%分配到金币账户：<font color="#800080">${mc30}</font></font></b></p>
	</td>
	</tr>
	</table>
	</div>
	<FORM action="/wymc?status=1&id=${id}" method="POST" onSubmit="return confirm('提示：您确定了吗？')">
	<p align="center">二级密码:<input type="password" name="pa3"/></p>
<p align="center"><input type="submit" value="确定无误" name="B1"  style="font-size: 14pt; color: #0000FF; font-weight: bold"></p></FORM>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('提示：您确定取消本次交易吗？ ')" href="/gpjysc"><font color="#008000">返回交易市场</font></a></b></p>
<p align="center">　</p>
