<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('注意：您的一币小于15，请充值！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('注意：您的一币不够本次购卡，请充值！');history.go(-1);</script></c:if>
<div align="center">
　<p>　</p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">您正在操作的是</font><font style="font-size: 20pt; font-weight: 700" color="#008000">一币转换电子金币卡</font><font style="font-size: 20pt; font-weight: 700" color="#800000">录入</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">请认真确定一下购买的是否</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#FF0000">${gmsl}张</font><font style="font-size: 20pt; font-weight: 700" color="#0000FF">面值
		<c:if test="${mj==10}">10金币（15一币/张）</c:if>
		<c:if test="${mj==50}">50金币（75一币/张）</c:if>
		<c:if test="${mj==100}">100金币（150一币/张）</c:if>
		<c:if test="${mj==300}">300金币（450一币/张）</c:if>
		<c:if test="${mj==500}">500金币（750一币/张）</c:if>
		<c:if test="${mj==1000}">1000金币（1500一币/张）</c:if>
</font></p>
<p><font style="font-size: 20pt; font-weight: 700" color="#800000">需要</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">${gmsl*mj*1.5}一币</font><font style="font-size: 20pt; font-weight: 700" color="#800000">现金</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">=</font><font style="font-size: 20pt; font-weight: 700" color="#008000">${gmsl*mj/10}张</font><font style="font-size: 20pt; font-weight: 700" color="#FF00FF">面值10金币的卡</font><font style="font-size: 20pt; font-weight: 700">累计金币${gmsl*mj}个</font></p>
<p>　</p>
<p><a onClick="return confirm('提示：您确定了吗？ ')" href="jztojb?status=3&mj=${mj}&gmsl=${gmsl}">
<input type="button" value="确定从我的一币-扣除" name="B1" onclick=disabled=true style="font-size: 12pt; color: #0000FF; font-weight: bold"></a> </p>
<p>　<p>  <b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一步</font></a></div>