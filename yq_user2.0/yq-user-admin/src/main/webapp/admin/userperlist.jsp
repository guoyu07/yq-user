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
                <td>2016小区业绩</td>
                <td>2016直推业绩</td>
                <td>可获得奖励</td>
                <td>操作</td>
              </tr>
             <s:iterator var="data" value="listTemp">
              <tr> 
                <td width="350" align="center" height="23">${data.userName}</td>
                <c:if test="${data.allTimeLeftPerformance>=data.allTimeRightPerformance}"><c:set var="xq" value="${data.allTimeRightPerformance}"></c:set></c:if>
                <c:if test="${data.allTimeLeftPerformance<data.allTimeRightPerformance}"><c:set var="xq" value="${data.allTimeLeftPerformance}"></c:set></c:if>
                <td>${xq}单=${xq*500}万</td>
                <td>${data.sigleTimeTheSameuserAllPerformance}单=${data.sigleTimeTheSameuserAllPerformance*500}万</td>
                <td>
                   <c:if test="${data.step==0}">海外游</c:if>  
                    <c:if test="${data.step==1}"><font color='blue'>蒙迪欧</font></c:if>
                     <c:if test="${data.step==2}"><font color='red'>探险者</font></c:if>  
                      <c:if test="${data.step==3}"><font color='yellow'>保时捷</font></c:if>  
                       <c:if test="${data.step==4}"><font color='green'>小洋房</font></c:if>  
                </td>
                <td><a target="_blank" href="/admin/userper?user=${data.userName}&startTime=2016-01-01&endTime=2016-12-31&status=1">业绩详情</a></td>
              </tr>
             </s:iterator>
            </table>

</div> 
</body> 
</html>
