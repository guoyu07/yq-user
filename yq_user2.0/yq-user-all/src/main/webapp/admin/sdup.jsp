<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<form method="POST" name="form" action="mlt?my=${my}" target="_top">
	<div align="center">
		<table border="0" width="40%" id="table1" cellspacing="3" cellpadding="2" height="88">
			<tr>
				<td align="right" width="197"><b>当前要报单的人：</b></td>
				<td align="left"><b><font color="#008000">${my}</font></b></td>
			</tr>
			<tr>
				<td align="right" width="197"><font color="#008000"><b>手动写入推荐人：</b></font></td>
				<td align="left"><input type="text" name="up" size="15"></td>
			</tr>
		</table>
	</div>
	<p align="center"><input type="submit" value="提交" name="B1"onClick="return confirm('提示：您确定收到了吗？')" onclick=disabled=true ></p>
</form>