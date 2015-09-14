<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/select.css" />
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
	<script src="/scripts/area.js"></script>
	<script src="/scripts/location.js"></script>
	<script src="/scripts/select2.js"></script>
	<script src="/scripts/select2_locale_zh-CN.js"></script>
</head>
<body>
	<div class="mainbox denglu">
     <%@ include file="/top.jsp"%>
		<div class="d-founduser">
				<div class="navt2">
					<ul>
						<li><b class="lh">1</b></li>
						<li><span></span></li>
						<li><b>2</b></li>
						<li><span></span></li>
						<li><b>3</b></li>
						<li><span></span></li>
						<li><b>4</b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh">创建账户　　</li>
						<li>设置身份信息</li>
						<li>设置收款方式</li>
						<li>　　成功</li>
					</ul>
				</div>

				<form>
					<div class="fbox founbox1">
						<p><label>用户名：</label><input type="text"><span class="jc">检 测</span></p>
						<p><label>一级密码：</label><input type="password"></p>
						<p><label>确认一级密码：</label><input type="password"></p>
						<p><label>二级密码：</label><input type="password"></p>
						<p class="tyxy"><input type="checkbox" checked="checked">同意<a href="#">《积分游戏平台用户使用协议》</a></p>
						<p class="z-tc"><a class="newbut" href="#">下一步</a></p>
					</div>
				 </form>
		</div>
	</div>
</body>
</html>