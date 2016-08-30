<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script> 
	 function checkdate()  {  
	  if (Form.gmsl.value==0) {      alert("<s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.2026567304'/>!");      return false;    } 
	  return true;  }  
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
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-735901424'/></span>
					</div>
					<div class="content-table">
						<form class="form form3" method="POST" align="center" action="jztojb?status=2" name="Form" onSubmit="return checkdate()">
							<p><label><s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.408193998'/>：</label> 
							<c:if test="${gmmj==1}">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</c:if>
							<c:if test="${gmmj==5}">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</c:if>
							<c:if test="${gmmj==10}">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</c:if>
							<c:if test="${gmmj==30}">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</c:if>
							<c:if test="${gmmj==50}">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</c:if>
							<c:if test="${gmmj==100}">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</c:if></p>
							<p><label><s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.1570472502'/>：</label> 
							<select size="1" name="gmsl">
								<option value="0" selected>==<s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.-145398058'/>==</option>
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
								
							<p><label></label><button class="but1" type=submit><s:text name='vipsgreg.jsp.sgreg.jsp.812244'/></button></p>
							<input type="hidden" name="mj" size="5" value="${gmmj}0" readonly>
					</form>
					<p ><s:text name='viewyblc-buy-goldcard2.jsp.yblc-buy-goldcard2.jsp.890004381'/><b>${pay}</b></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
