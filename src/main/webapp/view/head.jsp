<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<script src="/scripts/jquery.js"></script>
	<script src="/scripts/common.js"></script>
<div class="header">
	<div class="logo"><a href="#"><img src="/images/logo.jpg" /></a></div>
	<div class="nav">
		<ul>
			<li><a href="/manager">首页</a></li>
			<li><a href="#">财富中心</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/vipgo">积分理财</a>
					<a href="/login2j?inputUrl=login3j.jsp">一币理财</a>
					<a href="/bdbdate">业绩查询</a>
					<a href="/datepay">账户概览</a>
					<a href="#" class="close">财富中心</a>
				</div>
			</li>
			<li><a href="#">账户管理</a>
				<div class="ej">
					<span class="close"></span>
					<a href="/tjz">同名帐户管理</a>
					<a href="/regTheSame">添加同名帐户</a>
					<a href="/tgdown">我的客户</a>
					<a href="/tgurl">个人信息</a>
					<a href="#" class="close">帐户管理</a>
				</div>
			</li>
			<li><a href="/vipup">客服中心</a></li>
		</ul>
	</div>
</div>