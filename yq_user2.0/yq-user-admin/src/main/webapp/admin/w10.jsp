<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:if test="${erroCodeNum==2000}">
<c:if test="${op==1}"><c:set var="str" value="暂停"></c:set></c:if>
<c:if test="${op==0}"><c:set var="str" value="恢复"></c:set></c:if>
<script language=javascript>alert('${str}该笔交易成功！');location.href="w200?toPage=${page}&uid=${uid}&uname=${uname}&riqi=${riqi}";</script>
</c:if>

<c:if test="${erroCodeNum==2001}">
<script language=javascript>alert('设置成功！');location.href="w200?toPage=${page}&uid=${uid}&uname=${uname}&riqi=${riqi}";</script>
</c:if>

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
        	<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>

<HEAD>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5">
<title>全部提现记录</title>
<div align="center">
<TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" BGCOLOR="#B6E2FD" HEIGHT="114" style="border-collapse: collapse" bordercolor="#008BBB">
  <TR>
    <TD HEIGHT="25" width="100%" bgcolor="#C3DAF9" background="images/admin_bg_1.gif">
<p align="center"><b><span style="font-size: 11pt">提现申请清单</span></b></TD></TR>
  <TR> 
    <TD VALIGN="TOP" width="100%" bgcolor="#C3DAF9">
<div align="center">
  <center>
  <p align="left">
 <form name="form" method="POST" action="w200">
		<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><span style="font-size: 9pt">用户名：<input type="text" name="uid" size="20" value="${uid}"> 名字：<input type="text" name="uname" size="20" value="${uname}">日期：<input type="text" name="riqi" id="riqi" size="20" value="${riqi}"><input type="submit" name="Submit" value="搜索">&nbsp;&nbsp;&nbsp; </span>
		</p>
		</form></p>
<p align="center"><b><font size="2" color="#FF0000"><span style="background-color: #FFFFFF">注意看原始姓名与现提现的姓名对不对得上，如对不上先不要通过！</span></font></b></p>
<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" style="border-collapse: collapse" height="64">
        <tr>
          <td width="79" bgColor="#C3DAF9" height="24" align="center">交易编号</td>
          <td width="102" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><strong style="font-weight: 400">用户名</strong></div></td>
          <td width="80" bgColor="#AADAA3" height="24" align="center">原始姓名</td>
          <td width="66" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center"><strong>求现额</strong></div></td>
          <td width="77" bgColor="#C3DAF9" height="24" align="center"><strong style="font-weight: 400">提现姓名</strong></td>
          <td width="75" bgColor="#DFDFDF" height="24" align="center"><b><font color="#FF0000" size="2">累提</font></b></td>
          <td width="158" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">申请时间</div></td>
          <td width="170" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">所属银行</div></td>
          <td width="182" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">银行账号</div></td>
          <td width="80" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">收购方</div></td>
          <td width="60" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">状态</div></td>
          <td width="60" bgColor="#C3DAF9" height="24" align="center"><div class="word2" align="center">操作</div></td>
        </tr>
         <s:iterator var="data" value="dataList">
        <tr> 
          <td height="38" width="79" align="center">${data.payid}</td>
          <td height="38" width="102" align="center"><font color="#008000">${data.payusername}</font></td>
          <td height="38" width="80" align="center" bgcolor="#AADAA3"><b>${data.name}</b></td>
          <td height="38" width="66" align="center"><font color="#FF0000"><b>${data.paynum9}</b></font></td>
          <td height="38" width="77" align="center">
           ${data.payname}<c:if test="${data.txvip>0}"><a onClick="return confirm('提示：您确定(恢复)该笔交易吗？ ')" href="syusers?payid=${data.payid}&op=0&page=${toPage}&uid=${uid}&uname=${uname}&riqi=${riqi}">-恢复</a></c:if>
         </td>
          <td height="38" width="75" align="center" bgcolor="#DFDFDF"><b><font color="#FF0000" size="2">${data.sumPayNum}</font></b></td>
          <td height="38" width="158" align="center">${data.paytime}</td>
          <td height="38" width="170" align="center">${data.paybank}
          <c:if test="${data.txvip==0}"><a onClick="return confirm('提示：您确定(暂停)该笔交易吗？ ')" href="syusers?payid=${data.payid}&op=1&page=${toPage}&uid=${uid}&uname=${uname}&riqi=${riqi}">-暂停</a></c:if>
          </td>
          <td height="38" width="182" align="center">${data.paycard}</td>
          <td height="38" width="80" align="center">${data.dfuser}</td>
          <td height="38" width="60" align="center">${data.ep}</td>
          <td height="38" width="60" align="center">
          <c:if test="${data.needVerify==1}"><a href="setVerify?verify=0&user=${data.payusername}&page=${toPage}&uid=${uid}&uname=${uname}&riqi=${riqi}" ><font color="green">关闭免审核</font></a></c:if><c:if test="${data.needVerify==0}"><a href="setVerify?verify=1&user=${data.payusername}&page=${toPage}&uid=${uid}&uname=${uname}&riqi=${riqi}" ><font color="red">设置为免审核</font></a></c:if></td>
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

	</table>
</div>
</BODY>
</HTML>
 <script type="text/javascript">
		$('#riqi').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>