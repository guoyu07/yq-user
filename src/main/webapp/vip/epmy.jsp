<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('交易不存在，请重新操作！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您还不是双区玩家，暂时不能使用一币理财功能！');location.replace('vipup?my=${userName}');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，您还没达到D套餐，暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！');location.replace('vipup?my=${userName}');</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，您的诚信星为${gcuser.cxt}，离取消[限制认购]时间还有${gcuser.ctxDays}天，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，不能认购自己的一币，请选择其它用户，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，您的积分数量不足，（认购一币作为诚信金），暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！');location.replace('vipup?my=${userName}');</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('该一币交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='epjysc';</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('您好，您的二级密码不正确，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('下单认购一币-"${txpay.paynum}"成功，请您及时付款，建立诚信交易渠道！');location.replace('epmyjl');</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="中国一川【①号】客服QQ：613697151"></c:set>
</c:if>
<c:if test="${gcuser.dqu=='1' || gcuser.dqu=='3' || gcuser.dqu=='4' || gcuser.dqu=='5' || gcuser.dqu=='6'}">
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz01" value="中国一川【②号】客服QQ：613697152"></c:set>
</c:if>

<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
  function checkdate()  { 
  if (Form.epnm3.value=="") {      alert("请输入二级密码密码!");      return false;    } 
  return true;  }  
 </script>
<p align="center">　</p>
<p align="center">本次交易倒计时还剩<b><font color="#FF0000"> </font></b><span id="sec" style="color:red"></span><b><font color="#FF0000"></font></b> 秒，超时没确认将会自动取消该交易！</p>
<p align="center">　</p>
<p align="center"><font size="6">本次认购一币数量为：<font color="#FF0000">${txpay.paynum}</font></font><b><font color="#FF00FF" size="5" face="楷体">-将增加到您的“一币-余额”</font></b></p>
<p align="center"><b><font color="#800000" face="楷体" style="font-size: 20pt">实际只需要向发布方</font><font color="#000080" face="楷体" style="font-size: 20pt">${txpay.payusername}</font><font color="#800000" face="楷体" style="font-size: 20pt">支付：</font><font color="#FF0000" face="楷体" style="font-size: 20pt">${txpay.paynum*0.9}</font><font face="楷体" style="font-size: 20pt">元</font></b></p>
<div align="center">
	<table border="0" width="80%" id="table1" cellspacing="1" bgcolor="#EFEFEF" height="135">
	<tr>
	<td><b><font color="#FF0000">重要提示：</font><font color="#0000FF">(发布方使用的收款方式是“</font><font color="#008000">${txpay.paybank}</font><font color="#0000FF">”)</font></b><p>
	本次下单须在您的用户名(认购方)：<b><font color="#008000">${userName} </font></b>的积分账户暂扣<b><font color="#FF0000">${txpay.paynum}</font></b>作为本次交易诚信金！<p>
	下单成功后必须在“<font color="#FF0000">2小时</font>”内向发布方<font color="#0000FF">${txpay.payusername}</font>的指定银行账号打入不低于<b><font color="#FF0000">${txpay.paynum*0.9}</font></b>元！同时在登录平台点“一币-理财”下“认购明细”查看该笔交易状态-发布方<font color="#0000FF">${txpay.payusername}</font>收款账号，并进行“我已付款<b><font color="#FF0000">${txpay.paynum*0.9}</font></b>-通知发布方确认”的操作！</td>
	</tr>
	</table>
<table border="0" width="80%" id="table2" cellspacing="3" cellpadding="2" bgcolor="#E6FFF2">
		<tr>
			<td align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</span></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 11pt">有任何事情请与我联系：<b><font color="#0000FF">${cz01}</font></b> </span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${qq}:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="right"></p>
			<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2">各部门服务中心人员分工，一个人不能重复加上，更不能向每个人同一时段咨询同一个问题</font></td>
		</tr>
		</table>
	</div>
<p align="center">　</p>
<form method="POST" action="epmy?ep=${ep}&status=1"  name="Form" onSubmit="return checkdate()">
	<div align="center">
		<table border="0" width="56%" id="table3">
			<tr>
				<td align="center"><p align="right"><span style="font-size: 11pt">认购方<font color="#FF0000">${userName}</font>的二级密码：</span></td>
				<td align="center" width="160"><span style="font-size: 11pt"><input type="password" name="epnm3" size="20"></span></td>
				<td align="center" width="189"><input type="submit" value="确定无误" name="B1" style="font-size: 11pt; color: #0000FF; font-weight: bold; float:left"></a></td>
			</tr>
		</table>
	</div>
</form>
<p align="center">　</p>
<p align="center"><b><a style="text-decoration: none" onClick="return confirm('提示：您确定取消本次交易吗？ ')" href="epjysc"><font color="#008000">返回交易市场</font></a></b></p>
<p align="center">　</p>
<script>
var secs = 60;  //6为倒计时秒数
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
	alert('交易超时或撒消交易成功！');location.replace('epjysc');
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>