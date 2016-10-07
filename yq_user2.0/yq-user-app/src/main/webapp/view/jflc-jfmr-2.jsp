<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='vipvipjzpay.jsp.vipjzpay.jsp.2022589602'/>！');history.go(-1);</script></c:if>
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
				
				<%@ include file="/view/user.jsp"%>

				 <%@ include file="/view/jflc.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1817661566'/></span>
					</div>
					<div class="content-form new1-top">
						<h4><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1339986491'/></h4>
						<p><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.1002343016'/>：<strong>${jygj}</strong></p>
						<p><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.-610522836'/></p>
						<p><button class="but1 but2" onClick="bitch()"><s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.-380021763'/></button></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
    function bitch(){
    	if(confirm("<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？")){
    		location.href="/mysl?status=2&txpay=${txpay}";
    	}
    }
</script>
