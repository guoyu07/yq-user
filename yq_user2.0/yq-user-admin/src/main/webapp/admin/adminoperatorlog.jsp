<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>后台管理操作日志</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<!--  <script type="text/javascript">
 function exportExcel(){
	 var url="outExcel?admin="+Form.admin.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
 --><div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>后台管理操作日志</strong></font></td> 
  </tr> 
   

  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
    <form method="POST" action="adminoperatelog" name="Form" id="Form">
	<p align="center">管理员：<input name="admin" id="admin" type="text" value="${admin}"/>
		 	开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/>
		 	<select size="1" name="beizhu">
					<option  <c:if test="${empty beizhu or beizhu==0}">selected</c:if> value="0">全部</option>
					<option value="2024" <c:if test="${beizhu==2024}">selected</c:if>>后台vip入账充值币</option>
		            <option value="2026" <c:if test="${beizhu==2026}">selected</c:if>>修改vip信息</option>
		            <option value="2027" <c:if test="${beizhu==2027}">selected</c:if>>报单币转账</option>
		            <option value="2031" <c:if test="${beizhu==2031}">selected</c:if>>商城转账</option>
		            <option value="2032" <c:if test="${beizhu==2032}">selected</c:if>>消费一币</option>
		            <option value="2033" <c:if test="${beizhu==2033}">selected</c:if>>備用報單幣</option>
		            <option value="2034" <c:if test="${beizhu==2034}">selected</c:if>>改變金幣</option>
		            <option value="2035" <c:if test="${beizhu==2035}">selected</c:if>>改變積分</option>
		            <option value="2036" <c:if test="${beizhu==2036}">selected</c:if>>一幣補貼</option>
		            <option value="2037" <c:if test="${beizhu==2037}">selected</c:if>>積分自動買入</option>
		            <option value="2038" <c:if test="${beizhu==2038}">selected</c:if>>積分自動賣出</option>
		            <option value="2039" <c:if test="${beizhu==2039}">selected</c:if>>體現審核</option>
		            <option value="2040" <c:if test="${beizhu==2040}">selected</c:if>>提现免審核</option>
		            <option value="2041" <c:if test="${beizhu==2041}">selected</c:if>>重置一幣體現訂單</option>
		            <option value="2042" <c:if test="${beizhu==2042}">selected</c:if>>提现退回</option>
		            <option value="2043" <c:if test="${beizhu==2043}">selected</c:if>>系统管理后台登录</option>
		             <option value="2017" <c:if test="${beizhu==2017}">selected</c:if>>商户后台登录</option>
					</select><input type="submit" value="查询" name="B1">
		 	<!-- <input type="button" onClick="exportExcel()" value="导出excel"/> --><br>
    </form>
 <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr>
          <td width="69" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>操作者</strong></font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作时间</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作描述</font></td>
          </tr>
          <s:iterator var="data" value="dataList">	
          <tr> 
          <td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.operator}</font></td>
			<td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.operateDate}</font></td>
			<td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.operateDesc}</font></td>
          </tr>
         </s:iterator>
            </table> 
</div><font face="宋体" style="font-size: 11pt"><aldtags:pageTag paraStr="admin,${admin},beizhu,${beizhu},startDate1,${startDate1},endDate1,${endDate1}"/>
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