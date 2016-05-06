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
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- 会员中心用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>积分交易市场</span>
					</div>
					<div class="content-txt">

<table border="0" cellspacing="0" width="100%" cellpadding="0" height="80">
    <tr>
      <td height="25">
      	<p style="font-size:16px;" class="z-tc c-b z-b">当前交易价是 <span class="c-r"><c:if test="${fcxt.jygj<1.0}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1.0}">${fcxt.jygj}</c:if></span></p>
      </td> 
    </tr>
   <tr>
    <td width="100%"  height="80">
	<div align="center">
		<table border="1" width="85%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tbody>
			<tr class="mc">
				<td rowspan="2" bgcolor="#FFFFFF"><a class="a-mrmc" href="/mcsl">发布卖出</a></td>
				<td>开盘价</td>
				<td>最高价</td>
				<td>最低价</td>
				<td>现价</td>
				<td>交易范围</td>
				<td rowspan="2" bgcolor="#FFFFFF"><a class="a-mrmc" href="/mysl">发布买入</a></td>
			</tr>
			<tr class="jg">
				<td>${fcxt.zdj}</td>
				<td><c:if test="${fcxt.zgj+0.03<1.0}">0${fcxt.zgj+0.03}</c:if><c:if test="${fcxt.zgj+0.03>=1.0}">${fcxt.zgj+0.03}</c:if></td>
				<td>0${fcxt.zdj}</td>
				<td><c:if test="${fcxt.jygj<1}">0${fcxt.jygj}</c:if><c:if test="${fcxt.jygj>=1}">${fcxt.jygj}</c:if></td>
				<td><c:if test="${fcxt.zgj+0.03<1.0}">0${fcxt.zgj+0.03}</c:if><c:if test="${fcxt.zgj+0.03>=1.0}">${fcxt.zgj+0.03}</c:if>/0 ${fcxt.zdj}</td>
			</tr>
		</tbody></table>
	</div>
		<p class="z-tc"><font size="2">友情提醒：根据市场情况，电子积分单价会稳步上涨，到一定时候拆分。</font>
		<table border="1" width="100%" id="table2" cellpadding="2">
			<tr>
				<td align="center">
					<iframe name="I1" marginwidth="1" marginheight="1" width="100%" height="768" align="center" border="0" frameborder="0" src="gpjymc" scrolling="no" ></iframe>
				</td>
				<td align="center">
					<iframe name="I2" marginwidth="1" marginheight="1" width="100%" height="768" align="center" border="0" frameborder="0" src="gpjymy" scrolling="no" ></iframe>
				</td>
			</tr>
		</table>
</p></td></tr> 
</tbody></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>