<!--#include file="../shopwe.asp"-->
<!--#include file="checkadmin.asp"-->
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
<span style="font-size: 9pt">

</body>
</html>
</span>
<div align="center">
<%regid=request("regid")
   set rs=server.createobject("adodb.recordset")
   sql="select * from gg where ID like '"&regid&"'"
   rs.open sql,conn,2,3
%><form name="form1" METHOD="POST" action="ggadsok.asp">
    <div align="center">
      <center>
    　<table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="359">
      <tr bgcolor="#ffffdd"> 
        <td align="center" width="100%" height="26" bgcolor="#FFFFFF" style="color: #0000000; font-family: 宋体; font-size: 9pt; line-height: 18px" colspan="2" background="images/admin_bg_1.gif"> 
          <b><span style="font-size: 11pt">添加公告</span></b></td>
      </tr>
      <tr> 
        <td align="right" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          公告标题：</td>
        <td width="89%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <input name="ggbt" size="115"></td>
      </tr>
      <tr> 
        <td align="right" width="10%" height="30" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          公告内容：</td>
        <td width="89%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"> 
          <textarea rows="25" name="ggny" cols="110"></textarea></td>
      </tr>
      <tr> 
        <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="22"> 
          <div align="center"> 
            <input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="添加公告" class="lkbtn"></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
</div>
</form>