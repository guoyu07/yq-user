<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>用户服务中心-财务师收款账号</title>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="广东省-珠海市-香洲区支行"></c:set>
<c:set var="cms" value="公司【②号】财务师"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="广东省-珠海市-香洲区支行"></c:set>
<c:set var="cms" value="公司【②号】财务师"></c:set>
</c:if>

<table border="0" width="100%" id="table1" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">有任何事情请联系：<b><font color="#0000FF">${cz01}</font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"><font color="#FF0000" size="2">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</font></td>
		</tr>
		</table>
      <div align="center">
		<table border="0" width="90%" id="table2" height="118">
			<tr>
				<td>
	<table border="0" width="100%" cellspacing="1" bgcolor="#EFDFFF">
		<tr>
			<td>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>服务中心服务时间表：</b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<b><font color="#FF0000">早上：9点30分-11点30分</font><font color="#0000FF"> </font> <font color="#FF00FF"> 下午：13点30分-17点30分</font> <font color="#008000">晚上：19点30分-10点30分</font></b></td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">本服务中心 <b><font color="#0000FF">${cz01}</font></b> 专用收款账号如下：</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">开户名：<b><font color="#008000">${cz02}</font></b>--<b><font color="#800000" size="2">${cms}</font></b></p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">工商银行：${ghbank}</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">建设银行：${jsbank}</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">中国银行：${zgbank}</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">财付通：${cftbank}</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">开户行：${khbank}</p>
                <p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FF0000">汇款一定要加尾数，以便查账；如：1000.22&nbsp; 5000.12</font></b></p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">注意：</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">本服务中心指定账号不可以复制给其它地区人员，每次汇款前请按上面公布的为准，以免担误大家宝贵的时间！</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000">打款成功后按以下格式提交给客服：</font></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000">汇至户名</font><font color="#FF0000">${cz02}</font><font color="#008000">（XX银行）、时间、金额（金额一定要加尾数）、需要充值的用户名：XXXXXX</font></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">充值就是充值，充值后可自行操作报单开户，以免担误时间，还有恳请大家不要重复联系客服，以免重复处理了，感谢大家的配合！<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</td>
			</tr>
		</table>
		<table border="0" width="90%" cellspacing="1" bgcolor="#EFDFFF">
			<tr>
				<td>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="center">请大家尽量提前充值，尽量不要都挤压在晚上8点至10点，所有充值事宜要在晚上10点30分前办理</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="center">晚上10点30分后要求充值的不能及时处理属于正常现象，谢谢理解！</p>
				</td>
			</tr>
		</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"></p>
		</div>		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>