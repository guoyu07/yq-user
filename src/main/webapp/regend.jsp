<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('此用户名已有人使用！请更换！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('没有这个推荐人账号，请重新写入!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('该姓名[${ggname}]及身份证号码[${gguserid}]已经被注册过，请您登录后在-[添加同名账户]！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('注意：您填写的身份证号码不合法或错误，请检查后再试！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('该姓名[${gguser}]及身份证号码[${gguserid}]禁止注册！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('所在地区不全！请重新选择！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('注册失败！数据异常');history.go(-1);</script></c:if>
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
	<script src="/scripts/location.js"></script>
	<script src="/scripts/select2.js"></script>
	<script src="/scripts/select2_locale_zh-CN.js"></script>
	<script language="javascript" src="/js/ajax.js"></script>

</head>
<body>
	<div class="mainbox denglu">
     <%@ include file="/top.jsp"%>
     <div class="d-founduser">
				<div class="navt2">
					<ul>
						<li><b class="lh">1</b></li>
						<li><span class="lh"></span></li>
						<li><b class="lh">2</b></li>
						<li><span class="lh"></span></li>
						<li><b class="lh">3</b></li>
						<li><span class="lh"></span></li>
						<li class="gsd"><b class="lh"><strong></strong></b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh">创建账户　　</li>
						<li class="lh">设置身份信息</li>
						<li class="lh">设置收款方式</li>
						<li class="lh">　　成功</li>
					</ul>
				</div>

				<form>
					<div class="fbox founbox4">
						<p>恭喜你成为一川会员，稍后自动跳转登录界面</p>
						<p>您的账号为：<span>${gguser}</span>  请牢记</p>
						<p class="z-tc"><a class="newbut" href="/index.jsp">登  录</a></p>
					</div>
					
				 </form>
		</div>
	</div>
</body>
</html>