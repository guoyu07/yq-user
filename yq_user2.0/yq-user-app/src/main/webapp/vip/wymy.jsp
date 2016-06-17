<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('您好，本次交易金币大于您剩余金币 ${myjddb}，暂时不能交易，请充值或转换金币，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('该积分交易进行中或已经由它人交易成功了，不能修改，请选择其它交易！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('买入${gpjy.mcsl}积分成功！');location.replace('/gpjysc');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<p align="center">　</p>
<p align="center">本次交易倒计时还剩<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> 秒，超时没确认将会自动取消该交易！</p>
<p align="center">　</p>
<p align="center"><font size="6">本次买入需要金币为：<font color="#FF0000">${gpjy.jypay}</font></font></p>
<p align="center"><font size="5">将在您的金币钱包扣除：<b><font color="#FF0000">${gpjy.jypay}</font></b></font></p>
<p align="center">　</p>
<p align="center"><a onClick="return confirm('提示：您确定了吗？')" href="/wymy?status=1&id=${id}"><input type="button" value="确定无误" name="B1" onclick=disabled=true style="font-size: 14pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('提示：您确定取消本次交易吗？ ')" href="/gpjysc"><font color="#008000">返回交易市场</font></a></b></p>
<p align="center">　</p>
