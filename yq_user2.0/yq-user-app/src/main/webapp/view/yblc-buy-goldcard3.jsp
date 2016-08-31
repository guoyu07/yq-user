<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  

  if (Form.pa3.value=="") {      alert("<s:text name='vipupuser.jsp.upuser.jsp.35593833'/><s:text name='reg.jsp.reg.jsp.630954966'/>!");      return false;    } 
  
	 if(!confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？ ')){
		 return false;
	 }
  
  return true;  
  }  
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
					  <p><s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-930056467'/></p>
					  <p><s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.-1610588230'/></p>
					  <p><b>${gmsl}</b><s:text name='pieceYibi'/><b>
							<c:if test="${mj==10}">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</c:if>
							<c:if test="${mj==50}">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</c:if>
							<c:if test="${mj==100}">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</c:if>
							<c:if test="${mj==300}">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</c:if>
							<c:if test="${mj==500}">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</c:if>
							<c:if test="${mj==1000}">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</c:if></b></p>
					 <p><s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.586521860'/></p>
					 <p><form action="jztojb?status=3&mj=${mj}&gmsl=${gmsl}" method="post" onSubmit="return checkdate();" name="Form" id="Form">
					 <s:text name='reg.jsp.reg.jsp.630954966'/>：<input type="password" name="pa3" />
					 <button type="submit" ><s:text name='viewyblc-buy-goldcard3.jsp.yblc-buy-goldcard3.jsp.1964436824'/></button>
					 </form></p>		
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
