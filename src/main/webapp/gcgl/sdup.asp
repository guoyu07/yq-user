<!--#include file="../ct0618.asp"-->
<!--#include file="checkadmin.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<%
'��ʼ�ҿ�λ����myid
myid=request("my")
myup=request("up")
%><form method="POST" name="form" action="mlt2.asp?my=<%=myid%>" target="_top">
	<div align="center">
		<table border="0" width="40%" id="table1" cellspacing="3" cellpadding="2" height="88">
			<tr>
				<td align="right" width="197"><b>��ǰҪ�������ˣ�</b></td>
				<td align="left"><b><font color="#008000"><%=myid%></font></b></td>
			</tr>
			<tr>
				<td align="right" width="197"><font color="#008000"><b>�ֶ�д���Ƽ��ˣ�</b></font></td>
				<td align="left"><input type="text" name="up" size="15"></td>
			</tr>
		</table>
	</div>
	<p align="center"><input type="submit" value="�ύ" name="B1"onClick="return confirm('��ʾ����ȷ���յ�����')" onclick=disabled=true ></p>
</form>

