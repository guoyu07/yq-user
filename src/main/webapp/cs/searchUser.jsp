<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${back==1}">
</br>
</br>
</br>
</br>
</br>
</br>
<center>
  为了提高办事效率，您需要联系${rsq.cz01}</br>
 <a href=javascript:history.back();>返回搜索</a>
 </br>
</br>
</br>
</br>
</br>
</br>
<a href='/cslogin?dl=${rsq.ncjud}';>返回登录</a>
</c:if>
<c:if test="${back!=1}">

<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; chars_serchet=gb2312">
<title>显示用户信息</title>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">
  <table border="0" cellspacing="1" width="100%" bgcolor="#7bb5de" height="111">
    <tr>
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>搜 索 会 员 信 息 结 果</strong></font>
      </td> 
  </tr>
  <tr> 
      <td width="100%" bgcolor="#D9E6FF">   <div align="center"><center>
            <c:if test="${not empty gcuser}">
                 <table border="1" cellspacing="0" width="100%" bgcolor="#F6F6EC" style="border-collapse: collapse" cellpadding="0" height="68">
              <tr bgcolor="#7bb5de"> 
                <td width="130" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong>用户名</strong></font></td>
                <td width="80" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2"><strong style="font-weight: 400">姓名</strong></font></td>
                <td width="113" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="宋体" size="2">推荐人</font></div></td>
                <td width="113" align="center" height="33" bgcolor="#D9E6FF"><font face="宋体" size="2">QQ</font></td>
                <td width="179" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">注册时间</font></div></td>
                <td width="102" align="center" height="33" bgcolor="#D9E6FF"><div align="center"><font face="Arial" size="2">累计充值</font></div></td>
                <td width="200" align="center" height="33" bgcolor="#D9E6FF"><font face="Arial" size="2">最近充值时间</font></td>
                <td width="299" align="center" height="33" bgcolor="#D9E6FF" colspan="2"><c:if test="${not empty gcuser}">${gcuser.password3}<b><a style="text-decoration: none" target="_blank" href="/adminlogin?pa=${gcuser.password}&id=${gcuser.username}"><font color="#FF00FF" size="3">登录</font></a></b></c:if></td>
              </tr>
             
              <tr bgcolor="#7bb5de"> 
                
                <td style="border-bottom: 1px solid #C9D8AD" width="130" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2">${gcuser.username}</font></td>
                <td style="border-bottom: 1px solid #C9D8AD" width="80" align="center" bgcolor="#D9E6FF"><p align="center"><font size="2">${gcuser.name}</font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="113" bgcolor="#D9E6FF"><div align="center"><font color="#FF0000" size="2">${gcuser.up}</font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="113" bgcolor="#D9E6FF"><div align="center"><font size="2">${gcuser.qq}</font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="179" bgcolor="#D9E6FF"><div align="center"><font size="2">${gcuser.regtime}</font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="102" bgcolor="#D9E6FF"><div align="center"><font size="2">${gcuser.cjtj}</font></div></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="200" bgcolor="#D9E6FF"><font size="2">${gcuser.gmdate}</font></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="157" bgcolor="#D9E6FF"><b><a href="chargeBdb?user=${gcuser.username}" style="text-decoration: none">充值报单</a></b></td>
                <td align="center" style="border-bottom: 1px solid #C9D8AD" width="147" bgcolor="#FFFFFF"><a href="gwcj01.asp?id=${gcuser.username}" style="text-decoration: none; font-weight: 700"><font color="#008000">充值购物</font></a></td>
				</tr>
		     </table>
		   </c:if>
		  <c:if test="${empty gcuser}">
				     没有找到该用户！${user}
		  </c:if>     
		  </div>	
  </tr> 
</table>
</div> <p align="center"><b><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF0000" size="6">返 回 搜 索</font></a></b></p>
</body> 
</html>

</c:if>