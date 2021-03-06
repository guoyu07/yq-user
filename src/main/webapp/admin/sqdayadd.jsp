<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<title>各地区！-双区进单明细</title>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 var url="sqdayaddexceltime?startDate="+Form.startDate.value+"&endDate="+Form.endDate.value+"&sheng="+Form.sheng.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>

<p style="margin-top: 0; margin-bottom: 0"><font size="2">
<a href="?day=0" style="text-decoration: none">今天：<font color="#FF00FF">${bean.jt/20}</font></a>&nbsp;<a href="sqdayadd?day=-1" style="text-decoration: none">昨天：</a></font><font size="2" color="#0000FF"><a href="sqdayadd?day=-1" style="text-decoration: none"><font color="#008000">${bean.zt/20}</font></a>&nbsp;</font><font size="2"><a href="sqdayadd?day=-2" style="text-decoration: none">前天：<font color="#FF0000">${bean.qt/20}</font></a><a href="?day=-3" style="text-decoration: none">&nbsp;大前天：<font color="#000080">${bean.dqt/20}</font></a><a href="sqdayadd" style="text-decoration: none">&nbsp;全部</a>&nbsp;【<a href="sqdayaddexcel?day=-1" target="_blank" style="text-decoration: none">导出昨天excel</a>】&nbsp;【<a href="sqdayaddexcel?day=-2" target="_blank" style="text-decoration: none">导出前天excel</a>】</p>
<p> <form method="post" action="searchByTime" name="Form" id="Form">
		 	开始日期:<input name="startDate" id="startDate" type="text" value="${startDate}"/>结束日期:<input name="endDate" id="endDate" type="text" value="${endDate}"/>
		 	      <select name="sheng"  id="sheng">
                      <option <c:if test="${empty sheng }">selected= "selected"</c:if> value="">==不限制省份==</option>
		<s:iterator var="data" value="provinceList">
		                      <option value="${data.b}"  <c:if test="${data.b==sheng}">selected= "selected"</c:if>>${data.b}</option>
		</s:iterator>
                    </select>
	<input type="submit" value="查询"/><input type="button" onClick="exportExcel()" value="导出excel"/></form></p>

<table border="0" cellspacing="0" width="100%" cellpadding="0" height="70">
  <tr> 
    <td width="100%" style="border-left: 1px solid #E5EAC2; border-right: 1px solid #E5EAC2; border-bottom: 1px solid #E5EAC2" height="70" bgcolor="#D7FFE3">
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<font size="2" face="宋体"> 
</font></p>
	<div align="center">    
          <table border="1" cellspacing="0" width="100%" bordercolor="#FFFFFF" style="border-collapse: collapse" cellpadding="0" height="64">
            <tr> 
              <td width="79" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">编号</strong></font></td>
              <td width="123" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong>用户名</strong></font></td>
              <td width="83" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">单数</strong></font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">推荐人</font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">推荐人充值时间</font></td>
              <td width="142" align="center" height="30" bgcolor="#FFE1FF"><font size="2">姓名</font></td>
              <td width="304" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">地址</strong></font></td>
              <td width="164" align="center" height="30" bgcolor="#FFE1FF"><font size="2">手机</font></td>
              <td width="159" align="center" height="30" bgcolor="#FFE1FF"><font size="2">qq</font></td>
              <td width="168" align="center" height="30" bgcolor="#FFE1FF"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font face="宋体" size="2">升级时间</font></b></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
                <td height="35" width="79" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${data.id}</font></td>
                <td width="123" align="center" bgcolor="#FAF8E6"><b><font size="2" color="#008000"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font face="宋体">${data.username}</font></font></b></td>
                <fmt:parseNumber var="i" integerOnly="true" 
                       type="number" value="${data.sjb*10000/20}" />
                <td valign="middle" width="83" align="center"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#000000" size="2" face="宋体">${i}</font></td>
                <td align="center" width="142" bgcolor="#C0C0C0"><font size="2"><a target="_blank" href="bdbList?user=${data.up}">${data.up}</a></font></td>
                <td valign="middle" align="center" width="142" bgcolor="#C0C0C0"><font size="2">${data.upgmdate}</font></td>
                <td valign="middle" align="center" width="142"><font size="2">${data.name}</font></td>
                <td valign="middle" align="center" width="304"><p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><font color="#0000FF" size="2" face="宋体">${data.addsheng}${data.addshi}${data.addqu}</font></td>
                <td valign="middle" align="center" width="164"><font size="2">${data.call}</font></td>
                <td valign="middle" align="center" width="159"><font size="2">${data.qq}</font></td>
                <td valign="middle" align="center" width="168"><font face="宋体" size="1"><b>${data.bddate}</b></font></td>
              </tr>
              </s:iterator>
            </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag para1="day" value1="${day}" para2="startDate" value2="${startDate}"  para3="endDate"  value3="${endDate}" para4="sheng" value4="${sheng}"/>
</font> 
</tr> 
</table> 
<font face="宋体" size="2"> 
</div> </div>
</font>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">　</p>
<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
<a href="javascript:history.back();" style="text-decoration: none">
<font color="#FF6600" style="font-weight: 700" face="宋体" size="2">返回上一页</font></a></p>
<font face="宋体" size="2">
</body>
</font>
</font>
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