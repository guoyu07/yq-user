<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('操作密码不正确！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('任务已处理完毕！');location.href='buyjf';</script></c:if>
<title>管理员设置</title>
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
<c:if test="${erroCodeNum==0}">
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.num.value=="") {      alert("请填入要买入的笔数!");      return false;    } 
  if (Form.oppa.value=="") {      alert("请填入操作密码!");      return false;    } 
  return true;  }  
 </script>
<form METHOD="POST" action="buyjf?status=1" onSubmit="return checkdate();" name="Form" id="Form">
    <div align="center">
      <center>
    <table border="1" width="100%" cellpadding="4" class=lowcolor cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" height="123">
       <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">要买入的笔数：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="text" name="num" size="20" onKeyUp="value=value.replace(/[^\d]/g,'')"  value=""></td>
      </tr>
      <tr bgcolor="#ffffdd"> 
        <td align="right" width="41%" height="33" style="border-left: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0">操作密码：</td>
        <td width="57%" align="left" style="border-right: 1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF"><input type="password" name="oppa" size="20" value=""></td>
      </tr>
      <tr> 
      <td align="center" colspan="2" style="border-left:1px solid #C9D8AD; border-right:1px solid #C9D8AD; border-bottom:1px solid #C9D8AD; color:#0000000; font-family:宋体; font-size:9pt; line-height:18px" bgcolor="#D9E6FF" height="33"><div align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><input type="submit" name="submit" width="34" height="20" alt="提交" size="20" value="提交任务" class="lkbtn"></div>
        </td>
      </tr>
    </table>
      </center>
    </div>
    </form>
</c:if> 
<c:if test="${erroCodeNum==2001}">
当前有一个任务在执行－－－》总共需要买入数量为［${needNum}］,已处理数量为[${currentNum}]［<a href="buyjf?status=2">刷新结果</a>］<br />
</c:if>
</div>