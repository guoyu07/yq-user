<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>显示用户信息</title>
<head>
		<style>
			#tip{
				width:200px;
				height:120px;
				background:#ccc;
				border:1px solid black;
				position:absolute;
				display:none;
			}
		</style>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<script src="/scripts/go.js"></script>
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
            <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" cellpadding="0" height="62">
            <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF">用户名</td>
                <td>小区业绩</td>
                <td>可获得奖励</td>
                <td>操作</td>
              </tr>
             <s:iterator var="data" value="listTemp">
               <c:if test="${data.sigleAllPerformance*500>=500000&&data.fu==1&&(data.allTimeLeftPerformance+data.allTimeRightPerformance)*500>=620000}">
              <tr> 
                <td width="350" align="center" height="23">${data.userName}</td>
                <c:if test="${data.zaq>=data.zbq}"><c:set var="xq" value="${data.zbq}"></c:set></c:if>
                <c:if test="${data.zaq<data.zbq}"><c:set var="xq" value="${data.zaq}"></c:set></c:if>
                <td>${xq}单=${xq*500}万</td>
                <td>
                   <c:if test="${xq*500>=5000000&&xq*500<10000000}">福特蒙迪欧小车一部</c:if>  
                   <c:if test="${xq*500>=10000000&&xq*500<18000000}">福特锐界一部</c:if>
                   <c:if test="${xq*500>=18000000&&xq*500<25000000}">福特探险者一部</c:if>
                   <c:if test="${xq*500>=25000000&&xq*500<120000000}">保时捷轿跑一部</c:if>
                   <c:if test="${xq*500>=120000000}">珠海独栋海景别墅一套</c:if>
                   <c:if test="${xq*500<5000000}">无</c:if> 
                </td>
                <td><a target="_blank" href="/admin/userper?user=${data.userName}&startTime=2015-01-01&endTime=2015-12-31&status=1">业绩详情</a></td>
              </tr>
              </c:if>
             </s:iterator>
            </table>

</div> 
</body> 
</html>
