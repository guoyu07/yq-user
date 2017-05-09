<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.2073267590'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1239579686'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.2060105128'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1830047641'/>！');history.go(-1);</script></c:if>


<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.640340070'/>！');location.href='vipcjb';</script></c:if>

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='VIP_recharge_management_details'/></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="stylesheet" href="${ctx}/css/common.css">
</head>

<body>
<div class="member-dialog-container">
  <div class="member-main">
    <div class="dialog-widget">
      <p class="dialog-title"><s:text name='VIP_recharge_management_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1030049'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1619451673'/></th>
                <th><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/></th>
                <th><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.789127981'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.25461174'/></th>
                <th><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.-1365514950'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
				<tr>
					<td>${data.cjid}</td>
					<td>${data.cjuser}</td>
					<td>${data.cjjo}</td>
					<td>${data.bz}</td>
					<td><fmt:formatDate value="${data.cjdate}" type="both"/></td>
					<td>${data.vipuser}</td>
					<td>${data.sycjb}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="status,1"/>
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
