<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户订单不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<head>
  <meta chartset="UTF-8">
  <title>会员中心|商城订单号查询详情</title>
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
      <p class="dialog-title">商城订单号查询详情</p>
      <!-- 图纸为一页13条数据 -->
      <form method="post" name="Form" action="datepayfororder?status=1">
      <p class="small-button-line">
        <a href="datepay?status=1" class="widget-warning mr10">回到一币变化明细</a>
        <span>商城订单号查询：</span>
        <input type="text" name="orderId" id="orderId" value="" size="10" style="padding: 0 5px;" />
        <button type="submit" class="widget-button-small order-search" onClick="querydata()">查询 </button>
      </p>
      <div class="dialog-wrap-border main-widget">
        <div class="dialog-table">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <th>用户名</th>
                <th>一币收入</th>
                <th>一币支出</th>
                <th>金币收入</th>
                <th>金币支出</th>
                <th>剩余一币</th>
                <th>剩余金币</th>
                <th>更新时间</th>
                <th>备注</th>
              </tr>
            </thead>
            <tbody>
             <s:iterator var="data" value="datepaylist">
				<tr>
					<td>${data.username}</td>
					<td>${data.syjz}</td>
					<td><c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></td>
					<td>${data.jyjz}</td>
					<td><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td>
					<td>${data.pay}</td>
					<td>${data.jydb}</td>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.regid}</td>
				</tr>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <!-- 会员中心翻页组件 -->
<p class="widget-pages">
<%-- <aldtags:pageTag paraStr="lb,${lb},status,${status}"/> --%>
</p>
<!-- 会员中心翻页组件 end -->

      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript">
	   function querydata(){
		  var order = $("#orderId").val();
		  if (order==""){
				alert("订单号不能为空！");
				Form.orderId.focus();
				return false;
			}
	  } 
	
	</script>
</body>

</html>
