<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>一币变化明细</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 var url="outdpexcel?zuser="+Form.zuser.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value+"&beizhu="+Form.beizhu.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
</head>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="datepay2" name="Form" id="Form">
			<table border="0" width="100%" id="table1">
			    <tr><td><p align="center"><font color="#000000" face="楷体" size="5"><strong>一 币 变 化 明 细</strong></font></td></tr>
				<tr>
					<td>
					用户：<input name="zuser" id="zuser" type="text" value="${zuser}"/>
		 	开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/>
	
					<select size="1" name="beizhu">
					<option  <c:if test="${empty beizhu or beizhu==0}">selected</c:if> value="0">全部</option>
					<option value="141" <c:if test="${beizhu==141}">selected</c:if>>推广奖</option>
		            <option value="103" <c:if test="${beizhu==103}">selected</c:if>>平衡奖</option>
		            <option value="105" <c:if test="${beizhu==105}">selected</c:if>>辅导奖</option>
		            <option value="108" <c:if test="${beizhu==108}">selected</c:if>>积分卖出</option>
		            <option value="111" <c:if test="${beizhu==111}">selected</c:if>>卖出 一币 </option>
		            <option value="144" <c:if test="${beizhu==144}">selected</c:if>>认购 一币 </option>
		            <option value="118" <c:if test="${beizhu==118}">selected</c:if>>同名互转</option>
		            <option value="127" <c:if test="${beizhu==127}">selected</c:if>>VIP转收</option>
		            <option value="146" <c:if test="${beizhu==146}">selected</c:if>>一币 消费 </option>
		            <option value="137" <c:if test="${beizhu==137}">selected</c:if>>票务支出 </option>
		            <option value="138" <c:if test="${beizhu==138}">selected</c:if>>话费充值 </option>
		            <option value="116" <c:if test="${beizhu==116}">selected</c:if>>app端消费</option>
					</select><input type="submit" value="查询" name="B1"><input type="button" onClick="exportExcel()" value="导出excel"/></td>
				</tr>
			</table>
		</form>
		</td>
  </tr>
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="84" bgcolor="#E5EAC2">
	<font face="宋体" size="2"><br></font>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="57">
            <tr> 
              <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">用户名</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">一币收入</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">一币支出</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体">金币收入</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">金币支出</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">剩余一币</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">剩余金币</font></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">更新时间</font></td>
              <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">备注</font></td>
               <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">折扣</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
              <td height="31" width="134" align="center"> <p><font color="#000000" size="2" face="宋体">${data.username}</font></td>
              <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体">${data.syjz}</font></td>
              <td valign="middle" align="left" width="133"><p align="center"><font size="2" face="宋体">
              <c:if test="${data.jc>0}">-${data.jc}</c:if><c:if test="${data.jc<=0}">${data.jc}</c:if></font></td>
              <td valign="middle" align="center" width="120"> <font color="#FF0000" size="2" face="宋体">${data.jyjz}</font></td>
              <td valign="middle" align="center" width="118"><font size="2" face="宋体">
              <c:if test="${data.dbjc>0}">-${data.dbjc}</c:if><c:if test="${data.dbjc<=0}">${data.dbjc}</c:if></font></td>
              <td valign="middle" align="center" width="118"><font color="#000000" size="2" face="宋体">${data.pay}</font></td>
              <td valign="middle" align="center" width="112"><font size="2" face="宋体">${data.jydb}</font></td>
              <td valign="middle" align="center" width="216"><font color="#000000" size="2" face="宋体">${data.abdate}</font></td>
              <td valign="middle" align="center" width="247"><font color="#000000" size="2" face="宋体">${data.regid}</font></td>
               <td valign="middle" align="center" width="247"><font color="#000000" size="2" face="宋体">${data.ration}</font></td>
              </tr>
             </s:iterator>
            </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag paraStr="zuser,${zuser},startDate1,${startDate1},endDate1,${endDate1},beizhu,${beizhu}"/>
</font> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
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