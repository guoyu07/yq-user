<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title><s:text name='vipgpjymc.jsp.gpjymc.jsp.624662580'/>|<s:text name='Details_of_the_sale_details'/></title>
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
      <p class="dialog-title"><s:text name='Details_of_the_sale_details'/></p>
      <!-- 图纸为一页13条数据 -->
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.27758404'/></th>
                <th><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.-365289126'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.855285018'/></th>
                <th><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.663201424'/></th>
                <th><s:text name='viewyblc-mark.jsp.yblc-mark.jsp.625799226'/></th>
                <th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
                <th><s:text name='operation.state'/></th>
              </tr>
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
							<tr>
								<td>***${data.simplePayid}</td>
								<td>${data.payusername}</td>
								<td>${data.paynum9}<s:text name='YUAN'/></td>
								<td><fmt:formatDate value="${data.paytime}" type="both"/></td>
								<td> <c:if test="${not empty data.zftime}"><s:text name='viewyblc-mrdetails.jsp.yblc-mrdetails.jsp.316595986'/><c:if test="${data.tp==1}">(system)</c:if> --<s:text name='viewjflc-details.jsp.jflc-details.jsp.755936'/>--${data.dfuser}--<fmt:formatDate value="${data.zftime}" type="both"/></c:if>
								<c:if test="${empty data.zftime}">


             <c:if test="${data.ep!=1&&data.ep!=2}"><s:text name='vipepmcjl.jsp.epmcjl.jsp.1467453928'/>。。--<b><a onClick="return confirm('<s:text name="vipepjysc.jsp.epjysc.jsp.1991539691"/>')" href="qxepmc?qx=${data.payid}"><font color="#FF0000"><s:text name='viewyblc-mcdetails.jsp.yblc-mcdetails.jsp.1467453928a'/></font></a></b></c:if>
              </c:if>
								</td>
								<td>


          </c:if>
          </font>
					         	</a>
					         	</td>	
					          	<td><c:if test="${data.opstate==1}"><s:text name='Order.is.reset'/></c:if></td>
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
