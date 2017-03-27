<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>一币变化明细</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 var url="yibidetail?startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;//var url="vipcjbdetailsoutexcel?zuser="+Form.zuser.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
<div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>一币转账记录</strong></font></td> 
  </tr> 
   

  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
    <form method="post" action="readme" name="Form" id="Form">
    <!-- <input type="submit" value="刷新" name="B1">  --><a href="readme" >刷新</a> <a href="logout001" >退出</a>
    <%-- <p align="center">用户：<input name="zuser" id="zuser" type="text" value="${zuser}"/> --%>
	 开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/><input type="submit" value="查询" name="B1"><input type="button" onClick="exportExcel()" value="导出excel"/><br> 
    </form>
 <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
           <tr> 
              <td width="120" align="center" height="27" bgcolor="#C3DAF9"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">商户</strong></font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">成交时间</font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">收入</font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">支出</font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">剩余</font></td>
              <td width="95" align="center" height="27" bgcolor="#C3DAF9"><font color="#000000" face="宋体" size="2">备注</font></td>
           </tr>
          <s:iterator var="data" value="dataList">
              <tr> 
              <td height="31" width="120" align="center"><font color="#000000" face="宋体" size="2">${data.username}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${data.abdate}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${data.syjz}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${data.jc}</font></td>
              <td valign="middle" align="center" width="95"><font color="#000000" face="宋体" size="2">${data.pay}</font></td>
              <td valign="middle" align="center" width="95" ><font color="#000000" face="宋体" size="2">${data.regid}</font></td>
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