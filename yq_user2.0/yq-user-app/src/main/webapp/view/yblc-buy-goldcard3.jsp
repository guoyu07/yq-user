<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('注意：您的一币小于15，请充值！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('注意：您的一币不够本次购卡，请充值！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  

  if (Form.pa3.value=="") {      alert("请输入二级密码!");      return false;    } 
  
	 if(!confirm('提示：您确定了吗？ ')){
		 return false;
	 }
  
  return true;  
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
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span>一币-购金币卡</span>
					</div>
					<div class="content-table">
					  <p>您正在操作的是<b>一币转换电子金币卡</b>录入</p>
					  <p>请认真确定一下购买的是否正确</p>
					  <p><b>${gmsl}</b>张,面值<b>
							<c:if test="${mj==10}">10金币（15一币/张）</c:if>
							<c:if test="${mj==50}">50金币（75一币/张）</c:if>
							<c:if test="${mj==100}">100金币（150一币/张）</c:if>
							<c:if test="${mj==300}">300金币（450一币/张）</c:if>
							<c:if test="${mj==500}">500金币（750一币/张）</c:if>
							<c:if test="${mj==1000}">1000金币（1500一币/张）</c:if></b></p>
					 <p>需要<b>${gmsl*mj*1.5}</b>一币，现金=<b>${gmsl*mj/10}张</b>面值10金币的卡累计金币${gmsl*mj}个</p>
					 <p><form action="jztojb?status=3&mj=${mj}&gmsl=${gmsl}" method="post" onSubmit="return checkdate();" name="Form" id="Form">
					 二级密码：<input type="password" name="pa3" />
					 <button type="submit" >确定从我的一币-扣除</button>
					 </form></p>		
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>