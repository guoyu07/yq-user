<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${isHaveTxPayBuy==true}"><script language=javascript>alert('<s:text name='viewindex2.jsp.index2.jsp.1200989498'/>！');location.replace('epmyjl');</script></c:if>
<c:if test="${isHaveTxPaySale==true}"><script language=javascript>alert('<s:text name='viewindex2.jsp.index2.jsp.545255763'/>！');location.replace('epmcjl');</script></c:if>
<c:if test="${dq=='0' or dq=='2' or dq=='7' or dq=='8'}">
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.642434221'/>QQ：613697151"></c:set>
<c:set var="qq" value="613697151"></c:set>
<c:set var="cz02" value="<s:text name='viewindex2.jsp.index2.jsp.37800384'/>"></c:set>
</c:if>
<c:if test="${dq=='1' or dq=='3' or dq=='4' or dq=='5' or dq=='6'}">
<c:set var="cz01" value="<s:text name='viewindex2.jsp.index2.jsp.643357742'/>QQ：613697152"></c:set>
<c:set var="qq" value="613697152"></c:set>
<c:set var="cz02" value="<s:text name='viewindex2.jsp.index2.jsp.37800384'/>"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
	<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/zhgl.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title" >
						<span><s:text name='viewindex2.jsp.index2.jsp.667742'/></span>
					</div>
					<div class="i-gg">
						<s:text name='viewindex2.jsp.index2.jsp.803273677'/>！
						<s:text name='viewindex2.jsp.index2.jsp.-1525283383'/><br /><br />
						<s:text name='viewindex2.jsp.index2.jsp.-628120199'/>
					</div>
				</div>
				<div class="content-boxindexnews mt10" style="height:391px;">
					<div class="content-title">
						<span><s:text name='viewindex2.jsp.index2.jsp.70014993'/></span>
					</div>
					<div class="new-list">
						<ul>
						<s:iterator var="data" value="dataList">
						<li>
						<a href="/ggck?ck=${data.id}" class="ck">
						<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
						<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">    
						<img src="/images/en_ck.png" />  
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zn_CN'}">    
						<img src="/images/en_ck.png" />  
		   				</c:when>  
						<c:otherwise>
							<img src="/images/ck.png" />    
		   				</c:otherwise> 
		   				</c:choose>
						</a>
						<c:choose>  
						<c:when test="${SESSION_LOCALE=='en_US'}">  
							<span><fmt:formatDate value="${data.ggdate}" type="date"/></span>
							<c:if test="${data.ggbt_en==null}">
								<p><a href="/ggck?ck=${data.id}">${data.ggbt}</a></p>
							</c:if>
							<p><a href="/ggck?ck=${data.id}">${data.ggbt_en}</a></p>
		   				</c:when>
		   				<c:when test="${SESSION_LOCALE=='zn_CN'}">   
		   					<span><fmt:formatDate value="${data.ggdate}" type="date"/></span>
							<c:if test="${data.ggbt==null}">
								<p><a href="/ggck?ck=${data.id}">${data.ggbt_en}</a></p>
							</c:if>
							<p><a href="/ggck?ck=${data.id}">${data.ggbt}</a></p>
		   				</c:when>  
						<c:otherwise>
							<span><fmt:formatDate value="${data.ggdate}" type="date"/></span>
							<p><a href="/ggck?ck=${data.id}">${data.ggbt}</a></p>
		   				</c:otherwise> 
		   				</c:choose>
						</li>
						</s:iterator>
						</ul>
						<p><aldtags:pageTag/></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="adleft" style="width:255px;height:538px;padding:0px;font:14px/20px arial;background-color:red; text-align:center;position:absolute;left:0;top:0px;background:url('/image/guanggao2.png') no-repeat;"><div style=";position:absolute; bottom:0;left:0; text-align:center;" onmouseover="this.style.cursor='pointer'"><img src="/image/huitiao2.png" onClick="closeadleft();" style="position:absolute;bottom:0" /></div></div>
<div id="adright" style="display:none;width:262px;height:363px;padding:0px;font:14px/20px arial;text-align:center;position:absolute;right:0; top:0px;background:url('/image/guanggao1.png') no-repeat;" onmouseover="this.style.cursor='pointer'" onclick="document.location='http://baoming.zgyce.com/baoming/bm/index';"><div style="position:absolute; bottom:0;left:0; text-align:center;" onClick="event.cancelBubble = true"><img src="/image/huitiao.png" style="position:absolute;bottom:0" onClick="closeadright();"/></div></div>
<script>
function closeadleft(){
	document.getElementById("adleft").style.display='none';
	return;
}
function closeadright(){
	document.getElementById("adright").style.display='none';
	return;
}
window.onload = function(){
 var adleft = document.getElementById("adleft");
 var adright = document.getElementById("adright");
 var adtop = adleft.offsetTop;
 window.onscroll = function(){
  adleft.style.top = adtop + (document.documentElement.scrollTop || document.body.scrollTop) +"px"; 
  adright.style.top = adtop + (document.documentElement.scrollTop || document.body.scrollTop) +"px"; 
 }
} 
</script>
</body>
</html>
