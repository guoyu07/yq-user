<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
		<div class="d-header">
				<p class="dh-logo"><img src="/images/dlogo.jpg" title="<s:text name='reg1.jsp.reg1.jsp.624662580'/>" /></p>
				<p class="dh-title"><s:text name='top.jsp.top.jsp.-1925633782'/></p>
				<p class="dh-link"><a href="http://www.zgyce.com">[<span><s:text name='Company_official_website'/></span>]</a></p>
				<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
				<s:set name='url' value="<s:url/>"></s:set> 
				<c:if test="${url=='url'}">
				<p class="dh-links"><a href="I18N?request_locale=zh_CN"><s:text name='top.jsp.top.jsp.646394'/></a>|<a href="I18N?request_locale=en_US">English</a></p>
				</c:if>
				<c:if test="${url!='index.jsp'}"><p class="dh-links"><a href="I18N?request_locale=zh_CN"><s:text name='top.jsp.top.jsp.646394'/></a>|<a href="I18N?request_locale=en_US">English</a></p></c:if>
		</div> 
        <div class="d-nav">
			<ul>
				<li><a href="http://game.keyukeji.com/index/game/app_category.html?sid=1"><s:text name='QPYL'/></a></li>
				<li><a href="http://game.keyukeji.com/index/game/game_category.html?sid=1"><s:text name='JPYX'/></a></li>
				<li><a href="#" onclick="gt();" ><s:text name='YY'/></a></li>
				<li><a href="#" onclick="gt();" ><s:text name='DG'/></a></li>
				<li><a href="#" onclick="gt();" ><s:text name='QDHYW'/></a></li>
				<li><a href="http://www.qlsme.com"><s:text name='HAPPY100'/></a></li>
			</ul>
		</div>
		<p class="clickTop"><span class="hover"></span></p>
		<script type="text/javascript">
			/* function langSelecter_onChanged() {
				document.getElementById("langForm").submit();
			} */
			function gt(){
				alert(" <s:text name='gt'/>");
			}
			
		</script>
		<!-- "zhcn"), Locale.CHINA);
        locales.put(bundle.getString("usen" -->
