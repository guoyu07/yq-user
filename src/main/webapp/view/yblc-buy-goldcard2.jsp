<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('注意：您的一币小于15，请充值！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script> 
	 function checkdate()  {  
	  if (Form.gmsl.value==0) {      alert("请选择你要购买的数量!");      return false;    } 
	  return true;  }  
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
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>一币-购金币卡</span>
					</div>
					<div class="content-table">
						<form class="form form3" method="POST" align="center" action="jztojb?status=2" name="Form" onSubmit="return checkdate()">
							<p><label>已选择的面值为：</label> 
							<c:if test="${gmmj==1}">10金币（15一币/张）</c:if>
							<c:if test="${gmmj==5}">50金币（75一币/张）</c:if>
							<c:if test="${gmmj==10}">100金币（150一币/张）</c:if>
							<c:if test="${gmmj==30}">300金币（450一币/张）</c:if>
							<c:if test="${gmmj==50}">500金币（750一币/张）</c:if>
							<c:if test="${gmmj==100}">1000金币（1500一币/张）</c:if></p>
							<p><label>请选择要购买的数量：</label> 
							<select size="1" name="gmsl">
								<option value="0" selected>==请选择数量==</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								</select></p>
								
							<p><label></label><button class="but1" type=submit>提交</button></p>
							<input type="hidden" name="mj" size="5" value="${gmmj}0" readonly>
					</form>
					<p >提示：您的一币剩余<b>${pay}</b></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>