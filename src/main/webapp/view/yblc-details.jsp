<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script type="text/javascript">
	  function jump(lb){
		  location.replace('datepay?lb='+lb);
		  return;
	  }
	
	</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>一币变化明细</span>
						<p class="r-link">
						  
						    <select size="1" name="lb" id="lb" onChange="jump(document.getElementById('lb').options[document.getElementById('lb').selectedIndex].value);">
								<option value="0" <c:if test="${empty lb or lb==0}">selected</c:if>>全部</option>
								<option value="1" <c:if test="${lb==1}">selected</c:if>>推广奖</option>
								<option value="2" <c:if test="${lb==2}">selected</c:if>>平衡奖</option>
								<option value="3" <c:if test="${lb==3}">selected</c:if>>辅导奖</option>
								<option value="4" <c:if test="${lb==4}">selected</c:if>>积分卖出</option>
								<option value="5" <c:if test="${lb==5}">selected</c:if>>卖出一币</option>
								<option value="6" <c:if test="${lb==6}">selected</c:if>>认购一币</option>
								<option value="7" <c:if test="${lb==7}">selected</c:if>>同名互转</option>
								<option value="8" <c:if test="${lb==8}">selected</c:if>>VIP转收</option>
								<option value="9" <c:if test="${lb==9}">selected</c:if>>管理转收</option>
								<option value="10" <c:if test="${lb==10}">selected</c:if>>管理增减</option>
								<option value="11" <c:if test="${lb==11}">selected</c:if>>一币换购</option>
								<option value="12" <c:if test="${lb==12}">selected</c:if>>商品收入</option>
								<option value="13" <c:if test="${lb==13}">selected</c:if>>一币消费</option>
								<option value="14" <c:if test="${lb==14}">selected</c:if>>票务支出</option>
								<option value="15" <c:if test="${lb==15}">selected</c:if>>商户收入</option>
								<option value="16" <c:if test="${lb==16}">selected</c:if>>话费充值</option>
								<option value="17" <c:if test="${lb==17}">selected</c:if>>一币竞猜</option>
								<option value="18" <c:if test="${lb==18}">selected</c:if>>一币抢购</option>
								<option value="19" <c:if test="${lb==19}">selected</c:if>>一币游戏</option>
								<option value="20" <c:if test="${lb==20}">selected</c:if>>交易违规</option>
								</select>
							<!-- <a href="/datepay">累计奖金</a>|
							<a href="/datepay?lb=9">推广部分</a>|
							<a href="/datepay?lb=1">平衡部分</a>|
							<a href="/datepay?lb=8">辅导部分</a>|
							<a href="/datepay?lb=2">累计认购</a>|
							<a href="/datepay?lb=3">累计卖出</a> -->
						</p>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="75">用户名</th>
								<th>一币收入</th>
								<th>一币支出</th>
								<th>金币收入</th>
								<th>金币支出</th>
								<th>剩余一币</th>
								<th>剩余金币</th>
								<th width="100">更新时间</th>
								<th width="135">备注</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr>
								<td>${gcuser.username}</td>
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
						</table>
						<div class="page">
							<p><aldtags:pageTag para1="lb" value1="${lb}"/>
							 </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>