<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${gcuser.dqu=='0' || gcuser.dqu=='2' || gcuser.dqu=='7' || gcuser.dqu=='8'}">
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz01" value="本公司【①号】客服QQ：613697151"></c:set>
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
<c:set var="cz01" value="本公司【②号】客服QQ：613697152"></c:set>
<c:set var="cz02" value="陈文娟"></c:set>
<c:set var="ghbank" value="6212262002007387842"></c:set>
<c:set var="nhbank" value=""></c:set>
<c:set var="jsbank" value="6236683090000220300"></c:set>
<c:set var="zgbank" value="6217857000048362303"></c:set>
<c:set var="cftbank" value="2392865933"></c:set>
<c:set var="khbank" value="广东省-珠海市-香洲区支行"></c:set>
<c:set var="cms" value="公司【②号】财务师"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|服务中心</title>
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

<div class="container">
  <!-- 首页内容 -->
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
     <div class="member-aside">
 			<%@ include file="/mainUI/common/userLeft.jsp" %>
        <!-- 账户概览 积分理财、一币理财、业绩查询、个人信息 的不一样 -->
          <%@ include file="/mainUI/common/pointLicaiLeft.jsp" %>
        <!-- 账户概览  end -->
	<!-- 会员中心左边栏 end -->
	</div>
    <!-- 客服中心 -->
    <div class="member-main">
      <div class="main-widget customer-service-center">
        <p class="widget-title-line">关于服务中心</p>
        <div class="widget-article">
          <p>根据您注册用户时选择的地区，本服务中心为您提供贴身的服务，以提高办事效率！</p>
          <p>有任何事情请联系：
            <span style="color: #0078ff;">${gcuserup.qq}<a class="contact-qq ml10" target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=1790863642&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1790863642:41" alt="点击这里发消息" title="点击这里发消息"></a></span></p>
          <p class="widget-warning mt10">各部门服务中心人员分工有序,请不要重复添加好友,更不要向每个客服在同一时段咨询同一个问题，感谢您的配合。</p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title">本服务中心${gcuserup.vipuser}专用收款账号</p>
        <div class="widget-form">
          <p class="item">
            <label class="title">开户名：</label>
            <span class="text widget-warning">${gcuserup.vipuser}</span>
          </p>
          
            
		        <c:if test="${not empty gcuserup.vipgh}">
		        <p class="item">
				  <label class="title">工商银行：</label>
            	  <span class="text">${gcuserup.vipgh}</span></p>
				</c:if>
				<c:if test="${not empty gcuserup.vipnh}">
				<p class="item">
					<label class="title"> 农业银行:</label>
	            	<span class="text">${gcuserup.vipnh}</span></p>
				</c:if>		
				<c:if test="${not empty gcuserup.vipjh}">
				<p class="item">
					<label class="title">建设银行:</label>
	            	<span class="text">${gcuserup.vipjh}</span></p>
				</c:if>
				<c:if test="${not empty gcuserup.vipzh}">
				<p class="item">
				<label class="title">中国银行:</label>
	            	<span class="text">${gcuserup.vipzh}</span></p>
				</c:if>	
				<c:if test="${not empty gcuserup.vipcft}">
				<p class="item">
				<label class="title"> 财付通:</label>
	            	<span class="text">${gcuserup.vipcft}</span></p>
				</c:if>		
				<c:if test="${not empty gcuserup.vipzfb}">
				<p class="item">
				<label class="title">支付宝:</label>
	            	<span class="text">${gcuserup.vipzfb}</span></p>
				</c:if>
				<p>开户行所在地：${gcuserup.addsheng}${gcuserup.addshi}${gcuserup.addqu}支行</p>
          <p class="widget-notice widget-warning mt10 pl10">汇款一定要加尾数，以便查账；如：1000.22 5000.12</p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line">服务中心服务时间表</p>
        <div class="widget-article">
          <p class="widget-notice">早上：9点30分-11点30分</p>
          <p class="widget-notice mt10">下午：13点30分-17点30分</p>
          <p class="widget-notice mt10">晚上：19点30分-22点30分</p>
        </div>
      </div>
      <div class="main-widget mt15">
        <p class="widget-title-line">注意事项</p>
        <div class="widget-article">
          <p>本服务中心指定账号不可以复制给其它地区人员，每次汇款前请按上面公布的为准，以免担误大家宝贵的时间！</p>
          <p class="widget-warning">打款成功后按以下格式提交给客服：</p>
          <p class="widget-warning">汇至户名沈发庭（XX银行）、时间、金额（金额一定要加尾数）、需要充值的用户名：XXXXXX</p>
          <p>充值后可自行操作报单开户，以免担误时间，还有恳请大家不要重复联系客服，以免重复处理，感谢大家的配合！</p>
          <p>请大家尽量提前充值，尽量不要都挤压在晚上8点至10点，所有充值事宜要在晚上10点30分前办理 晚上10点30分后要求充值的不能及时处理属于正常现象，谢谢理解！
          </p>
        </div>
      </div>
    </div>
    <!-- 客服中心 end -->
  </div>
  <!-- 首页内容 end -->
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
