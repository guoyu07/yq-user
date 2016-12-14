<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>充值记录</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<!--  <script type="text/javascript">
 function exportExcel(){
	 var url="outputSysBiExcel?zuser="+Form.zuser.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
 --><div align="center">

  <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#006699" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="22" background="images/admin_bg_1.gif"> 
        <p align="center" style="margin-top: 0; margin-bottom: 0">
		<font color="#000000" style="font-size: 11pt" face="宋体"><strong>玩 家 信 息 修 改 记 录 详 情</strong></font></td> 
  </tr> 
   

  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="87" bgcolor="#C3DAF9">
    <form method="POST" action="searchmodifyuserlog?status=1" name="Form" id="Form">
	<p align="center">用户：<input name="zuser" id="zuser" type="text" value="${zuser}"/>
		 	<%-- 开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/> --%><input type="submit" value="查询" name="B1"><!-- <input type="button" onClick="exportExcel()" value="导出excel"/> --><br>
    </form>
 <div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr>
          <td width="69" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>被修改用户名</strong></font></td>
          <!--<td width="123" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			 <font face="宋体" color="#000000" size="2"><strong>原二级密码</strong></font></td>
			<td width="123" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" size="2"><strong>二级密码</strong></font></td> -->
          <td width="67" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>原银行卡号</strong></font></td>
			<td width="67" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>银行卡号</strong></font></td>
			<td width="67" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>原开户行</strong></font></td>
			<td width="67" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"> <strong>开户行</strong></font></td>
          <td width="71" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">原真实名字</font></td>
			<td width="71" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font face="宋体" color="#000000" style="font-weight:700" size="2">真实名字</font></td>
		  <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原电话号码</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">电话号码</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原Email</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">Email</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原QQ</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">QQ</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原身份证号码</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">身份证号码</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原提现限制</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">提现限制</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原继承人</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">继承人</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原身份证</font></td>
			 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">身份证</font></td>
			<!--  <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原登录密码（加密后）</font></td>
				 <td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">登录密码（加密后）</font></td> -->
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原机票限制时间</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">机票限制时间</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原诚信指数</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">诚信指数</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">原国际编码</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">国际编码</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作日期</font></td>
			<td width="178" align="center" height="29" bgcolor="#C3DAF9"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" style="font-weight:700" face="宋体" size="2">操作人</font></td>
			
          </tr>
          <s:iterator var="data" value="dataList">	
          <tr> 
          <td height="29" width="69" align="center"><b>
			<font color="#FF0000" size="2">${data.username}</font></b></td>
         <%--  <td height="29" width="123" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.oldpassword3}</font></td>
			 <td height="29" width="123" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.password3}</font></td> --%>
          <td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2">${data.oldcard}</font></td>
			<td valign="middle" width="67" align="center"><p style="margin-top: 0; margin-bottom: 0">
			<font color="#000000" face="宋体" size="2"><c:choose><c:when test="${data.oldcard!=data.card}"><font color="#FF0000" size="2">${data.card}</font></c:when><c:otherwise>${data.card}</c:otherwise></c:choose></font></td>
          <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldbank}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldbank!=data.bank}"><font color="#FF0000" size="2">${data.bank}</font></c:when><c:otherwise>${data.bank}</c:otherwise></c:choose></font></td>
		 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldname}</font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldname!=data.name}"><font color="#FF0000" size="2">${data.name}</font></c:when><c:otherwise>${data.name}</c:otherwise></c:choose></font></td>
		 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldcall}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldcall!=data.call}"><font color="#FF0000" size="2">${data.call}</font></c:when><c:otherwise>${data.call}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldemail}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldemail!=data.email}"><font color="#FF0000" size="2">${data.email}</font></c:when><c:otherwise>${data.email}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldqq}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldqq!=data.qq}"><font color="#FF0000" size="2">${data.qq}</font></c:when><c:otherwise>${data.qq}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.olduserid}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.olduserid!=data.userid}"><font color="#FF0000" size="2">${data.userid}</font></c:when><c:otherwise>${data.userid}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldpayok}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldpayok!=data.payok}"><font color="#FF0000" size="2">${data.payok}</font></c:when><c:otherwise>${data.payok}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldjcname}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldjcname!=data.jcname}"><font color="#FF0000" size="2">${data.jcname}</font></c:when><c:otherwise>${data.jcname}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldjcuserid}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldjcuserid!=data.jcuserid}"><font color="#FF0000" size="2">${data.jcuserid}</font></c:when><c:otherwise>${data.jcuserid}</c:otherwise></c:choose></font></td>
			<%--  <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldmd5password}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.md5password}</font></td> --%>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldpwdate}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldpwdate!=data.pwdate}"><font color="#FF0000" size="2">${data.pwdate}}</font></c:when><c:otherwise>${data.pwdate}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldcxt}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldcxt!=data.cxt}"><font color="#FF0000" size="2">${data.cxt}</font></c:when><c:otherwise>${data.cxt}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.oldareacode}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体"><c:choose><c:when test="${data.oldareacode!=data.areacode}"><font color="#FF0000" size="2">${data.areacode}</font></c:when><c:otherwise>${data.areacode}</c:otherwise></c:choose></font></td>
			 <td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.operatedate}</font></td>
			<td valign="middle" align="center" width="71"><p style="margin-top: 0; margin-bottom: 0">
			<font size="2" face="宋体">${data.operator}</font></td>
			
          </tr>
         </s:iterator>
            </table> 
</div><font face="宋体" style="font-size: 11pt"><aldtags:pageTag paraStr="zuser,${zuser},status,1"/>
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