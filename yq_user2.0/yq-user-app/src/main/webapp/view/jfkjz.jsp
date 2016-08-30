<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body background="images/top_bg55.png">
<div align="center">
	<table border="0" width="82%" id="table1" height="669" background="images/tzbj02.jpg" cellspacing="1">
		<tr>
			<td>

            <p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center"><font style="font-size: 30pt; font-weight: 700" color="#FFFF00"><s:text name='vipepkjz.jsp.epkjz.jsp.641105758'/>！</font></p>
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center"><font color="#FF0000" ><span style="font-size: 110pt; font-weight:700"><span id="sec" style="color:red"></span></span></font></p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p align="center">
　</p>
			<p>　</td>
		</tr>
	</table>
</div>
<script>
var secs = 60;  //6为倒计时秒数
for(i=0;i<=secs;i++) {
   window.setTimeout("update(" + i + ")", i * 1000);
}

function update(num) {
if(num == secs) {
   window.location="jfjqks";  //2.htm为到时跳转的页面URL
}
else {
 printnr = secs-num;
 document.getElementById('sec').innerHTML = printnr;
}
}
</script>
