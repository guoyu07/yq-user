<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('未满100天的账户，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('游戏收益未完成，积分暂时停止卖出交易，收益完成后自动开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('请于开户后第二天再进行卖出操作，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('卖出单价不能小于 0.77 ！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('卖出单价不能大于${fcxt.jygj+0.03}  哦！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('您好，您卖出数量不能小于零，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('您好，为了提供更公平公证的交易规则，累计挂牌最高20笔，待交易完成后才可以继续发布，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('您好，您卖出数量不能大于您剩余数量 ${gcuser.jyg} ，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('交易市场已有求购信息，请按需求点击 [我要卖给] ！');location.replace('gpjysc');</script></c:if>
<div align="center">
	　<p>　</p>
	<table border="1" width="50%" id="table1" height="367" style="border-collapse: collapse">
		<tr>
	<td height="314"><b><font size="6" face="隶书">请您再次确认是否挂牌</font></b>
	<p><b><font size="4">您要卖出积分数量<font color="#FF0000">${txpay}</font>选择单价是<font color="#FF0000">${jygj}</font></font></b></p>
	<p><font size="4" color="#800000"><b>卖出成功后：</b></font></p>
	<p><b><font size="4">扣除10%的手续费您共得到：<font color="#800080">${dqpay}</font></font></b></p>
	<p><b><font size="4">其中70%分配到一币账户：<font color="#800080">${mc70}</font> 一币</font></b></p>
	<p><b><font size="4">其中30%分配到金币账户：<font color="#800080">${mc30}</font></font></b></p>
	<p align="center"><a onClick="return confirm('提示：您确定了吗？')" href="/mcsl?status=2&txpay=${txpay}&jygj=${jygj}"><input type="button" value="确定无误" name="B1" onclick=disabled=true style="font-size: 18pt; color: #0000FF; font-weight: bold"></a></td>
		</tr>
		<tr>
	<td><p align="center"><b><font color="#FF0000" style="font-size: 11pt">提示：此为挂牌，等待买家确认后一币和金币才可以得到分配！</font></b></td>
		</tr>
	</table>
	<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
<p align="center">　</div>