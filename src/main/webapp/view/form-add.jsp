<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>中国一川（澳门）国际有限公司</title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- 头部 -->
		{{ include "head.html" }}

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				{{ include "user.html" }}

				<div class="system">
					<h3>积分理财</h3>
					<ul>
						<li>累计奖金一币：<span class="c-r">23975</span></li>
						<li>推广部分一币：<span class="c-z">0</span></li>
						<li>平衡部分一币：<span class="c-z">20</span></li>
						<li>辅导部分一币：<span class="c-z">210</span></li>
						<li>累计认购一币：<span class="c-g">210</span></li>
						<li>累计卖出一币：<span class="c-b">120</span></li>
						<li>剩余金币：<span class="c-z">1.20</span></li>
						<li>积分单价：<span class="c-r">20</span></li>
						<li>积分数量：<span class="c-g">0</span></li>
						<li>积分拆分次数：<span class="c-z">0</span></li>
						<li>积分拆分倍数：<span class="c-g">0</span></li>
			        </ul>
				</div>
			</div>
			<div class="z-l">
				<div class="content-box1" style="height:190px;">
					<div class="content-title">
						<span>添加同名用户</span>
					</div>
					<div class="content-form">
						 此处注册为当前登录账户快捷添加同姓名新用户使用，仅需要自定义一个新用户名，其它资料与当前登录账户相同！ 如您需要注册不同姓名的新用户请到   
					</div>
				</div>
				<div class="content-box2 mt10"  style="height:310px;">
					<form class="form form3">
							<p><label>用户名：</label><input type="text"></p>
							<p><label>一级密码：</label></p>
							<p><label>二级密码：</label></p>
							<p><label>姓名：</label></p>
							<p><label>推荐人：</label></p>
							<p><label>协议及声明：</label>
								<select>
									<option>==请选择是同意协议及声明==</option>
								</select>
								<a href="#" class="c-g xy-sm">查看协议及声明</a>
							</p>
							<p><label></label><button class="but1">提 交 注 册</button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>