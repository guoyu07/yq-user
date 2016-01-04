<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>充值记录</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 var url="outdpexcelcharge?&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>充 值 记 录 明 细</strong></font></td> 
  </tr> 
   

  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
    <form method="POST" action="chargeDetails" name="Form" id="Form">
	 开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/><input type="submit" value="查询" name="B1"><input type="button" onClick="exportExcel()" value="导出excel"/>(每次的导出数量不能超过5000条)<br> 
    </form>
 <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr>
          <td width="69" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>编号</strong></font></td>
          <td width="123" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>用户名</strong></font></td>
          <td width="67" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>最近</strong></font></td>
          <td width="71" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">累计</font></td>
          <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值时间</font></td>
          <td width="190" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">充值方式</font></td>
          <td width="127" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原购买者</font></td>
          <td width="108" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作员</font></td>
          <td width="210" align="center" height="29" bgcolor="#C3DAF9">ip地址</td>
          </tr>
          <s:iterator var="data" value="dataList">
          <tr> 
          <td height="29" width="69" align="center"><b>
			<font color="#FF0000" size="2">${data.id}</font></b></td>
          <td height="29" width="123" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.cjuser}</font></td>
          <td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.dqcj}</font></td>
          <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.ljcj}</font></td>
          <td valign="middle" align="center" width="178">${data.qldate}</td>
          <td valign="middle" align="center" width="190">
			<font size="2" face="宋体">${data.cjfs}</font></td>
          <td valign="middle" align="center" width="127">${data.bz}</td>
          <td valign="middle" align="center" width="108">${data.cz}</td>
          <td valign="middle" align="center" width="210">${data.ip}</td>
          </tr>
         </s:iterator>
            </table> 
</div><font face="宋体" style="font-size: 11pt"><aldtags:pageTag paraStr="startDate1,${startDate1},endDate1,${endDate1}"/>
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