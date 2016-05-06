<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
		<font color="#000000" size="5" face="宋体"><strong>集 团 内 部 股 票 交 易 市 场</strong></font><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<font face="宋体">
<font size="2">
<b><font color="#0000FF">当前交易价是 </font><font color="#FF0000">${fcxt.jygj}元 </font></b></font>
<font color="#0000FF" size="2">系统每30秒刷新一次&nbsp; </font>
<font color="#800000"><b>
		<a href="" style="text-decoration: none; background-color:#FFFFFF">
<font size="2" color="#800000">发布卖出</font></a></b></font><font color="#000000"><font size="2">&nbsp; 
</font> <a href="" style="text-decoration: none; font-weight:700; background-color:#FFFFFF">
<font size="2" color="#FF0000">发布买入</font></a></font></font></td> 
  </tr> 
   
 
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#D7FFE3">
	<div align="center">
		<table border="1" width="60%" id="table1" bgcolor="#404020" bordercolor="#000000" height="60">
			<tr>
				<td align="center" width="90">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b>
				<font color="#FFFF00" face="宋体" size="2">开盘价</font></b></td>
				<td align="center" width="94">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>最高价</b></font></td>
				<td align="center" width="98">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>最低价</b></font></td>
				<td align="center" width="98">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>现价</b></font></td>
				<td align="center" width="170">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>交易范围</b></font></td>
				<td align="center">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFF00" face="宋体" size="2"><b>成交量</b></font></td>
			</tr>
			<tr>
				<td align="center" width="90">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">1</span></font></td>
				<td align="center" width="94">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">${fcxt.zgj}</span></font></td>
				<td align="center" width="98">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">${fcxt.zdj}</span></font></td>
				<td align="center" width="98">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">${fcxt.jygj}</span></font></td>
				<td align="center" width="170">
				<font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">${fcxt.zgj}/${fcxt.zdj}</span></font></td>
				<td align="center" width="150"><font color="#FFFFFF" face="宋体" size="2">
				<span style="font-weight:700">${fcxt.jygsl}</span></font></td>
			</tr>
		</table>
	</div>
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体">友情提醒：根据市场情况，电子股单价会稳步上涨，到一定时候拆分。<br> 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
                
              <td width="99" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font face="宋体" color="#000000" size="2">
				<strong style="font-weight: 400">交易编号</strong></font></td>
                
              <td width="86" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong>类别</strong></font></td>
                
              <td width="88" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">出售数量</strong></font></td>
                
              <td width="82" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">求购数量</strong></font></td>
                
              <td width="51" align="center" height="30" bgcolor="#FFE1FF">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				<font size="2" face="宋体">单价</font></td>
                
              <td width="69" align="center" height="30" bgcolor="#FFE1FF"> 
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
				<font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">交易额</strong></font></td>
                
              <td width="196" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">挂牌时间</font></td>
                
              <td width="85" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font color="#000000" size="2" face="宋体">发布方</font></td>
                
              <td width="195" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <font face="黑体" color="#008000" style="font-size: 11pt; ">成交时间</font></td>
                
              <td width="150" align="center" height="30" bgcolor="#FFE1FF"> 
                <p style="line-height: 150%; margin-top: 0; margin-bottom: 0"> 
                <b><font face="黑体">对方</font></b></td>
              </tr>
             <s:iterator var="data" value="dataList">
              <tr> 
                <td height="35" width="99" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体">${data.id}</font></td>
                <td width="86" align="center" bgcolor="#FAF8E6"> 
                  <b><font size="2" color="#008000">
					<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font face="宋体"><c:if test="${data.mcsl>0}"></font></font><font face="宋体"><font color="#FF0000" size="2">出售</font><font size="2" color="#008000"></c:if>
					<c:if test="${data.mcsl<=0}">求购</c:if></font></font></b></td>
                <td valign="middle" width="88" align="center"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#000000" size="2" face="宋体">${data.mcsl}</font></td>
                <td valign="middle" align="center" width="82"> 
                  <p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
					<font color="#0000FF" size="2" face="宋体">${data.mysl}</font></td>
                <td valign="middle" align="center" width="51"><b>
				<font color="#FF0000" size="2" face="宋体">${data.pay}</font></b></td>
                <td valign="middle" align="center" width="69">
				<font size="2" face="宋体">${data.jypay}</font></td>
                <td valign="middle" align="center" width="196">
				<font color="#000000" size="2" face="宋体">${data.abdate}</font></td>
                <td valign="middle" align="center" width="85">
				<font size="2" face="宋体">${data.username}</font></td>
                <td valign="middle" align="center" width="195">
				<font face="黑体" color="#008000" size="2">${data.cgdate}</font></td>
                <td valign="middle" align="center" width="150">
				<font face="黑体" size="2"><b>${data.dfuser}</b></font></td>
              </tr>
              </s:iterator>
            </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag/>
</font> 
</tr> 
</table> 
<font face="宋体" size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
<meta http-equiv=Refresh content="180; url=">
</html>