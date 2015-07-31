<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
'开始找空位安置myid
myid=request("my")
myup=request("up")
%><form method="POST" name="form" action="mlt2.asp?my=<%=myid%>" target="_top">
	<div align="center">
		<table border="0" width="40%" id="table1" cellspacing="3" cellpadding="2" height="88">
			<tr>
				<td align="right" width="197"><b>当前要报单的人：</b></td>
				<td align="left"><b><font color="#008000"><%=myid%></font></b></td>
			</tr>
			<tr>
				<td align="right" width="197"><font color="#008000"><b>手动写入推荐人：</b></font></td>
				<td align="left"><input type="text" name="up" size="15"></td>
			</tr>
		</table>
	</div>
	<p align="center"><input type="submit" value="提交" name="B1"onClick="return confirm('提示：您确定收到了吗？')" onclick=disabled=true ></p>
</form>

