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
		 /* function querydata(){
			  var order = $("#orderId").val();
			  if (order==""){
					alert("订单号不能为空！");
					Form.orderId.focus();
					return false;
				}
		  } */
</script>
<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>商城一币订单查询</strong></font></td> 
  </tr> 
   

  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
    <form method="POST" action="datepayfororder?status=1" name="Form" id="Form">
	<p align="center">商城订单号：<input name="orderId" id="orderId" type="text" />
		 	<%-- 开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/> --%><input type="submit" value="查询" name="B1"><!-- <input type="button" onClick="exportExcel()" value="导出excel"/ --><br>
    </form>
 <div align="center">    
          <div class="content-table">
                 <table>
							<tr>
								<th width="75">用户名</th>
								<th>一币收入</th>
								<th>一币支出</th>
								<th>金币收入</th>
								<th>金币支出</th>
								<th>剩余一币</th>
								<th>剩余金币</th>
								<th width="100">更新时间</th>
								<th width="135">备注</th>
							</tr>
							<s:iterator var="data" value="dataList">
							<tr align="center" height="29" bgcolor="#C3DAF9">
								<td  valign="middle" width="67" align="center">${data.username}</td>
								<td>${data.syjz}</td>
								<td><c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></td>
								<td>${data.jyjz}</td>
								<td><c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></td>
								<td>${data.pay}</td>
								<td>${data.jydb}</td>
								<td><fmt:formatDate value="${data.abdate}" type="both"/></td>
								<td>${data.regid}</td>
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