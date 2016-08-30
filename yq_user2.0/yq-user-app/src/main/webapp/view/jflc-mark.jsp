<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="content z-l">
				<div class="content-box">
					<div class="content-title">
						<span><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.-1151358946'/></span>
					</div>
					<div class="content-txt">
						
				<table border="0" cellspacing="0" width="100%" cellpadding="0" height="80">
				    <tr>
				      <td height="25">
				      	<p style="font-size:16px;" class="z-tc"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.1460814497'/> <span class="c-r">${fcxt.jygj}</span></p>
				      </td> 
				    </tr>
				   <tr>
				    <td width="100%" height="80">
					<div align="center">
						<table border="0" width="100%" id="table1" bgcolor="#383838" bordercolor="#000000" height="60">
							<tbody>
							<tr class="mc shop2">
								<td rowspan="2" bgcolor="#FFFFFF">
								<a class="a-mrmc" href="/mcsl">
								<c:choose>  
								<c:when test="${SESSION_LOCALE=='en_US'}">    
								<img src="/images/mc_<s:text name='#SESSION_LOCALE'/>.png" />
				   				</c:when>
								<c:otherwise>
									<img src="images/mc.png" />   
				   				</c:otherwise> 
				   				</c:choose>
								</a></td>
								<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.24334879'/></td>
								<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.26588703'/></td>
								<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.25989225'/></td>
								<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.938311'/></td>
								<td><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.625926272'/></td>
								<td rowspan="2" bgcolor="#FFFFFF">
								<a class="a-mrmc" href="/mysl">
								<c:choose>  
								<c:when test="${SESSION_LOCALE=='en_US'}">    
								<img src="/images/mr_<s:text name='#SESSION_LOCALE'/>.png" />
				   				</c:when>
								<c:otherwise>
									<img src="images/mr.png" />   
				   				</c:otherwise> 
				   				</c:choose>
								</a></td>
							</tr>
							<tr class="jg shop2">
								<td>${fcxt.zdj}</td>
								<td><fmt:formatNumber type="number" value="${fcxt.zgj+0.03}" maxFractionDigits="2"/></td>
								<td>${fcxt.zdj}</td>
								<td>${fcxt.jygj}</td>
								<td><fmt:formatNumber type="number" value="${fcxt.zgj+0.03}" maxFractionDigits="2"/>/${fcxt.zdj}</td>
							</tr>
						</tbody>
				   </table>
					</div>
						<p class="z-tc"><font size="2"><span style="color: #F00"><s:text name='viewjflc-mark.jsp.jflc-mark.jsp.1370943275'/>。</font>
						<table border="0" width="100%" class="xgrd" id="tablek" cellpadding="2">
							<tr valign="top">
								<td align="center">
									<iframe name="I1"  width="100%" height="320" align="center" border="0" frameborder="0" src="gpjymc" scrolling="yes" ></iframe>
								</td>

								<td align="center">
									<iframe name="I2"  width="100%" height="320" align="center" border="0" frameborder="0" src="gpjymy" scrolling="yes" ></iframe>
								</td>
							</tr>
						</table>
						</p>
					</td>
				</tr> 
			</tbody>
			</table>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		 $("#table2 tr:odd, #table3 tr:odd").css("background","#bcbcbc");
	</script>
</body>
</html>
