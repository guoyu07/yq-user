<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title><s:text name='vipcjjl.jsp.cjjl.jsp.1275454120'/></title>
<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75" bgcolor="#EEFFEE">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt"><s:text name='vipcjjl.jsp.cjjl.jsp.-406701522'/><font color="#FF0000">${dl}</font><s:text name='vipcjjl.jsp.cjjl.jsp.1275454120'/></span></b><span style="font-size: 11pt"></span></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr>        
     <td width="104" align="center" height="26" bgcolor="#E8E8FF"> 
	<b><font size="2"><s:text name='viewyblc-vipcjb.jsp.yblc-vipcjb.jsp.1030049'/></font></b></td>                
     <td width="130" align="center" height="26" bgcolor="#E8E8FF"> 
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font  color="#800000" size="2">
				<strong><s:text name='vipcjjl.jsp.cjjl.jsp.-1856812539'/></strong></font></td>                
              <td width="300" align="center" height="26" bgcolor="#E8E8FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#800000"  size="2"> <strong><s:text name='viewjflc-recharge.jsp.jflc-recharge.jsp.640388245'/></strong></font></td>
              <td width="164" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000"  size="2"><s:text name='viewxfgl-mobilecharge.jsp.xfgl-mobilecharge.jsp.640736963'/></font></b></td>
              <td width="145" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#800000"  size="2"><s:text name='vipcjjl.jsp.cjjl.jsp.641149325'/></font></b></td>
              <td width="132" align="center" height="26" bgcolor="#E8E8FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b> 
                <font color="#FF0000"  size="2"><s:text name='viewgrxx-gcbf.jsp.grxx-gcbf.jsp.734401'/></font></b></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="24" width="104" align="center" bgcolor="#F4F7E6"><b>
				<font size="2" >${data.id}</font></b></td>
                <td height="24" width="130" align="center" bgcolor="#F4F7E6"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#008000"  size="2" style="font-weight: 700">${data.username}</font></td>
                <td valign="middle" width="300" align="center" bgcolor="#F4F7E6"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000"  size="2">${data.date}</font></td>
                <td valign="middle" align="center" width="164" bgcolor="#F4F7E6">
				<b>
				<font  size="2" color="#FF0000">${data.syjz}</font></b></td>
                <td valign="middle" align="center" width="145" bgcolor="#F4F7E6">
				<font  size="2">${data.pay}</font></td>
                <td valign="middle" align="center" width="132" bgcolor="#F4F7E6">${data.regid}</td>
              </tr>
              </s:iterator>
            </table> 
</div><font size="2"> 
<aldtags:pageTag/>
</font>
</tr> 
</table> 
</div> 
</body> 
</html>
