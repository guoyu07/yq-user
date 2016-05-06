<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>金币卡转赠记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<LINK href="adminstyle.css" type=text/css rel=StyleSheet>
<body style="text-align: center">
<div align="center">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="85">
    <tr>
    <td width="100%" height="25" bgcolor="#FFFFB9"><p align="center" style="margin-top: 0; margin-bottom: 0"><font face="宋体"><b>金币卡转赠记录</b></font></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="60">
<font face="宋体" size="2">
	</font>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="59">
            <tr>
              <td width="152" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" color="#800000" size="2"><strong>消费编号</strong></font></td>
              <td width="57" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>面值</strong></font></td>
              <td width="123" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>生成时间</strong></font></td>
              <td width="114" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">原购</font></td>
              <td width="165" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转1</font></td>
              <td width="156" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转2</font></td>
              <td width="160" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转3</font></td>
              <td width="140" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转4</font></td>
              <td width="158" align="center" height="25" bgcolor="#F9F4E8"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">转5</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="35" width="152" align="center" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font color="#008000" size="2" style="font-weight: 700" face="宋体">${data.pdid}</font></td>
                <td valign="middle" width="57" align="center" bgcolor="#E8E8FF"><font color="#FF0000" face="宋体" size="2"><p style="margin-top: 0; margin-bottom: 0">${data.mj}0</font></td>
                <td valign="middle" width="123" align="center" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${data.gmdate}</font></td>
                <td valign="middle" align="center" width="114" bgcolor="#E8E8FF"><font face="宋体" size="2">${data.yuser}</font></td>
                <td valign="middle" align="center" width="165" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF">${data.user01}</font>-${data.zjdate01}</font></td>
                <td valign="middle" align="center" width="156" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF">${data.user02}</font>-${data.zjdate02}</font></td>
                <td valign="middle" align="center" width="160" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF">${data.user03}</font>-${data.zjdate03}</font></td>
                <td valign="middle" align="center" width="140" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF">${data.user04}</font>-${data.zjdate04}</font></td>
                <td valign="middle" align="center" width="158" bgcolor="#E8E8FF"><p style="margin-top: 0; margin-bottom: 0"><font face="宋体" size="2"><font color="#FF00FF">${data.user05}</font>-${data.zjdate05}</font></td>
              </tr>
              </s:iterator>
</table> 
</div><font face="宋体" size="2"><aldtags:pageTag/>
</font>
</tr> 
</table> 
</div> 
</body> 
</html>