<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('报单人不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('报单人已安置好，不能重复，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('上级不存在，请检查输入是否正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('报单人还没有登记双轨系统，没办法补选，请检查输入是否正确！');history.go(-1);</script></c:if>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<div align="center">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>现在操作的是给 <font color="#FF0000">${pm.myid}</font> 报单&nbsp; 一定要从左到右选择空位</b></p>
	<table border="0" width="90%" id="table1" height="199" cellspacing="5" cellpadding="3">
		<tr>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
			<td bgcolor="#DFDFDF" colspan="2" align="center" height="43"><b>${pm.myup}</b></td>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
			<td align="center" height="45">　</td>
		</tr>
		<tr>
			<td align="center" height="40">　</td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="41"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rsauid}"><a href="mlt?up=${pm.rsauid}&my=${pm.myid}" style="text-decoration: none">${pm.rsauid}</a></c:if>
			<c:if test="${empty pm.rsauid}"><a href="sgreg?up=${pm.myup}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" colspan="2"><b><font color="#FF0000" style="font-size: 11pt">记得从左到右选择</font></b></td>
			<td bgcolor="#B5FFFF" colspan="2" align="center" height="41"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rsbuid}"><a href="mlt?up=${pm.rsbuid}&my=${pm.myid}" style="text-decoration: none">${pm.rsbuid}</a></c:if>
			<c:if test="${empty pm.rsbuid}"><a href="sgreg?up=${pm.myup}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45">　</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs21auid}"><a href="mlt?up=${pm.rs21auid}&my=${pm.myid}" style="text-decoration: none">${pm.rs21auid}</a></c:if>
			<c:if test="${empty pm.rs21auid}"><a href="sgreg?up=${pm.rsauid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs21buid}"><a href="mlt?up=${pm.rs21buid}&my=${pm.myid}" style="text-decoration: none">${pm.rs21buid}</a></c:if>
			<c:if test="${empty pm.rs21buid}"><a href="sgreg?up=${pm.rsauid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs22auid}"><a href="mlt?up=${pm.rs22auid}&my=${pm.myid}" style="text-decoration: none">${pm.rs22auid}</a></c:if>
			<c:if test="${empty pm.rs22auid}"><a href="sgreg?up=${pm.rsbuid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td bgcolor="#FFFFA4" colspan="2" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			
			<c:if test="${not empty pm.rs22buid}"><a href="mlt?up=${pm.rs22buid}&my=${pm.myid}" style="text-decoration: none">${pm.rs22buid}</a></c:if>
			<c:if test="${empty pm.rs22buid}"><a href="sgreg?up=${pm.rsbuid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
		</tr>
		<tr>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			
			<c:if test="${not empty pm.rs31auid}"><a href="mlt?up=${pm.rs31auid}&my=${pm.myid}" style="text-decoration: none">${pm.rs31auid}</a></c:if>
			<c:if test="${empty pm.rs31auid}"><a href="sgreg?up=${pm.rs21auid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			
			<c:if test="${not empty pm.rs31buid}"><a href="mlt?up=${pm.rs31buid}&my=${pm.myid}" style="text-decoration: none">${pm.rs31buid}</a></c:if>
			<c:if test="${empty pm.rs31buid}"><a href="sgreg?up=${pm.rs21auid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs32auid}"><a href="mlt?up=${pm.rs32auid}&my=${pm.myid}" style="text-decoration: none">${pm.rs32auid}</a></c:if>
			<c:if test="${empty pm.rs32auid}"><a href="sgreg?up=${pm.rs21buid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs32buid}"><a href="mlt?up=${pm.rs32buid}&my=${pm.myid}" style="text-decoration: none">${pm.rs32buid}</a></c:if>
			<c:if test="${empty pm.rs32buid}"><a href="sgreg?up=${pm.rs21buid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs33auid}"><a href="mlt?up=${pm.rs33auid}&my=${pm.myid}" style="text-decoration: none">${pm.rs33auid}</a></c:if>
			<c:if test="${empty pm.rs33auid}"><a href="sgreg?up=${pm.rs22auid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs33buid}"><a href="mlt?up=${pm.rs33buid}&my=${pm.myid}" style="text-decoration: none">${pm.rs33buid}</a></c:if>
			<c:if test="${empty pm.rs33buid}"><a href="sgreg?up=${pm.rs22auid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs34auid}"><a href="mlt?up=${pm.rs34auid}&my=${pm.myid}" style="text-decoration: none">${pm.rs34auid}</a></c:if>
			<c:if test="${empty pm.rs34auid}"><a href="sgreg?up=${pm.rs22buid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
			<td align="center" height="45" bgcolor="#FFCECE"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
			<c:if test="${not empty pm.rs34buid}"><a href="mlt?up=${pm.rs34buid}&my=${pm.myid}" style="text-decoration: none">${pm.rs34buid}</a></c:if>
			<c:if test="${empty pm.rs34buid}"><a href="sgreg?up=${pm.rs22buid}&my=${pm.myid}" style="text-decoration: none">选择空位</a></c:if>
			</td>
		</tr>
	</table>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><form method="POST" name="form" action="mlt?my=${pm.myid}">
	<div align="center">
		<table border="0" width="40%" id="table1" cellspacing="3" cellpadding="2" height="88">
			<tr>
				<td align="right" width="197"><b>当前要报单的人：</b></td>
				<td align="left"><b><font color="#008000">${pm.myid}</font></b></td>
			</tr>
			<tr>
				<td align="right" width="197"><font color="#008000"><b>手动写入推荐人：</b></font></td>
				<td align="left"><input type="text" name="up" size="15"></td>
			</tr>
		</table>
	</div>
	<p align="center"><input type="submit" value="提交" name="B1"onClick="return confirm('提示：您确定收到了吗？')" onclick=disabled=true ></p>
</form></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</div>
