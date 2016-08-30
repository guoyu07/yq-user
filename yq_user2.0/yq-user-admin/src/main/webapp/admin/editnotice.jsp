<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('标题不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('内容不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('时间不能为空！');history.go(-1);</script></c:if>
<html><head><title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../images/css.css" rel="stylesheet" type="text/css">
<style>
<!--
p{color:000000;FONT-FAMILY: "??"; font-size: 9pt ;line-height: 20px;}
p{color:000000;FONT-FAMILY: "宋体"; font-size: 9pt ;line-height: 18px;}
-->
</style>
</head>
<body bgcolor="#E8F1FF" topmargin="5" leftmargin="5">

<div align="center">
<form name="form1" METHOD="POST" action="/admin/editnotice?noticeId=${dgag.id}&status=1">
    <div align="center">
      <center>
    　<table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="4" background="images/admin_bg_1.gif"> 
          <b><span style="font-size: 11pt">修改公告</span></b></td>
      </tr>
      <tr> 
        <td align="right" width="20%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font size="4">公告编号：</font></b></td>
        <td width="100%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <font color="#FF0000" size="3">　${dgag.id}</font></td>
      </tr>
      <tr> 
        <td align="right" width="20%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font size="2">公告标题：</font></b></td>
        <td width="40%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
         <textarea rows="1" name="title" cols="110">${dgag.ggbt}</textarea>
         <td align="left" width="30%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font size="2">notice title：</font></b></td>
        <td width="40%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
         <textarea rows="1" name="title_en" cols="110">${dgag.ggbt_en}</textarea>
      </tr>
      <tr> 
        <td align="right" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font size="2">日期：</font></b></td>
        <td width="89%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input type="text" name="ggdate" size="20" value="${dgag.ggdate}"></td>
      </tr>
      <tr> 
        <td align="right" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font size="2">公告内容：</font></b></td>
        <td width="40%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <textarea rows="30" name="content" cols="110">${dgag.ggny}</textarea></td>
           <td align="right" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <b><font size="2">notice content：</font></b></td>
        <td width="40%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <textarea rows="30" name="content_en" cols="110">${dgag.ggny_en}</textarea></td>
      </tr>
      <tr> 
        <td align="center" colspan="4" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"> 
          <div align="center"> 
            <input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="修改公告" class="lkbtn">&nbsp; </font> </div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</form>
</div>
</body>
</html>