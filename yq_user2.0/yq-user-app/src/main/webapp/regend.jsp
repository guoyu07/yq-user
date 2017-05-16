<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-931208490'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-109709084'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='regend.jsp.regend.jsp.-514900618'/>]！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-834832388'/>！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='regend.jsp.regend.jsp.-1815722160'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-889663866'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='reg.jsp.reg.jsp.-1989997891'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='notinternationalareacode'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='emptyinternationalareacode'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='Overseasnotchina'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==777}"><script language=javascript>alert('<s:text name='commonglober_error.jsp.glober_error.jsp.-2017014779'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common${SESSION_LOCALE}.css" />
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
						<li><span class="spanl"></span></li>
						<li><b class="lh">2</b></li>
						<li><span class="spanl"></span></li>
						<li><b class="lh">3</b></li>
						<li><span class="spanl"></span></li>
						<li class="gsd"><b class="lh"><strong></strong></b></li>
					</ul>
					<ul class="navt2t">
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.650688080'/>　　</li>
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.-1147457200'/></li>
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.-1456505170'/></li>
						<li class="lh"><s:text name='reg1.jsp.reg1.jsp.799375'/></li>
					</ul>
				</div>

				<form>
					<div class="fbox founbox4">
						<p><s:text name='regend.jsp.regend.jsp.-1988253410'/></p>
						<p><s:text name='regend.jsp.regend.jsp.710394074'/></p>
						<p class="z-tc"><a class="newbut" href="/index.jsp"><s:text name='login'/></a></p>
					</div>
					
				 </form>
		</div>
	</div>
</body>
</html>
