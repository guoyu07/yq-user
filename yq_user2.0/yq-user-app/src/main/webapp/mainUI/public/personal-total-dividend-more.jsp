<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='reg1.jsp.reg1.jsp.624662580'/>|<s:text name='All_the_details_of_share_out_bonus_details'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
 <link rel="stylesheet" href="${ctx}/css/common${SESSION_LOCALE}.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='All_the_details_of_share_out_bonus_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='reg.jsp.reg.jsp.29623262'/></th>
                <th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.-439906297'/></th>
                <th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.850616742'/></th>
                <th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.813238533'/></th>
                <th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.775680731'/></th>
                <th><s:text name='viewgrxx-gcbftj.jsp.grxx-gcbftj.jsp.657552666'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${gcuser.username}</td>
					<td>${data.sygc}</td>
					<td>${fhpay}</td>
					<td>${data.syfh}</td>
					<td>${data.ljfhtj}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.bz}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="status,1,lb,1"/>
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
