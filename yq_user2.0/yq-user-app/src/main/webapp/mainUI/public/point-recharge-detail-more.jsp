<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-253996823'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.-1299761769'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='vipchklogin.jsp.chklogin.jsp.1309921904'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('您无权激活此卡！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('手机验证码为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('您填入的手机验证码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('激活成功！');location.replace('gmjh?secondThisState=251&thisState=244');</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|充值明细详情</title>
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
      <p class="breadcrumb-trail">财富中心 >> 金币管理</p>
      <ul class="nav-secondary">
       <%@ include file="/mainUI/common/scendhead.jsp" %>
      </ul>
    </div>
  </div>
  <!-- 会员中心导航模块 end -->
  <!-- 积分理财内容 -->
  <div class="container">
    <div class="member-content" id="J_memberContent">
      <div class="member-main-full">
      <div class="dialog-widget">
      <p class="dialog-title">充值明细详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
	          <thead>
	              <tr>
	                <th>用户名</th>
	                <th>最近充值</th>
	                <th>累计充值</th>
	                <th>购买日期</th>
	                <th>充值时间</th>
	                <th>充值方式</th>
	                <th>愿购买者</th>
	                <th>操作员</th>
	                <th>IP地址</th>
	              </tr>
	            </thead>
            <tbody>
               <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.cjuser}</td>
					<td>${data.dqcj}</td>
					<td>${data.ljcj}</td>
					<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
					<td><fmt:formatDate value="${data.qldate}" type="both"/></td>
					<td>${data.cjfs}</td>
					<td>${data.bz}</td>
					<td>${data.cz}</td>
					<td>${data.ip}</td>
				</tr>
			   </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
 <aldtags:pageTag/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
</body>

</html>
