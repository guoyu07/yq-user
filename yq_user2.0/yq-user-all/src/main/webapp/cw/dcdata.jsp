<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>数据导出</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
 <script type="text/javascript">
 function exportExcel(){
	 var url="dcdata?zuser="+Form.zuser.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value+"&tp="+Form.tp.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
 
 
   <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
   <tr><td align="left"><a href="cwindex">一币日志查询</a>|<a href="cjblog">充值币日志查询</a>|<a href="dcdata">导出数据</a></td></tr>
   <tr><td align="center"><font color='red'>注意:单次导出数据量不要过大，如出现导出报错，请主动缩短导出日期！</font></td></tr>
       <tr>
      <td width="100%" height="25"> 
      <form method="post" action="dcdata" name="Form" id="Form">
        <p align="center">用户：
        <select name="zuser" id="zuser">
	      <c:forEach var="li" items="${vipList}">
	         <option value='${li}'  <c:if test="${not empty zuser&&li==zuser}">selected="selected"</c:if> >${li}</option>
	      </c:forEach>
	    </select>
        <select size="1" name="tp">
					<option value="1">一币明细</option>
					<option value="2">充值币明细</option>
		</select>
		 	开始日期:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>结束日期:<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/>
<input type="button" onClick="exportExcel()" value="导出excel"/></p></form></td> 
  </tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
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