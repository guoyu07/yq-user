<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/zhgl.jsp"%>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewindex2.jsp.index2.jsp.667742'/><s:text name='viewyblc-userscoreslog.jsp.yblc-userscoreslog.jsp.1135007'/></span>
					</div>
					<div class="content-txt">
						<div class="notice">
							<c:choose>  
							<c:when test="${SESSION_LOCALE=='en_US'}">    
								<h3 class="title">${dgag.ggbt_en}</h3>
								<div class="txt-main">${dgag.ggny_en}
							   	</div>
			   				</c:when>
			   				<c:when test="${SESSION_LOCALE=='zn_CN'}">    
								<h3 class="title">${dgag.ggbt}</h3>
								<div class="txt-main">${dgag.ggny}
							   	</div>
			   				</c:when>  
							<c:otherwise>
								<h3 class="title">${dgag.ggbt}</h3>
								<div class="txt-main">${dgag.ggny}
						   	</div>
			   				</c:otherwise> 
			   				</c:choose>
						</div>
						   			<p class="z-tr"><c:if test="${dgag.bz!=''}">${dgag.bz}</c:if><c:if test="${dgag.bz==''}"><s:text name='viewjflc.jsp.jflc.jsp.951004942'/> <s:text name='platform'/></c:if></p>
									<p class="z-tr" ><fmt:formatDate value="${dgag.ggdate}" pattern="yyyy/MM/dd aa HH:mm"/></p>
									<p class="z-tc"><a href="javascript:history.go(-1);"><s:text name='viewzhgl-notice.jsp.zhgl-notice.jsp.1118943080'/></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
