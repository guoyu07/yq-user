<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('操作密码错误！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('身份证号码${tduserid}已经存在，不能重复！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('不存在该记录${tdId}');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('添加成功');location.href="tduser?cjpa=${cjpa}";</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('修改成功');location.href="tduser?cjpa=${cjpa}";</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('用户转换成功');location.href="tduser?cjpa=${cjpa}";</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert("被转用户不存在${fromUserName}");history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('接收用户不存在${toUserName}');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('${toUserName}的身份证信息已退过户了，不能重复退户！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('${toUserName}和${fromUserName}已属于同一同名账号，无法退户，误操作？');history.go(-1);</script></c:if>
<html>
<title>历史退户记录</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="main/style.css">
</head>
<c:if test="${empty cjpa}">
<p>请先设置操作密码</p>
<p><form method="POST" action="" name="form">操作密码：<input type="password" name="cjpa" size="15"> <input type="submit" value="设置操作密码" name="B1"></form></p>
</c:if>
<c:if test="${not empty cjpa}">
<table border="0" width="1242" id="table1" cellspacing="0" cellpadding="0" height="114">
	<tr>
		<td width="324"></td>
		<td height="40" width="918"><form method="POST" action="tduser?sst=1" name="form1">任意数值：<input type="text" name="suser" size="20"><input type="hidden" name="cjpa" size="20" value="${cjpa}" readonly> <input type="submit" value="搜索" name="B2"></form></td>
	</tr>
	<tr>
		<td height="74" align="center" colspan="2">
		   <c:if test="${status==0}">
				<c:set var="str" value="新增"></c:set>
				<c:set var="action" value="tduser-add"></c:set>
			</c:if> <c:if test="${status==1}">
				<c:set var="str" value="确定修改"></c:set>
				<c:set var="action" value="tduser-edit?tdId=${tdId}"></c:set>
			</c:if>
			<form method="POST" action="${action}" name="form2">
			<table border="1" width="100%" id="table2" cellspacing="1" style="border-collapse: collapse" height="55">
				<tr>
					<td align="center">姓名</td>
					<td align="center">身份证</td>
					<td align="center">用户名</td>
					<td align="center">手机</td>
					<td align="center">QQ</td>
					<td align="center" width="278"><input type="hidden" name="cjpa" size="10" value="${cjpa}" readonly></td>
				</tr>
				<tr>
					<td align="center"><input type="text" name="tdname" size="15" value="${tuser.tdname}"></td>
					<td align="center"><input type="text" name="tduserid" size="20" value="${tuser.tduserid}"></td>
					<td align="center"><input type="text" name="tduser" size="20" value="${tuser.tduser}"></td>
					<td align="center"><input type="text" name="tdcall" size="20" value="${tuser.tdcall}"></td>
					<td align="center"><input type="text" name="tdqq" size="20" value="${tuser.tdqq}"></td>
					
					<td align="center" width="278"><input type="hidden" name="status" size="3" value="${status}" readonly><input type="submit" value="${str}" name="B3"></td>
				</tr>
			</table>
		</form>
		</td>
		</tr>
</table>

<form method="POST" action="tduser-transfer" name="form1">
			<table border="1" width="100%" id="table2" cellspacing="1" style="border-collapse: collapse" height="55">
			<tr><td align="center" width="278">退户转让</td></tr>
				<tr>
					<td align="left">退户用户名:<input type="text" name="fromUserName" size="20" >（<font color='red'>请填退户的用户下的任意一个同名用户的登录用户名</font>）<input type="hidden" name="cjpa" size="10" value="${cjpa}" readonly /></td>
				</tr>
				<tr>
				<td align="left">接收用户名:<input type="text" name="toUserName" size="20" >（<font color='red'>退户用户的所有同名用户都会转到该用户名下，密码，姓名，身份证，地址，银行卡都会修改成为该用户的</font>）</td>
				</tr>
				<tr><td align="center" width="278"><input type="submit" value="账户退户" name="B4" onClick="return confirm('该过程不可逆，确定要如此做吗？');"></td></tr>
			</table>
		</form>
<c:if test="${sst==1}">
<DIV class=box>
<DIV class=box_con style=" text-align:left">
  <table border="0" cellspacing="1" width="100%" height="28">
    <tr>
      <td width="100%" height="26"><p align="center"><font color="#000000" face="楷体" size="5"><strong>已记录的名单</strong></font></td> 
  </tr>
</table>
	<font face="宋体" size="2">
</font>    
          <table width="100%" border="1" height="80" style="border-collapse: collapse">
            <tr> 
              <td align="center" bgcolor="#C0C0C0"><b>编号</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>姓名</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>身份证</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>用户名</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>手机</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>QQ</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>添加时间</b></td>
              <td align="center" bgcolor="#C0C0C0"><b>操作</b></td>
             
              </tr>
              <s:iterator var="data" value="dataList">
              <tr> 
              <td align="center" height="30">${data.id}</td>
              <td align="center" height="30">${data.tdname}</td>
              <td align="center" height="30">${data.tduserid}</td>
              <td align="center" height="30">${data.tduser}</td>
              <td align="center" height="30">${data.tdcall}</td>
              <td align="center" height="30">${data.tdqq}</td>
              <td align="center" height="30">${data.tddate}</td>
              <td align="center" height="30"><form method="POST" action="tduser-search?status=1" name="form3"><input type="hidden" name="cjpa" size="10" value="${cjpa}" readonly><input type="hidden" name="tdId" size="5" value="${data.id}" readonly><input type="submit" value="修 改" name="B4"></form></td>
              </tr>
             </s:iterator>
     </table> 
</div><font face="宋体" size="2"> <aldtags:pageTag para1="cjpa" value1="${cjpa}" para2="suser" value2="${suser}" para3="sst" value3="${sst}"/>
</font>
</c:if>
</c:if>
</body></html>