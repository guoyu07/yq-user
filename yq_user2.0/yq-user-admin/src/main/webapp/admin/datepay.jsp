<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>一币变化明细</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK rel=stylesheet type=text/css href="main/style.css">
</head>
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="0" width="100%" cellpadding="0" height="108">
    <tr>
      <td width="100%" height="25"> 
        <form method="POST" action="datepay" name="form">
			<table border="0" width="100%" id="table1">
				<tr>
					<td width="521"><p align="right"><font color="#000000" face="楷体" size="5"><strong>一 币 变 化 明 细</strong></font></td>
					<td width="10">　</td>
					<td width="113"><select size="1" name="beizhu">
					<option  <c:if test="${empty beizhu or beizhu==0}">selected</c:if> value="0">全部</option>
					<option value="141" <c:if test="${beizhu==141}">selected</c:if>>推广奖</option>
		            <option value="103" <c:if test="${beizhu==103}">selected</c:if>>平衡奖</option>
		            <option value="105" <c:if test="${beizhu==105}">selected</c:if>>辅导奖</option>
		            <option value="108" <c:if test="${beizhu==108}">selected</c:if>>积分卖出</option>
		            <option value="111" <c:if test="${beizhu==111}">selected</c:if>>卖出 一币 </option>
		            <option value="144" <c:if test="${beizhu==144}">selected</c:if>>认购 一币 </option>
		            <option value="118" <c:if test="${beizhu==118}">selected</c:if>>同名互转</option>
		            <option value="122" <c:if test="${beizhu==122}">selected</c:if>>退款</option>
		            <option value="123" <c:if test="${beizhu==123}">selected</c:if>>冲销销售一币</option>
		            <option value="127" <c:if test="${beizhu==127}">selected</c:if>>VIP转收</option>
		            <option value="146" <c:if test="${beizhu==146}">selected</c:if>>一币 消费 </option>
		            <option value="137" <c:if test="${beizhu==137}">selected</c:if>>票务支出 </option>
		            <option value="138" <c:if test="${beizhu==138}">selected</c:if>>话费充值 </option>
		            <option value="116" <c:if test="${beizhu==116}">selected</c:if>>app端消费</option>
					</select></td>
					<td><input type="submit" value="提交" name="B1"></td>
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
              </tr>
             </s:iterator>
            </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag para1="beizhu" value1="${beizhu}"/>
</font> 
</tr> 
</table> 
</div> </div>
<p align="center">
<a href="javascript:history.back();" style="text-decoration: none">
					<font color="#FF6600" style="font-size: 12pt; font-weight: 700">返回上一页</font></a></p>
</body> 
</html>