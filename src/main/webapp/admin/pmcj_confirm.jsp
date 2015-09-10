<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
 <head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<p align="center">　</p>
<p align="center"><font face="黑体" size="6" color="#FF0000">请再次确认</font></p>
<div align="center">
	<p align="center">　</p>
	<table border="0" width="26%" id="table1" cellspacing="1" height="196">
		<tr>
			<td align="right" width="145"><font face="黑体" size="5">收到会员：</font></td>
			<td align="left"><font face="黑体" size="5"><font color="#800000">${id}</font> </font>
			</td>
		</tr>
		<tr>
			<td align="right" width="145"><font face="黑体" size="5">充值款：</font></td>
			<td align="left"><font color="#0000FF" face="黑体" size="5">${cjpay}</font></td>
		</tr>
		<tr>
			<td align="right" width="145" height="45"><font face="黑体" size="5">操作员：</font></td>
			<td align="left" height="45"><font color="#008000" face="黑体" size="5">${czy}</font></td>
		</tr>
	</table>
</div>
<p align="center">　</p>
<p align="center"><a onClick="return confirm('提示：您确定收到 ${cjpay} 元了吗？')" href="/admin/pmcj?czy=${czy}&cjpay=${cjpay}&id=${id}&status=2"><input type="button" value="确认无误" name="B1" onclick=disabled=true style="font-size: 24pt; color: #0000FF; font-weight: bold"></a></p>
<p align="center">　</p>
<p align="center"> 
              <a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-weight: 700" size="4">
				返回上一页</font></a></p>
<p align="center">　</p>
