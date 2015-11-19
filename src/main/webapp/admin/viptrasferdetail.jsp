<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>服务中心转账明细</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>


<div align="center">
	<b>
  <table border="0" cellspacing="1" width="100%" cellpadding="0" height="75">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="73">
	<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<b><span style="font-size: 11pt">服务中心转账明细</span></b><span style="font-size: 11pt"></span></p>
	<p>
	<form method="post" action="">
	<select name="vipName">
	   <option value="" <c:if test="${empty vipName}">selected="selected"</c:if>>不限制vip名</option>
	   <c:forEach var="li" items="${listVipName}">
	    <option value='${li}'  <c:if test="${not empty vipName&&li==vipName}">selected="selected"</c:if> >${li}</option>
	   </c:forEach>
	</select>
	开始日期:<input name="startDate" id="startDate" type="text" value="${startDate}"/>结束日期:<input name="endDate" id="endDate" type="text" value="${endDate}"/>
	<input type="submit" value="查询"/>
	</form>
	</p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="49">
           <tr>        
     <td width="91" align="center" height="26" bgcolor="#E8E8FF"><b><font size="2" face="宋体">编号</font></b></td>                
     <td width="146" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#800000" size="2"><strong>统计日期</strong></font></b></td>                
     <td width="111" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2"> <strong>用户名</strong></font></b></td>
     <td width="136" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2">支出一币币</font></b></td>
     <td width="161" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">实收90%</font></b></td>
     <td width="163" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#800000" face="宋体" size="2">支出报单币</font></b></td>
     <td width="172" align="center" height="26" bgcolor="#E8E8FF"><b><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" face="宋体" size="2">实收90%</font></td>
            </tr>
              <s:iterator var="data" value="dataList">
             <tr> 
      <td height="24" width="91" align="center" bgcolor="#DFFFEF"><b><font size="2" face="宋体">${data.vipid}</font></b></td>
      <td height="24" width="146" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#008000" face="宋体" size="2" style="font-weight: 700">${data.vipdate}</font></td>
      <td valign="middle" width="111" align="center" bgcolor="#DFFFEF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" face="宋体" size="2">${data.vipname}</font></td><b>
      <td valign="middle" align="center" width="136" bgcolor="#DFFFEF"><font face="宋体" size="2">${data.jcyb}</font></td></b>
      <td valign="middle" align="center" width="161" bgcolor="#DFFFEF"><font face="宋体" size="2"><font color="#FF0000"><b>${data.jcyb*0.9}</b></font></font></td><b>
      <td valign="middle" align="center" width="163" bgcolor="#DFFFEF"><font face="宋体" size="2">${data.jcbdb}</font></td></b>
      <td valign="middle" align="center" width="172" bgcolor="#DFFFEF"><font face="宋体" size="2" color="#FF0000"><b>${data.jcbdb*0.9}</b></font></td>
              </tr>
              </s:iterator>
            </table> 
</div><font size="2"> <aldtags:pageTag paraStr="vipName,${vipName},startDate,${startDate},endDate,${endDate}"/>
</font>
</tr> 
</table> 
</div> 
</html>
 <script type="text/javascript">
		$('#startDate').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
		
		$('#endDate').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>