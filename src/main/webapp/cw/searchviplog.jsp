<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>vip一币日志明细统计</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>


<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
  <tr><td colspan="7"><a href="cwindex">一币日志查询</a>|<a href="cjblog">充值币日志查询</a>|<a href="dcdata">导出数据</a></td></tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">VIP(${searchUserName})(${gcuser.name})(报单=${gcuser.sjb})一币日志</span></b><span style="font-size: 11pt"></span></p>
	<p>
	<form method="post" action="cwindex?status=1">
	<select name="searchUserName">
	   <c:forEach var="li" items="${vipList}">
	    <option value='${li}'  <c:if test="${not empty searchUserName&&li==searchUserName}">selected="selected"</c:if> >${li}</option>
	   </c:forEach>
	</select>
	开始日期:<input name="startTime" id="startTime" type="text" value="${startTime}"/>
	<input type="submit" value="查询"/>
	</form>
	</p>
	<p><a href="cwindex?status=1&searchUserName=${searchUserName}&startTime=${preDate}">看前一天</a>|<a href="cwindex?status=1&searchUserName=${searchUserName}&startTime=${nextDate}">看后一天</a></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
          <tr>        
     <td width="146" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#800000" size="2"></font></b></td>                
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> </font></b></td>
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> </font></b></td>
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> </font></b></td>
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> </font></b></td>
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> </font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2"></font></b></td>
     <td width="72" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"></font></b></td>
     <td width="72" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">${bean.startNum}</font></td>
            </tr>
           <tr>        
     <td width="146" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#800000" size="2"><strong>时间</strong></font></b></td>                
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>操作详情</strong></font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">收入</font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">收入折扣</font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">收入发生额</font></b></td>
     <td width="72" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2">支出</font></b></td>
          <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">支出折扣</font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">支出发生额</font></b></td>
     <td width="72" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">结余</font></td>
            </tr>
              <s:iterator var="data" value="bean.logList">
              <c:set var="inPrice" value="0"></c:set>
              <c:set var="outPrice" value="0"></c:set>
              <c:if test="${data.syjz>0}">
                  <c:set var="inPrice" value="${data.ration}"></c:set>
              </c:if>
              <c:if test="${data.jc>0}">
                  <c:set var="outPrice" value="${data.ration}"></c:set>
              </c:if>
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#DFFFEF"><b><font size="2" face="宋体">${data.abdate}</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#DFFFEF"><font face="宋体" size="2">${data.regid}</font></td></b>
      <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="宋体" size="2"><font color="#FF0000"><b>${data.syjz}</b></font></font></td><b>
      <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="宋体" size="2"><font color="#FF0000"><b>${inPrice}</b></font></font></td><b>
      <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="宋体" size="2"><font color="#FF0000"><b>${data.syjz*inPrice}</b></font></font></td><b>
      <td valign="middle" align="center" width="72" bgcolor="#DFFFEF"><font face="宋体" size="2">${data.jc}</font></td></b>
       <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="宋体" size="2"><font color="#FF0000"><b>${outPrice}</b></font></font></td><b>
      <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="宋体" size="2"><font color="#FF0000"><b>${data.jc*outPrice}</b></font></font></td><b>
      <td valign="middle" align="center" width="72" bgcolor="#DFFFEF"><font face="宋体" size="2" color="#FF0000"><b>${data.pay}</b></font></td>
              </tr>
              </s:iterator>
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#FFFF00"><b><font size="2" face="宋体">本日合计</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>

      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.dayStat.in}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
      <td valign="middle" align="center" width="161" bgcolor="#FFFF00"><font face="宋体" size="2"><font color="#FF0000"><fmt:formatNumber value="${bean.dayStat.inRmb}" pattern="0"/></font></font></td><b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.dayStat.out}" pattern="0"/></font></td></b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.dayStat.outRmb}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2" color="#FF0000"><b><fmt:formatNumber value="${bean.dayStat.remaind}" pattern="0"/></b></font></td>
              </tr>           
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#FFFF00"><b><font size="2" face="宋体">本月合计</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>

      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.monthStat.in}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
      <td valign="middle" align="center" width="161" bgcolor="#FFFF00"><font face="宋体" size="2"><font color="#FF0000"><b><fmt:formatNumber value="${bean.monthStat.inRmb}" pattern="0"/></b></font></font></td><b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.monthStat.out}" pattern="0"/></font></td></b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.monthStat.outRmb}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2" color="#FF0000"><b><fmt:formatNumber value="${bean.monthStat.remaind}" pattern="0"/></b></font></td>
              </tr>     
<tr> 
      <td height="24" width="91" align="center" bgcolor="#FFFF00"><b><font size="2" face="宋体">本年合计</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.yearStat.in}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
      <td valign="middle" align="center" width="161" bgcolor="#FFFF00"><font face="宋体" size="2"><font color="#FF0000"><b><fmt:formatNumber value="${bean.yearStat.inRmb}" pattern="0"/></b></font></font></td><b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.yearStat.out}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${bean.yearStat.outRmb}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2" color="#FF0000"><b><fmt:formatNumber value="${bean.yearStat.remaind}" pattern="0"/></b></font></td>
              </tr>          
              
                                      
            </table> 
</div><font size="2">
</font>
</tr> 
</table> 
</div> 
</html>
 <script type="text/javascript">
		$('#startTime').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>