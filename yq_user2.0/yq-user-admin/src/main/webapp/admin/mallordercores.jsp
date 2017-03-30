<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('用户订单不存在，请检查输入是否正确！');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>商城购物卷明细查询</title>
    <link rel="stylesheet" href="/css/common.css" />
        <link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/> 
     <script type="text/javascript">
		 function exportExcel(){
             var url="userscoreslogoutExcel?&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
			 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
		 }
</script>
<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>商城购物卷明细查询</strong></font></td> 
  </tr> 
   

  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
    <form method="POST" action="usermallorderscoreslog?status=1" name="Form" id="Form">
	<p align="center">订单号：<input name="orderId" id="orderId" type="text" value="${orderId}"/>
		 	<%-- 开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/> --%><input type="submit" value="查询" name="B1"><br>
    </form>
 <div align="center">    
          <div class="content-table">
                 <table>
                     <tr>
                         <th width="75">用户名</th>
                         <th>改变数量</th>
                         <th>当前数量</th>
                         <th>详情</th>
                         <th>时间</th>
                     </tr>
                     <s:iterator var="data" value="dataList">
                     <tr>
                         <td>${data.userName}</td>
                         <td>${data.changeNum}</td>
                         <td>${data.nowNum}</td>
                         <td>
                           <c:choose>
                              <c:when test="${data.changeType==1001}">系统赠送</c:when>
                              <c:when test="${data.changeType==1002}">商城增加-${data.param}</c:when>
                              <c:when test="${data.changeType==1003}">商城退款-${data.param}</c:when>
                              <c:when test="${data.changeType==1004}">同名账户转账-${data.fromUser}</c:when>
                              <c:when test="${data.changeType==1005}">第三方应用增加-${data.fromUser}</c:when>
                              <c:when test="${data.changeType==1006}">商城税收获得-${data.param}</c:when>
                              <c:when test="${data.changeType==1007}">商城临时存放-${data.param}</c:when>
                              <c:when test="${data.changeType==2001}">商城消费-${data.param}</c:when>
                              <c:when test="${data.changeType==2002}">商城退款-${data.param}</c:when>
                              <c:when test="${data.changeType==2003}">同名账户转账消耗-${data.fromUser}</c:when>
                              <c:when test="${data.changeType==2004}">商城临时存放转出-${data.param}-${data.fromUser}</c:when>
                              <c:otherwise>${data.changeType}</c:otherwise>
                           </c:choose>
                         </td>
                         <td><fmt:formatDate value="${data.createdTime}" type="both"/></td>
                     </tr>
                     </s:iterator>
                 </table>
                 <div class="page">
                    <%--  <p><aldtags:pageTag paraStr="startDate1,${startDate1},endDate1,${endDate1}"/>
                      </p> --%>
                 </div>
             </div>
</div><font face="宋体" style="font-size: 11pt"><aldtags:pageTag paraStr="startDate1,${startDate1},endDate1,${endDate1},zuser,${zuser}"/>
</font> 
</tr> 
</table> 
</div> 
</html> 
<script type="text/javascript">
		$('#startDate1').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
		
		$('#endDate1').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>