<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>会员中心</title>
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/select.css" />
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
	<script src="/scripts/area.js"></script>
	<script src="/scripts/select2.js"></script>
	<script src="/scripts/select2_locale_zh-CN.js"></script>
	<script language="javascript" src="/js/ajax.js"></script>
<script language="JavaScript">
</script>
</head>
<body>
	<div class="mainbox denglu">
		<div class="d-founduser">
				<s:iterator var="data" value="listTemp">
					<div class="navt2">
						<ul class="navt2t">
							<li class="lh">小VIP:</li>
							<li class="lh">${data.downVip}</li>
						</ul>
					</div>
				</s:iterator>
				
				
				<%-- <form name="Form" method="post" action="cancelOrder?verify=0&payid=${data.payid}&user=${data.payusername}&page=${toPage}&uid=${uid}&uname=${uname}&riqi=${riqi}">
					<div class="fbox founbox1">
						<p><label>原因：</label><input type="text" name="resion" width="600px" height="400px" ><input type="submit" class="jc" value="提交"/></p>
					</div>
				</form> --%>
		</div>
	</div>
</body>
</html>