<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('大vip才能使用这个功能！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('被充值用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('被充值用户必须是小vip！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('充值用户必须是您团队下的！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('充值币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('备用报单币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('被充值用户的一币不足！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('二级密码不正确');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				<%@ include file="/view/user.jsp" %>
				<%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>充值50000报单币</span>
					</div>
					<div class="content-form">
					   <p>当前充值币:${czgcuser.vipcjcjb},当前备用报单币:${czgcuser.syep}</p>
					   <p>本次操作需要消耗当前用户5000充值币，22200备用报单币及被充值用户22800一币，，</p>
						<form class="form form4 h463" method="POST" name="Form"  action="bdbcz?status=1">
						    <p><label>被充值用户：</label><input type="text" name="touser" size="20"></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><input type="password" name="pa3" size="20"></p>
							<p><label></label><button class="but1" type="submit" onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')"><s:text name='charge'/></button></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
