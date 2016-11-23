<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('玩家不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('结束时间要大于开始时间！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('玩家不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('开始时间或结束时间不能为空！');history.go(-1);</script></c:if>
<html>
<title>一币收付日记账</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 var url="dayofyboutexcel?startTime="+Form.startTime.value+"&endTime="+Form.endTime.value+"&searchUserName="+Form.searchUserName.value;//var url="vipcjbdetailsoutexcel?zuser="+Form.zuser.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>

<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
   <tr><td colspan="5"><a href="cwindex">一币日志查询</a>|<a href="cjblog">充值币日志查询</a>|<a href="dcdata">导出数据</a>|<a href="dayofyb">一币收付日记账</a></td></tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">VIP(${searchUserName})(${gcuser.name})<%-- (报单=${gcuser.sjb}) --%>一币日志明细</span></b><span style="font-size: 11pt"></span></p>
	<p>
	<form method="post" name="Form" action="dayofyb?status=1">
	<select name="searchUserName">
	   <c:forEach var="li" items="${vipList}">
	    <option value='${li}'  <c:if test="${not empty searchUserName&&li==searchUserName}">selected="selected"</c:if> >${li}</option>
	   </c:forEach>
	</select>
	开始日期:<input name="startTime" id="startTime" type="text" value="${startTime}"/>结束日期:<input name="endTime" id="endTime" type="text" value="${endTime}"/>
	<input type="submit" value="查询"/><input type="button" onClick="exportExcel()" value="导出excel"/>(每次的导出数量不能超过5000条)<br>
	</form>
	</p>
	<%-- <p><a href="cjblog?status=1&searchUserName=${searchUserName}&startTime=${preDate}">看前一天</a>|<a href="cjblog?status=1&searchUserName=${searchUserName}&startTime=${nextDate}">看后一天</a></p> --%>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
            <tr> 
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="99px" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF">${dayofyb.startNum}</td>
            </tr>
            <tr> 
              <td width="99" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">充值时间</font></td>
              <td width="99px" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 100">操作说明</strong></font></td>
              <td width="97" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" face="宋体" size="2"> <strong style="font-weight: 400">收入</strong></font></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" face="宋体" size="2">支出</font></td>
              <td width="95" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" face="宋体" size="2"></font></td>
            </tr>
              <s:iterator var="data" value="dayofyb.dayofybList">
              <c:set var="sr" value="0"></c:set>
              <c:set var="zc" value="0"></c:set>
                   <tr> 
              <td valign="middle" align="center" width="95"  bgcolor="#E8E8FF"><font color="#000000" face="宋体" size="2">${data.date}</font></td>
              <td height="31" width="120" align="center"  bgcolor="#E8E8FF"><font color="#000000" face="宋体" size="2">${data.origin}</font> </td>
              <td valign="middle" align="center"  bgcolor="#E8E8FF"><font color="#FF0000" face="宋体" size="2"><c:if test="${data.in!=0}">${data.in}</c:if></font></td>
              <td valign="middle" align="center" width="95"  bgcolor="#E8E8FF"><font color="#000000" face="宋体" size="2"><c:if test="${data.out!=0}">${data.out}</c:if></font></td>
              <td valign="middle" colspan="2" align="center" width="95"  bgcolor="#E8E8FF"><font color="#000000" face="宋体" size="2"></font></td>
              </tr>
              </s:iterator>
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
		$('#endTime').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>