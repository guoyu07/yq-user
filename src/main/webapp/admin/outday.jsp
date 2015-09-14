<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>交易市场</title>

<p>
<iframe name="I1" width="100%" marginwidth="1" marginheight="1" border="0" frameborder="0" src="/admin/sgtjdate">
</iframe></p>
<table border="0" cellspacing="0" width="100%" cellpadding="0" height="83">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="83" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
              <td width="55" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">编号</strong></font></td>
              <td width="112" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong>用户名</strong></font></td>
              <td width="56" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">单数</strong></font></td>
              <td width="71" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">周封</strong></font></td>
              <td width="53" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font size="2" face="宋体">层封</font></td>
              <td width="75" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">左总</strong></font></td>
              <td width="69" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">右总</font></td>
              <td width="54" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#008000" size="2">左剩</font></td>
              <td width="54" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#008000" size="2">右剩</font></td>
              <td width="117" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">　左边</font></td>
              <td width="107" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">　右边</font></td>
              <td width="56" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">累计</font></td>
              <td width="61" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">上周</font></td>
              <td width="159" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体" size="2">升级时间</font></b></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="35" width="55" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${data.id}</font></td>
                <td width="112" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体">${data.username}</font></font></b></td>
                <td valign="middle" width="56" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${data.sjb}</font></td>
                <td valign="middle" align="center" width="71"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="宋体">${data.fdpay}</font></td>
                <td valign="middle" align="center" width="53"><b><font color="#FF0000" size="2" face="宋体">${data.cfd}</font></b></td>
                <td valign="middle" align="center" width="75"><font size="2" face="宋体">${data.zaq}</font></td>
                <td valign="middle" align="center" width="69"><font color="#000000" size="2" face="宋体">${data.zbq}</font></td>
                <td valign="middle" align="center" width="54"><font size="2" face="宋体">${data.aq}</font></td>
                <td valign="middle" align="center" width="54"><font face="宋体" color="#008000" size="2">${data.bq}</font></td>
                <td valign="middle" align="center" width="117"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">　${data.auid}</font></td>
                <td valign="middle" align="center" width="107"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" size="2">　${data.buid}</font></td>
                <td valign="middle" align="center" width="56"><font face="宋体" size="2">${data.cbpay}</font></td>
                <td valign="middle" align="center" width="61"><font face="宋体" size="2">${data.pay}</font></td>
                <td valign="middle" align="center" width="159"><font face="宋体" size="1"><b>${data.bddate}</b></font></td>
              </tr>
              </s:iterator>
            </table> 
</div><font face="宋体" size="2"><aldtags:pageTag/>
</font> 
</tr> 
</table> 
<font face="宋体" size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
</html>