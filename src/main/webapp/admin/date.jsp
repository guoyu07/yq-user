<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>

<title>统计全部数据</title>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>交易数据</b></p>
<p align="left" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>当前总发行量：<font color="#008000">${bean.rs.fsjygsl}</font> 总成交量：<font color="#0000FF">${bean.rs.jygsl}</font> 剩余：<font color="#FF0000">${bean.rs.syjygsl}</font></b></p>
<table border="1" width="100%" id="table1" style="border-collapse: collapse" height="78">
	<tr>
		<td align="center" height="25" bgcolor="#ECECFF" width="1316" colspan="8"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>系统</b></font></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#ECECFF" width="140"><font size="2">全部</font></td>
		<td align="center" bgcolor="#ECECFF" width="158"><font size="2">奖金</font></td>
		<td align="center" bgcolor="#ECECFF" width="91"><font size="2">已提</font></td>
		<td align="center" bgcolor="#ECECFF" width="89"><font size="2">实提</font></td>
		<td align="center" bgcolor="#ECECFF" width="93"><font size="2">金币</font></td>
		<td align="center" bgcolor="#ECECFF" width="177"><font size="2">积分</font></td>
		<td align="center" bgcolor="#ECECFF" width="88"><font size="2">分红股</font></td>
		<td align="center" bgcolor="#ECECFF" width="110"><font size="2">总分红</font></td>
	</tr>
	<tr>
		<td align="center" height="28" bgcolor="#ECECFF" width="140"><b><font color="#008000" size="2">${bean.rs_cb}</font></b></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="158"><font size="2">${bean.rs_pa}-${bean.rs_pal}</font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="91"><font color="#800000" size="2">${bean.rs_tx}</font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="89"><font size="2">${bean.rs_ztx}</font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="93"><font size="2">${bean.rs_db}</font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="177"><font size="2">${bean.rs_xt}-${bean.rs_xtl}</font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="88"><font size="2">${bean.rs_fhg}-${bean.rs_fhgl}</font></td>
		<td align="center" height="28" bgcolor="#ECECFF" width="110"><font size="2">${bean.rs_zfh}</font></td>
	</tr>
</table>
<table border="1" width="100%" id="table2" style="border-collapse: collapse" height="78">
	<tr>
		<td align="center" colspan="2" height="25" bgcolor="#C8FFC8" width="313"><b><font size="2">累计</font></b></td>
		<td align="center" colspan="2" height="25" bgcolor="#FFEEFF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">今天</font></b></td>
		<td align="center" colspan="2" height="25" bgcolor="#BFE6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">昨天</font></b></td>
		<td align="center" colspan="2" height="25" bgcolor="#FFFFDD"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">前天</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#C8FFC8" width="95"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#C8FFC8" width="171"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
		<td align="center" bgcolor="#FFEEFF" width="169"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#FFEEFF" width="167"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
		<td align="center" bgcolor="#BFE6FF" width="175"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#BFE6FF" width="173"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
		<td align="center" bgcolor="#FFFFDD" width="152"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">卖出</font></b></td>
		<td align="center" bgcolor="#FFFFDD" width="152"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font size="2">买入</font></b></td>
	</tr>
	<tr>
		<td align="center" height="28" bgcolor="#C8FFC8" width="95"><b><font size="2">${bean.rslj1}</font></b></td>
		<td align="center" height="28" bgcolor="#C8FFC8" width="171"><b><font size="2">${bean.rslj2}</font></b></td>
		<td align="center" height="28" bgcolor="#FFEEFF" width="169"><font color="#0000FF" size="2"><b>${bean.rsjt1}</b></font></td>
		<td align="center" height="28" bgcolor="#FFEEFF" width="167"><font color="#0000FF" size="2"><b>${bean.rsjt2}</b></font></td>
		<td align="center" height="28" bgcolor="#BFE6FF" width="175"><font color="#FF0000" size="2"><b>${bean.rszt1}</b></font></td>
		<td align="center" height="28" bgcolor="#BFE6FF" width="173"><font color="#FF0000" size="2"><b>${bean.rszt2}</b></font></td>
		<td align="center" height="28" bgcolor="#FFFFDD" width="152"><font color="#008000" size="2"><b>${bean.rsct1}</b></font></td>
		<td align="center" height="28" bgcolor="#FFFFDD" width="152"><font color="#008000" size="2"><b>${bean.rsct2}</b></font></td>
	</tr>
</table>
<form method="POST" name="form" target="I1" action="gpjy.asp"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<font color="#008000"><b>交易明细</b></font>&nbsp; 搜索：<select size="1" name="jylb">
<option selected value="0">==请选择交易类别==</option>
<option value="username">发布方</option>
<option value="dfuser">对方</option>
</select> <input type="text" name="userid" size="15">&nbsp;<input type="submit" value="提交搜索" name="B1"></p>
</form>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><iframe name="I1" marginwidth="1" marginheight="1" height="100%" width="100%" align="center" src="gpjysc"></iframe></p>