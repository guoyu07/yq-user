<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('交易不存在，请重新操作！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('您好，您还不是双区玩家，暂时不能使用一币理财功能！');location.replace('vipup?my=${userName}&secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('您好，您还没达到D套餐，暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！');location.replace('vipup?my=${userName}&secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您好，您的诚信星为${gcuser.cxt}，离取消[限制认购]时间还有${gcuser.ctxDays}天，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('您好，不能认购自己的一币，请选择其它用户，谢谢！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您好，您的积分数量不足，（认购一币作为诚信金），暂时不能使用一币理财功能！\n\n您可以联系团队服务中心以95%的价格购买一币后进行操作！');location.replace('vipup?my=${userName}&secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('该一币交易进行中或已经由它人交易成功了，不能重复，请选择其它交易！');location.href='epjysc?secondThisState=253&thisState=244';</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('您好，您的二级密码不正确，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='auditedis'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('非VIP玩家不能购买一币！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('下单认购一币-"${txpay.paynum}"成功，请您及时付款，建立诚信交易渠道！');location.replace('epmyjl?status=1&?secondThisState=253&thisState=244');</script></c:if>

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币认购</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<!-- 通用头部 -->
<%@ include file="/mainUI/common/head.jsp" %>
<!-- 通用头部 end -->
 
<!-- 会员中心导航模块 -->
<div class="container">
  <div class="member-header" id="J_memberHeader">
    <p class="breadcrumb-trail">财富中心 >> 一币理财</p>
   <%@ include file="/mainUI/common/scendhead.jsp" %>
  </div>
</div>
<!-- 会员中心导航模块 end -->

<!-- 一币理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
    <div class="dialog-widget">
      <p class="dialog-title">一币认购</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget customer-service-center">
        <form class="widget-form" method="POST" action="epmy?ep=${ep}&status=1&secondThisState=${secondThisState}&thisState=${thisState}" name="Form" onSubmit="return checkdate()">
          <p class="widget-notice mt15 ml10">本次交易倒计时还剩<b class="widget-warning" id="sec"></b>秒，超时没确认将会自动取消该交易！</p>
          <p class="widget-tips mt15 ml10">下单成功后必须在“<b class="widget-warning">2小时</b>”内向发布方<b class="widget-warning">${txpay.payusername}</b>的指定银行账号打入不低于<b class="widget-warning"><c:choose><c:when test="${txpay.paynum<900}" >${txpay.paynum*0.85}</c:when><c:otherwise>${txpay.paynum*0.90}</c:otherwise></c:choose>元</b>！同时在登录平台点“一币-理财”下“认购明细”查看该笔交易状态-发布方<b class="widget-warning">${txpay.payusername}</b>收款账号，并进行“我已付款<c:choose><c:when test="${txpay.paynum<900}" >${txpay.paynum*0.85}</c:when><c:otherwise>${txpay.paynum*0.90}</c:otherwise></c:choose>通知发布方确认”的操作！</p>
          <p class="item mt15">
            <label class="title">发布方收款方式：</label><span class="text widget-warning">${txpay.paybank}</span>
          </p>
          <p class="item">
            <label class="title">认购方：</label><span class="text">${userName}</span>
          </p>
          <p class="item">
            <label class="title">发布方：</label><span class="text">${txpay.payusername}</span>
          </p>
          <p class="item">
            <label class="title">本次认购一币数量为：</label><span class="text"><b class="widget-warning">${txpay.paynum}</b> 一币 （将增加到您的“一币-余额”）</span></p>
          <p class="item">
            <label class="title">认购方将支付：</label><span class="text"><b class="widget-warning"><c:choose><c:when test="${txpay.paynum<900}" >${txpay.paynum*0.85}</c:when><c:otherwise>${txpay.paynum*0.90}</c:otherwise></c:choose></b>元</span></p>
          <p class="item">
            <label class="title">二级密码：</label>
            <input type="password" name="epnm3" />
          </p>
          <p class="button-line mt15">
            <input type="submit" class="widget-button" value="确定无误" name="B1" />
          </p>
          <p class="widget-tips mt30 ml10 tc">根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</p>
          <p class="widget-tips mt10 ml10 tc">有任何事情请与我联系:<b class="widget-warning"><s:text name="vipepmy.jsp.epmy.jsp.643357742">QQ：${qq}</s:text></b>
            <a class="contact-qq" target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:613697152:41" alt="点击这里发消息" title="点击这里发消息"></a>
          </p>
          <p class="widget-tips widget-warning mt15 ml10 tc">各部门服务中心人员分工有序,请不要重复添加好友,更不要向每个客服在同一时段咨询同一个问题，感谢您的配合。</p>
          <p class="button-line mt15 tc"><a class="widget-button-small" style="text-decoration: none" onclick="return confirm('提示：您确定取消本次交易吗？？ ')" href="epjysc?secondThisState=${secondThisState}&thisState=${thisState}">返回交易市场</a></p>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script language="JavaScript">
function checkdate() {
  if (Form.epnm3.value == "") {
    alert("请输入二级密码密码!");
    return false;
  }
  return true;
}
</script>
<script>
var secs = 60; //6为倒计时秒数
for (i = 0; i <= secs; i++) {
  window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
  if (num == secs) {
    alert('交易超时或撒消交易成功！');
    location.replace('epmy');
  } else {
    printnr = secs - num;
    document.getElementById('sec').innerHTML = printnr;
  }
}
</script>
</body>

</html>
