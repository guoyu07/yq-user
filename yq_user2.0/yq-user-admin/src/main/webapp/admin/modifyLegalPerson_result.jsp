<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<div align="center">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<c:choose>
					<c:when test="${erroCodeNum==4004}"><p align="center">${uid}<font color="#FF0000">玩家不存在</font></p></c:when>
					<c:when test="${erroCodeNum==4005}"><p align="center">${faren}<font color="#FF0000">法人不存在</font></p></c:when>
					<c:when test="${erroCodeNum==4006}"><p align="center">${faren}<font color="#FF0000">法人手机号不存在，请添加!</font></p></c:when>
					<c:otherwise><p align="center">${uid}<font color="#FF0000">修改成功</font></p></c:otherwise>
			</c:choose>
			<p align="center">修改后法人为：<b><font color="#FF0000">${userp.faren}</font></b></p>
			</td>
		</tr>
	</table>
<p align="center"><b><a href="modifylegalperson?uid=${uid}" style="text-decoration: none">返回</a></b></div>