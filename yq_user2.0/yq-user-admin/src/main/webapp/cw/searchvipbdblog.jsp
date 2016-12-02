<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('玩家不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('结束时间要大于开始时间！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('玩家不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('开始时间或结束时间不能为空！');history.go(-1);</script></c:if>
<html>
<title>备用保单币收付日记账</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 if ( Form.startTime.value==""){
			alert ("请选择开始日期！");
			Form.startTime.focus();
			return;
		}
	 if ( Form.endTime.value==""){
			alert ("请选择结束日期！");
			Form.endTime.focus();
			return;
		}
	 if ( Form.searchUserName.value==""){
			alert ("请选择vip！");
			Form.searchUserName.focus();
			return;
		}
	 var url="bdboutExcel?startTime="+Form.startTime.value+"&endTime="+Form.endTime.value+"&searchUserName="+Form.searchUserName.value;//var url="vipcjbdetailsoutexcel?zuser="+Form.zuser.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>

<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
   <tr><td colspan="5"><jsp:include page="commonhead.jsp"/></td></tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">VIP(${searchUserName})(${gcuser.name})备用报单币日志明细</span></b><span style="font-size: 11pt"></span></p>
	<p>
	<form method="post" name="Form" action="searchbdblog?status=1">
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
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr>
          <td width="123" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>充值用户</strong></font></td>
			 <td width="67" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong> 支出</strong></font></td>
			 <td width="67" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			 <font color="#000000" face="宋体" size="2"> <strong> 收入</strong></font></td>
			 <td width="67" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong> 服务费</strong></font></td>
			 <td width="67" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong> 服务费金额</strong></font></td>
			<td width="67" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>用户当前数量</strong></font></td>
          <td width="71" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">充值时间</font></td>
		  <td width="178" align="center" height="29" bgcolor="#FFE1FF"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">被充值用户</font></td>
          </tr>
          <s:iterator var="data" value="clientBdbList">
          <tr> 
		          <td height="29" width="123" align="center" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${data.operator}</font></td>
					<td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.out}</font></td>
					<td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.in}</font></td>
					<td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.servicefee}</font></td>
		          <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.servicefeejine}</font></td>
					<td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.currentamount}</font></td>
				 <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.rechargedate}</font></td>
				 <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.username}</font></td>
		  </tr>	
          <%-- <c:set var="jine" value="${data.amount}"></c:set>
          <c:choose>
          	<c:when test="${data.operator=='系统'}">
          		<tr> 
		          <td height="29" width="123" align="center" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${data.operator}</font></td>
		          <td valign="middle" width="67" align="center" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${jine < 0 ? -jine : jine}</font></td>
		          <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.currentamount}</font></td>
				 <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.rechargedate}</font></td>
				 <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.username}</font></td>
		         </tr>
          	</c:when>
          	<c:otherwise>
          		<tr> 
		          <td height="29" width="123" align="center" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${data.username}</font></td>
		          <td valign="middle" width="67" align="center" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font color="#000000" face="宋体" size="2">${jine < 0 ? -jine : jine}</font></td>
		          <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.currentamount}</font></td>
				 <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.rechargedate}</font></td>
				 <td valign="middle" align="center" width="71" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
					<font size="2" face="宋体">${data.operator}</font></td>
		         </tr>
          	</c:otherwise>
          </c:choose> --%>
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