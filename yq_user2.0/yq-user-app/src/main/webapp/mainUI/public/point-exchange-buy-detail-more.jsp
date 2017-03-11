<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|当前求购明细详情</title>
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
      <p class="dialog-title">当前求购明细详情</p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
             <tr>
								<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.-1172477375'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.787632912'/></th>
								<th><s:text name='viewjflc-jfmr.jsp.jflc-jfmr.jsp.861206825'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${userName}</td>
								<td>${data.mysl}</td>
								<td>${data.jypay}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td><a href="qxqg?qxid=${data.jyid}" style="text-decoration: none"><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.836270'/></a></td>
							</tr>
							</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
	<aldtags:pageTag paraStr="status,4,thisState,${thisState},secondThisState,${secondThisState}"/>
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
