<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script type="text/javascript">
	  function jump(lb){
		  location.replace('datepay?lb='+lb);
		  return;
	  };
	
	  
	</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewlinks.html.links.html.1846650039'/></span>
						<p class="r-link">
						 <a href="datepayfororder"><font color="red"><s:text name='mallorderquery'/></font></a>&nbsp;&nbsp;&nbsp;
						    <select size="1" name="lb" id="lb" onChange="jump(document.getElementById('lb').options[document.getElementById('lb').selectedIndex].value);">
								<option value="0" <c:if test="${empty lb or lb==0}">selected</c:if>><s:text name="all"></s:text></option>
								<option value="1" <c:if test="${lb==1}">selected</c:if>><s:text name="promotion_award"><!-- 推广奖 --></s:text></option>
								<option value="2" <c:if test="${lb==2}">selected</c:if>><s:text name="balance_award"><!-- 平衡奖 --></s:text></option>
								<option value="3" <c:if test="${lb==3}">selected</c:if>><s:text name="counseling_award"><!-- 辅导奖 --></s:text></option>
								<option value="4" <c:if test="${lb==4}">selected</c:if>><s:text name="integral_sell"><!-- 积分卖出 --></s:text></option>
								<option value="5" <c:if test="${lb==5}">selected</c:if>><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/> <s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/><!-- 卖出一币 --></option>
								<option value="6" <c:if test="${lb==6}">selected</c:if>><s:text name="subscription"></s:text> <s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/><!-- 认购一币 --></option>
								<option value="7" <c:if test="${lb==7}">selected</c:if>><s:text name="namesake_Huzhuan"><!-- 同名互转 --></s:text></option>
								<option value="8" <c:if test="${lb==8}">selected</c:if>><s:text name="VIP_transfer_income"><!-- VIP转收 --></s:text></option>
								<option value="9" <c:if test="${lb==9}">selected</c:if>><s:text name="management_transfer_income"><!-- 管理转收 --></s:text></option>
								<option value="10" <c:if test="${lb==10}">selected</c:if>><s:text name="changes_in_management"><!-- 管理增减 --></s:text></option>
								<option value="12" <c:if test="${lb==12}">selected</c:if>><s:text name='commodity_revenues'/></option>
								<option value="13" <c:if test="${lb==13}">selected</c:if>><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/> <s:text name='consumption'/><!-- 一币消费 --></option>
								<option value="14" <c:if test="${lb==14}">selected</c:if>><s:text name='ticket_expenditure'/><!-- 票务支出 --></option>
								<option value="15" <c:if test="${lb==15}">selected</c:if>><s:text name='business_income'/><!-- 商户收入 --></option>
								<option value="16" <c:if test="${lb==16}">selected</c:if>><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.1102075283'/><!-- 话费充值 --></option>
								<option value="20" <c:if test="${lb==20}">selected</c:if>><s:text name='Trading_violations'/><!-- 交易违规 --></option>
								</select>
							<!-- <a href="/datepay"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1029202'/>奖金</a>|
							<a href="/datepay?lb=9">推广部分</a>|
							<a href="/datepay?lb=1">平衡部分</a>|
							<a href="/datepay?lb=8">辅导部分</a>|
							<a href="/datepay?lb=2"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1029202'/>认购</a>|
							<a href="/datepay?lb=3"><s:text name='viewyjcx-game.jsp.yjcx-game.jsp.1029202'/><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/></a> -->
						</p>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th width="75"><s:text name='reg.jsp.reg.jsp.29623262'/></th>
								<th><s:text name='viewlinks.html.links.html.618817200'/></th>
								<th><s:text name='viewlinks.html.links.html.618817132'/></th>
								<th><s:text name='viewlinks.html.links.html.1136018751'/></th>
								<th><s:text name='viewlinks.html.links.html.1136018683'/></th>
								<th><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.674320'/><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></th>
								<th><s:text name='viewlinks.html.links.html.649202784'/></th>
								<th width="100"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.811035898'/></th>
								<th width="135"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></th>
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
