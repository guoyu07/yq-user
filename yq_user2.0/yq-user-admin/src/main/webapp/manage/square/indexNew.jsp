<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<title>home</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/easySlider1.5.js"></script>
		<script type="text/javascript" charset="utf-8">
	
</script>
		<style type="text/css">
#slider {
	margin: 0;
	padding: 0;
	list-style: none;
}

#slider ul,#slider li {
	margin: 0;
	padding: 0;
	list-style: none;
}

/* 
    define width and height of list item (slide)
    entire slider area will adjust according to the parameters provided here
*/
#slider li {
	width: 100%;
	overflow: hidden;
}

p#controls {
	margin: 0;
	position: relative;
}
</style>
	</head>
	<body>
		<div class="main">
			<div class="slider">
				<div id="slider">
					<ul>
						<li>
							<!-- li活动-->
							<img src="&{imgName}" alt="" width="100%" />
							<div class="bot">
								&{content}
							</div>
				</div>

			</div>
	</body>
</html>
