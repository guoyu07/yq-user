<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1055187381'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1616194221'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.670003458'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.200453681'/>！');location.href='datepay'</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.gmmj.value==0) {      alert("<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.640107298'/>!");      return false;    } 
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
						<form class="form form3" method="POST" align="center" action="jztojb?status=1" name="Form" onSubmit="return checkdate()">
							<p><label><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1898581836'/>：</label> <select size="1" name="gmmj">
								<option value="0" selected>==<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-697677804'/>==</option>
								<option value="1">10<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1554998638'/>）</option>
								<option value="5">50<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.1726773544'/>）</option>
								<option value="10">100<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-356053146'/>）</option>
								<option value="30">300<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1988509399'/>）</option>
								<option value="50">500<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.674001644'/>）</option>
								<option value="100">1000<s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.530883694'/>）</option>
								</select></p>
							<p><label></label><button class="but1" type=submit>购 买</button></p>
					</form>
					<p ><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.890004381'/><b>${pay}</b></p>
					<p ><s:text name='viewyblc-buy-goldcard1.jsp.yblc-buy-goldcard1.jsp.-1175229943'/>！</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
