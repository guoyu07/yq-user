<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('操作密码错误！');history.go(-1);</script></c:if>
<html>
<title>口才训练营管理</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
 <script type="text/javascript">
 function exportExcel(){
	 
	 if(Form.opPa.value==''){
		 alert("请出入查询密码！");
		 Form.opPa.focus();      
		 return false; 
	 }
	 
	 var url="outBabyExcel?paramStr="+Form.paramStr.value+"&startDate1="+Form.startDate1.value+"&endDate1="+Form.endDate1.value+"&status="+Form.status.value+"&opPa="+Form.opPa.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 
 function check(){
	 if(Form.opPa.value==''){
		 alert("请出入查询密码！");
		 Form.opPa.focus();      
		 return false; 
	 }
 }
 </script>
</head>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="babyList" name="Form" id="Form" onSubmit="return check();">
			<table border="0" width="100%" id="table1">
			    <tr><td><p align="center"><font color="#000000" face="楷体" size="5"><strong>口才训练营列表</strong></font></td></tr>
				<tr>
					<td>
					查询密码:<input name="opPa" id="opPa" type="password" value="${opPa}"/>，
					[用户名]或[名字]或[宝宝名字]或[爸爸名字]或[爸爸联系方式]或[妈妈名字]或[妈妈联系方式]：<input name="paramStr" id="paramStr" type="text" value="${paramStr}"/>，
		 	报名日期在:<input name="startDate1" id="startDate1" type="text" value="${startDate1}"/>和<input name="endDate1" id="endDate1" type="text" value="${endDate1}"/>之间.
	                 <select name="status">
	                     <option value="" <c:if test="${empty status}">selected</c:if>>全部</option>
	                    <option value="0" <c:if test="${status==0}">selected</c:if>>只看未删除</option>
	                    <option value="1" <c:if test="${status==1}">selected</c:if>>只看已删除</option>
	                 </select>
					<input type="submit" value="查询" name="B1"><input type="button" onClick="exportExcel()" value="导出excel"/></td>
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
             <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">序号</strong></font></td>
              <td width="134" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2"><strong style="font-weight: 400">用户名</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体"> <strong style="font-weight: 400">名字</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">宝宝姓名</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">宝宝年龄</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">宝宝性别</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">爸爸姓名</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">爸爸年龄</font></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">爸爸联系方式</font></td>
                            <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">妈妈姓名</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">妈妈年龄</font></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">妈妈联系方式</font></td>
              <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">地址</font></td>
               <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">宝宝描述</font></td>
                <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">报名时间</font></td>
                <td width="247" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">操作</font></td>
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
              <td height="31" width="134" align="center"> <p><font color="#000000" size="2" face="宋体">${data.id}</font></p></td>
              <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.userName}</font></p></td>
              <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.name}</font></p></td>
               <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.babyName}</font></p></td>
                <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.babyAge}</font></p></td>
                 <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.babySex}</font></p></td>
                  <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.dadyName}</font></p></td>
                   <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.dadyAge}</font></p></td>
                    <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.dadyCall}</font></p></td>
                     <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.momName}</font></p></td>
                      <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.momAge}</font></p></td>
                       <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.momCall}</font></p></td>
                        <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.address}</font></p></td>
                         <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.details}</font></p></td>
                         <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体">${data.createdTime}</font></p></td>
                          <td valign="middle" width="133" align="center"> <p><font color="#000000" size="2" face="宋体"><a target="_blank" href="editBaby?id=${data.id}">修改</a></font></p></td>
              </tr>
             </s:iterator>
            </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag paraStr="paramStr,${paramStr},startDate1,${startDate1},endDate1,${endDate1},status,${status},opPa,${opPa}"/>
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