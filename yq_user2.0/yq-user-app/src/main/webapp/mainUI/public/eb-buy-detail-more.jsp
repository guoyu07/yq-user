<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.624662580'/>|<s:text name='Details_of_the_subscription_details'/></title>
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
      <p class="dialog-title"><s:text name='Details_of_the_subscription_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></th>
                <th><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1089491839'/></th>
                <th><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.868743081'/></th>
                <th><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.1100547719'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.21178581'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.625799226'/></th>
                <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
                <th><s:text name='operation.state'/></th>
              </tr>
            </thead>
            <tbody>
               <s:iterator var="data" value="dataList">
				<tr>
				<td>***${data.simplePayid}</td>
				<td>${data.dfuser}</td>
				<td>${data.paynum}</td>
				<td><fmt:formatDate value="${data.rgdate}" type="both"/></td>
				<td> ${data.payusername}</td>
				<td> 
				<c:if test="${not empty zftime}">
                                                               <s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.691355938'/>${data.payusername}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.691355938a'/>。
          </c:if>
          <c:if test="${empty zftime}">
                <c:if test="${data.ep==1}"><font color="#FF00FF"><s:text name='vipepmyjl.jsp.epmyjl.jsp.-2134021130'/></font><font color="#0000FF"><b>${data.rgdate}</b></font><font color="#FF00FF"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-2134021130a'/>，<b><a target="_blank" href="fbbank?fb=${data.payid}"><font color="#008000"><s:text name='vipepmyjl.jsp.epmyjl.jsp.-2134021130b'/>！</font></a></b></font></c:if>                                                
                <c:if test="${data.ep==2}">${data.dfuser}--<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1073667942'/>${data.payusername}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.-1073667942a'/>。。。</c:if>
          </c:if>
	          	</td>

        						<c:if test="${data.ep==1}"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.314771621'/>${data.paynum9}<s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.314771621a'/>。</c:if></font></a>
        					</td>
        					<td><c:if test="${data.opstate==1}"><s:text name='Order.is.reset'/></c:if></td>
				</tr>
			</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
<aldtags:pageTag paraStr="status,${status},lb,${lb}"/>
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
