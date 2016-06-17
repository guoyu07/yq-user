<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<html>
<title>EP 交 易 市 场</title>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"><p align="center"><strong>
		<font color="#000000" size="5" face="楷体_GB2312">EP 交 易 市 场（</font><font color="#FF00FF" size="5" face="楷体_GB2312">${sumPayNum}</font><font color="#000000" size="5" face="楷体_GB2312">）</font></strong></td> 
  </tr> 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E1FFF7">
<font face="宋体" size="2">
</font><div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0">
            <tr> 
          <td width="127" align="center" height="23" bgcolor="#FBFAEC"><font face="宋体" size="2"><b>交易编号</b></font></td>
          <td width="142" align="center" height="23" bgcolor="#FBFAEC"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">发布方</strong></font></td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC">　</td>
          <td width="121" align="center" height="23" bgcolor="#FBFAEC"><font color="#FF0000" face="宋体" size="2">求现金额</font></td>
          <td width="184" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000" face="宋体" size="2">求现发布时间</font></td>
          <td width="161" align="center" height="23" bgcolor="#FBFAEC"><font color="#000000" face="宋体" size="2">认购后可换EP</font></td>
          <td width="167" align="center" height="23" bgcolor="#FBFAEC"><b><font color="#008000" face="宋体" size="2">认购后可获利</font></b></td>
          <td width="260" align="center" height="23" bgcolor="#FBFAEC"><font face="宋体" size="2">交易状态</font></td>
          </tr>
        <s:iterator var="data" value="dataList"> 
          <tr> 
          <td height="28" width="127" align="center"><b><font face="宋体" size="2">${data.payid}</font></b></td>
          <td height="28" width="142" align="center"><p><font color="#000000" face="宋体" size="2">${data.payusername}</font></td>
          <td valign="middle" align="center" width="121">${data.pdid}</td>
          <td valign="middle" align="center" width="121"><font color="#FF0000" face="宋体" size="2">${data.paynum9}</font></td>
          <td valign="middle" align="center" width="184"><font color="#000000" face="宋体" size="2">${data.paytime}</font></td>
          <td valign="middle" align="center" width="161"><font color="#0000FF" face="宋体" size="2">${data.paynum}</font></td>
          <td valign="middle" align="center" width="167"><b><font color="#FF0000" face="宋体" size="2">${data.paynum-data.paynum9}</td>
          <td valign="middle" align="center" width="260"><font face="宋体" size="2">等待认购中。。。</font></td>
          </tr>
         </s:iterator>
            </table> 
</div><font face="宋体" size="2"><aldtags:pageTag/>
</font> 
</tr> 
</table> 
</div> </div>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="5">返回上一页</font></a></p>
<p align="center"></p>
<p align="center"></p>
<meta http-equiv=Refresh content="60; url=">
</body> 
</html>