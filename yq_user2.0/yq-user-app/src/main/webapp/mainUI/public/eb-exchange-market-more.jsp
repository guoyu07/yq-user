<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mark.jsp.yblc-mark.jsp.-1628195825'/>！');location.replace('/vipup');</script></c:if>

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Dollar_market_details'/></title>
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
      <p class="dialog-title"><s:text name='Dollar_market_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.21178581'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.20607384'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.855285018'/></th>
                <th><s:text name='Subscribe_for_a_dollar'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.912665660'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.656576290'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.625799226'/></th>
                <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
              </tr>
            </thead>
            <tbody>
              	<s:iterator var="data" value="dataList">
				<tr>
					<td>${data.payid}</td>
					<td>${data.payusername}</td>
					<td>${data.cxt}</td>
					<td>${data.paynum9}</td>
					<td> ${data.paynum}</td>
					<td>${data.paynum-data.paynum9}</td>
					<td>${data.paytime}</td>
					<td> <c:if test="${data.payusername==userName}"><b><a onClick="return confirm('"<s:text name='vipgpjymc.jsp.gpjymc.jsp.1526835300'/>"')" href="qxepmc?qx=${data.payid}"><font color="#FF0000"><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.1467453928a'/></font></a></b></c:if><c:if test="${data.payusername!=userName}"><s:text name='vipepjysc.jsp.epjysc.jsp.1991539691b'/>。。。</c:if></td>

				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
  <aldtags:pageTag paraStr="status,${status},"/>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script>
function jump(lb) {
  location.replace('datepay?lb=' + lb);
  return;
};
</script>
</body>

</html>
