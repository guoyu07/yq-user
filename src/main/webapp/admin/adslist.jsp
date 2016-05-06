<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>总站长公告管理</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK 
href="adminstyle.css" type=text/css rel=StyleSheet>
</head>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=200,height=120');
    }
//-->
</SCRIPT>


<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<div align="center">

  <table border="1" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="143">
    <tr>
      <td width="100%" height="26" bgcolor="#C3DAF9" background="images/admin_bg_1.gif"> 
        <p align="center">
		<span style="font-size: 11pt"><b>管理</b></span><b><font style="font-size: 11pt">员公告</font></b></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 0px solid #E5EAC2; border-right: 0px solid #E5EAC2; border-bottom: 0px solid #E5EAC2" height="117" bgcolor="#C3DAF9"><br> 

<div align="center">
            
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
                
              <td width="84" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong><font face="Arial">序号</font></strong></td>
                
              <td width="100" align="center" height="28" bgcolor="#C3DAF9"> 
				<strong>发布人</strong></td>
                
              <td width="402" align="center" height="28" bgcolor="#C3DAF9"> 
                <div align="center"><b>公 告 标 题</b></div>
                </td>
                
              <td width="266" align="center" height="28" bgcolor="#C3DAF9"> 
                <b>发布时间</b></td>
                
              <td width="274" align="center" height="28" bgcolor="#C3DAF9"> 
                <b>操作</b></td>
                
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td valign="middle" height="23" width="84" align="center"> 
                  <p><font color="#000000" size="2">${data.id} 
                </font> 
                </td>
                <td valign="middle" width="100" align="center"> 
                  <p><font color="#000000" size="2"> 
                	公司</font></td>
                <td valign="middle" align="center" width="402"> 
                  <div align="center"><font color="#000000" size="2">
					<a target="_blank" href="/admin/showcontent?noticeId=${data.id}">${data.ggbt}</a></font></div>
                </td>
                <td valign="middle" align="center" width="266"> 
                  <font size="2">　${data.ggdate}</font></td>
                <td valign="middle" align="center" width="274"> 
                  <font color="#000000" size="2">
					<a href="/admin/editnotice?noticeId=${data.id}">修改</a>
             </s:iterator></table> 
</div> <aldtags:pageTag/>
<p>　</td> 
  </tr> 
</table> 
</div> 
</body> 
</html>