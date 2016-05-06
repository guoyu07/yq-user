<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>vip充值币日志明细统计</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>


<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
   <tr><td colspan="5"><a href="cwindex">一币日志查询</a>|<a href="cjblog">充值币日志查询</a>|<a href="dcdata">导出数据</a></td></tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">VIP(${searchUserName})(${gcuser.name})(报单=${gcuser.sjb})充值币日志</span></b><span style="font-size: 11pt"></span></p>
	<p>
	<form method="post" action="cjblog?status=1">
	<select name="searchUserName">
	   <c:forEach var="li" items="${vipList}">
	    <option value='${li}'  <c:if test="${not empty searchUserName&&li==searchUserName}">selected="selected"</c:if> >${li}</option>
	   </c:forEach>
	</select>
	开始日期:<input name="startTime" id="startTime" type="text" value="${startTime}"/>
	<input type="submit" value="查询"/>
	</form>
	</p>
	<p><a href="cjblog?status=1&searchUserName=${searchUserName}&startTime=${preDate}">看前一天</a>|<a href="cjblog?status=1&searchUserName=${searchUserName}&startTime=${nextDate}">看后一天</a></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr> 
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="99" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF">${cjbBean.startNum}</td>
            </tr>
            <tr> 
              <td width="99" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">充值时间</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">操作说明</strong></font></td>
              <td width="97" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" face="宋体" size="2"> <strong style="font-weight: 400">收入</strong></font></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" face="宋体" size="2">支出</font></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" face="宋体" size="2">剩余</font></td>
            </tr>
              <s:iterator var="data" value="cjbBean.logList">
              <c:set var="sr" value="0"></c:set>
              <c:set var="zc" value="0"></c:set>
                   <tr> 
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${data.cjdate}</font></td>
              <td height="31" width="120" align="center"><font color="#000000" face="宋体" size="2"><c:if test="${data.cjuser=='系统'}">从${data.cjuser}处获得
              <c:set var="sr" value="${data.cjjo}"></c:set>
              </c:if>
              <c:if test="${data.cjuser!='系统'}">
                                                                给${data.cjuser}充值
                   <c:set var="zc" value="${data.cjjo}"></c:set>
              </c:if>
              </font></td>
              <td valign="middle" align="center"><font color="#FF0000" face="宋体" size="2">${sr}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${zc}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${data.sycjb}</font></td>
              </tr>
              </s:iterator>
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#FFFF00"><b><font size="2" face="宋体">本日合计</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${cjbBean.dayStat.in}" pattern="0"/></font></td></b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${cjbBean.dayStat.out}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2" color="#FF0000"><b><fmt:formatNumber value="${cjbBean.dayStat.remaind}" pattern="0"/></b></font></td>
              </tr>           
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#FFFF00"><b><font size="2" face="宋体">本月合计</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${cjbBean.monthStat.in}" pattern="0"/></font></td></b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${cjbBean.monthStat.out}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2" color="#FF0000"><b><fmt:formatNumber value="${cjbBean.monthStat.remaind}" pattern="0"/></b></font></td>
              </tr>     
<tr> 
      <td height="24" width="91" align="center" bgcolor="#FFFF00"><b><font size="2" face="宋体">本年合计</font></b></td>
      <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"></font></td>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${cjbBean.yearStat.in}" pattern="0"/></font></td></b>
            <td valign="middle" align="center" width="136" bgcolor="#FFFF00"><font face="宋体" size="2"><fmt:formatNumber value="${cjbBean.yearStat.out}" pattern="0"/></font></td></b>
      <td valign="middle" align="center" width="72" bgcolor="#FFFF00"><font face="宋体" size="2" color="#FF0000"><b><fmt:formatNumber value="${cjbBean.yearStat.remaind}" pattern="0"/></b></font></td>
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