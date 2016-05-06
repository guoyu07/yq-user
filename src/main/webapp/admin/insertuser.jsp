<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('被挂载用户不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('被替代的用户左边不存在用户，请执行正常挂载流程！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('被替代的用户右边不存在用户，请执行正常挂载流程！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('只能填写z或者y,当前填的为！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('插入用户不存在，请先注册新用户！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('用户已开户，不能执行替换操作！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('替换成功！');history.go(-1);</script></c:if>
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
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5" onload="init()">
<div align="center">
  <table border="0" cellspacing="1" width="100%" height="184">
    <tr align="center">
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>插入用户位置</strong></font>
      <form name="form1" method="POST" action="/admin/insertuser?status=1">
挂载用户名:<input type="text" name="user" size="20" value="${user}" />
挂载的位置：<select name="pos">
         <option value="z" selected>左</option>
          <option value="y">右</option>
 </select>
被挂载用户名：<input type="text" name="insertUser" size="20" value="${insertUser}" />
单数：<select name="sjb">
         <option value="1" selected>1</option>
         <option value="2" selected>2</option>
         <option value="10" selected>10</option>
         <option value="20" selected>20</option>
         <option value="40" selected>40</option>
         <option value="100" selected>100</option>
 </select>
          <input type="submit" name="Submit" value="确定"></form>
      </td>
  </tr> 
  </table>
</div> 
</body> 
</html>
