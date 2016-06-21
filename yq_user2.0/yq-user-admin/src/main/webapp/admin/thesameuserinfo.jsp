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
     var url="toolstheSameUserInfoToExcel?cardNum="+Form.cardNum.value;
	 window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
 }
 </script>
</head>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="tools!theSameUserInfo" name="Form" id="Form">
			<table border="0" width="100%" id="table1">
			    <tr><td><p align="center"><font color="#000000" face="楷体" size="5"><strong>同名账号信息查询</strong></font></td></tr>
				<tr>
					<td>
					身份证号码：<input name="cardNum" id="cardNum" type="text" value="${cardNum}"/><input type="submit" value="查询" name="B1"><input type="button" onClick="exportExcel()" value="导出excel"/></td>
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
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体"> <strong style="font-weight: 400">姓名</strong></font></td>
              <td width="133" align="center" height="27" bgcolor="#FFE1FF"><font face="宋体" color="#000000" size="2">激活时间</font></td>
              <td width="120" align="center" height="27" bgcolor="#FFE1FF"><font color="#FF0000" size="2" face="宋体">级别</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">充值</font></td>
              <td width="118" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">积分</font></td>
              <td width="112" align="center" height="27" bgcolor="#FFE1FF"><font size="2" face="宋体">买进</font></td>
              <td width="216" align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">卖出</font></td>
              <td  align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">一币</font></td>
               <td  align="center" height="27" bgcolor="#FFE1FF"><font color="#000000" size="2" face="宋体">小结</font></td>
              </tr>
              <c:set var="allChargNum" value="0"></c:set>
              <c:set var="allJf" value="0"></c:set>
              <c:set var="allYb" value="0"></c:set>
              <c:set var="allIn" value="0"></c:set>
              <c:set var="allOut" value="0"></c:set>
              <c:set var="allXj" value="0"></c:set>
              <c:set var="allSjb" value="0"></c:set>
              <s:iterator var="data" value="list">
              <c:set var="allChargNum" value="${allChargNum+data.chargeNum}"></c:set>
              <c:set var="allJf" value="${allJf+data.jf}"></c:set>
              <c:set var="allYb" value="${allYb+data.yb}"></c:set>
              <c:set var="allIn" value="${allIn+data.in}"></c:set>
              <c:set var="allOut" value="${allOut+data.out}"></c:set>
              <c:set var="allXj" value="${allXj+data.xj}"></c:set>
               <c:set var="allSjb" value="${allSjb+data.sjb}"></c:set>
              <tr> 
              <td height="31"  align="center"> <p><font color="#000000" size="2" face="宋体">${data.userName}</font></td>
              <td valign="middle" align="center"> <p><font color="#FF0000" size="2" face="宋体">${data.name}</font></td>
              <td valign="middle" align="center" > <font color="#FF0000" size="2" face="宋体">${data.activiTime}</font></td>
              <td valign="middle" align="center"><font color="#000000" size="2" face="宋体">${data.sjb}</font></td>
              <td valign="middle" align="center"><font color="#000000" size="2" face="宋体">${data.chargeNum}</font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体">${data.jf}</font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${data.in}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${data.out}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体">${data.yb}</font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体">${data.xj}</font></td>
              </tr>
             </s:iterator>
             <tr> 
              <td height="31" width="134" align="center"> <p><font color="#000000" size="2" face="宋体">合计</font></td>
              <td valign="middle" width="133" align="center"> <p><font color="#FF0000" size="2" face="宋体"></font></td>
              <td valign="middle" align="center"> <font color="#FF0000" size="2" face="宋体"></font></td>
              <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体">${allSjb}</font></td>
              <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${allChargNum}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${allJf}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${allIn}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${allOut}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${allYb}" pattern="0"/></font></td>
               <td valign="middle" align="center" ><font color="#000000" size="2" face="宋体"><fmt:formatNumber value="${allXj}" pattern="0"/></font></td>
              </tr>
            </table> 
</div>
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>
