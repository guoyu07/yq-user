<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<HTML>
<style><!--
        A:visited{TEXT-DECORATION: none}
        A:active{TEXT-DECORATION: none}
        A:hover{TEXT-DECORATION: underline overline}
        A:link{text-decoration: none;}
        TD { FONT-SIZE: 9pt;font-family:宋体}
.default-border-tlrb {
BORDER-RIGHT: #68bd5b 1px solid; BORDER-TOP: #68bd5b 1px solid; BORDER-LEFT: #68bd5b 1px solid; BORDER-BOTTOM: #68bd5b 1px solid
}
        --></style>

<HEAD>
<body bgcolor="#DDECFE" topmargin="5">
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=200,height=120');
    }
//-->
</SCRIPT>
<title></title>
<body leftmargin="5" topmargin="5">

<div align="center">

<TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" BGCOLOR="#7BB5DE" HEIGHT="95" style="border-collapse: collapse" bordercolor="#006699">
  <TR>
    <TD HEIGHT="25" width="100%" background="images/admin_bg_1.gif">
<p align="center">
<font style="font-size: 11pt"><b>全部已转帐记录</b></font></TD>
  </TR>
  <TR> 
    <TD VALIGN="TOP" width="100%" bgcolor="#C3DAF9">
<div align="center">
  <center>
<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" style="border-collapse: collapse" height="48">
        <tr>
          <td width="87" bgColor="#C3DAF9" height="24" align="center">ID</td>
          <td width="104" bgColor="#C3DAF9" height="24" align="center"><font color="#008000">员工名</font></td>
          <td width="49" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><font color="#FF0000"><strong style="font-weight: 400">提现</strong></font></div></td>
          <td width="56" bgColor="#C3DAF9" height="24" align="center">提现前</td>
          <td width="50" bgColor="#C3DAF9" height="24" align="center"><font color="#800080">余额</font></td>
          <td width="81" bgColor="#C3DAF9" height="24" align="center"><b>姓名</b></td>
          <td width="91" bgColor="#C3DAF9" height="24" align="center"><font face="Arial">提现银行</font></td>
          <td width="136" bgColor="#C3DAF9" height="24" align="center"><font face="Arial">银行帐号</font></td>
          <td width="131" bgColor="#C3DAF9" height="24" align="center">申请时间</td>
          <td width="129" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><font face="Arial">处理时间</font></div></td>
          <td width="31" bgColor="#C3DAF9" height="24" align="center">区域</td>
        </tr>
     <s:iterator var="data" value="dataList">
        <tr> 
          <td height="24" width="87" align="center" bgcolor="#C3DAF9">${data.payid}</td>
          <td height="24" width="104" align="center" bgcolor="#C3DAF9">${data.payusername}</td>
          <td height="24" width="49" align="center" bgcolor="#C3DAF9"><font color="#FF0000">${data.paynum} </font> </td>
          <td height="24" width="56" align="center" bgcolor="#C3DAF9">${data.bankbz}</td>
          <td height="24" width="50" align="center" bgcolor="#C3DAF9"><font color="#800080">${data.bz}</font></td>
          <td height="24" width="81" align="center" bgcolor="#C3DAF9">${data.payname}</td>
          <td height="24" width="91" align="center" bgcolor="#C3DAF9">${data.paybank}</td>
          <td height="24" width="136" align="center" bgcolor="#C3DAF9">${data.paycard}</td>
          <td height="24" width="131" align="center" bgcolor="#C3DAF9">${data.paytime}</td>
          <td height="24" width="129" align="center" bgcolor="#C3DAF9">${data.zftime}</td>
          <td height="24" width="31" align="center" bgcolor="#C3DAF9">${data.dqu}</td>
        </tr>
  </s:iterator>
      </table></center>
</div>
<br>
       <table width="100%" border="0" cellpadding="2" cellspacing="2" borderColorLight=#808080 borderColorDark=#ffffff>
   <tr> 
   <aldtags:pageTag/>
    </tr>
   </table>
</div>
</BODY>
</HTML>
