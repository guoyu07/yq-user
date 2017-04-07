<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta chartset="UTF-8">
  <title>会员中心|一币变化明细</title>
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

<!-- 积分理财内容 -->
<div class="container">
  <div class="member-content" id="J_memberContent">
    <!-- 会员中心左边栏 -->
   <%--   <div class="member-aside-sp">
 		<%@ include file="/mainUI/common/userLeft.jsp" %>
        <%@ include file="/mainUI/common/licaiLeft.jsp" %>
      </div> --%>
<!-- 会员中心左边栏 end -->

    <div class="member-main-full">
      <!-- 积分交易明细 -->
      <div class="main-widget">
        <p class="widget-title-line">一币变化明细</p>
        <p class="small-button-line">
          <a href="datepayfororder?thisState=${thisState}&secondThisState=${secondThisState}" class="widget-warning mr10">点击这里进入商城订单号查询</a>
          <select class="widget-select" id="lb" name="lb" onchange="jump(document.getElementById('lb').options[document.getElementById('lb').selectedIndex].value);">
            <option value="0" <c:if test="${empty lb or lb==0}">selected</c:if>>全部</option>
            <option value="141" <c:if test="${lb==141}">selected</c:if>>推广奖</option>
            <option value="103" <c:if test="${lb==103}">selected</c:if>>平衡奖</option>
            <option value="105" <c:if test="${lb==105}">selected</c:if>>辅导奖</option>
            <option value="108" <c:if test="${lb==108}">selected</c:if>>积分卖出</option>
            <option value="111" <c:if test="${lb==111}">selected</c:if>>卖出 一币 </option>
            <option value="144" <c:if test="${lb==144}">selected</c:if>>认购 一币 </option>
            <option value="118" <c:if test="${lb==118}">selected</c:if>>同名互转</option>
            <option value="127" <c:if test="${lb==127}">selected</c:if>>VIP转收</option>
           <!--  <option value="9">管理转收</option>
            <option value="10">管理增减</option>
            <option value="12">商品收入</option> -->
            <option value="146" <c:if test="${lb==146}">selected</c:if>>一币 消费 </option>
            <option value="137" <c:if test="${lb==137}">selected</c:if>>票务支出 </option>
            <!-- <option value="15">商户收入 </option> -->
            <option value="138" <c:if test="${lb==138}">selected</c:if>>话费充值 </option>
             <option value="151" <c:if test="${lb==151}">selected</c:if>>信誉星明细 </option>
           <!--  <option value="20">交易违规 </option> -->
          </select>
        </p>
        <div class="widget-table mt5 full-size">
          <table border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
				 <th>用户名</th>
                <th>一币收入</th>
                <th>一币支出</th>
                <!-- <th>金币收入</th>
                <th>金币支出</th> -->
                <th>剩余一币</th>
               <!--  <th>剩余金币</th> -->
                <th>更新时间</th>
                <th>备注</th>
			</tr>
							
            </thead>
            <tbody>
              <s:iterator var="data" value="dataList">
<%--               <c:if test="${data.jc!=0||data.syjz!=0}">
 --%>				<tr>
					<td>${gcuser.username}</td>
					<td>${data.syjz}</td>
					<td><c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></td>
					<%-- <td>${data.jyjz}</td>
					<td><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td> --%>
					<td>${data.pay}</td>
					<%-- <td>${data.jydb}</td> --%>
					<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
					<td>${data.regid}</td>
				</tr>
				<%-- </c:if> --%>
				</s:iterator>
            </tbody>
          </table>
        </div>
        <p class="widget-pages">
	<aldtags:pageTag paraStr="lb,${lb},thisState,${thisState},secondThisState,${secondThisState}"/>
	</p>
        <!-- 积分交易明细 end -->
      </div>
      <!-- 积分交易明细 end -->
    </div>
  </div>
  <!-- 积分理财内容 end -->
  <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
  <script>
  function jump(lb) {
    location.replace('datepay?lb=' + lb+'&thisState='+${thisState}+'&secondThisState='+${secondThisState});
    return;
  };
  </script>
  </body>

  </html>
