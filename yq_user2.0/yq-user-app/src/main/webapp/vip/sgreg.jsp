<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('结算期间暂停开户，明天开放！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('此功能，需联系推荐人选择适合的位置升级！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('接点人不存在，没法放置，请检查是否正确！');history.go(-1);</script></c:if>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.bduser.value=="") {      alert("开户用户名不能为空!");      return false;    } 
  if (Form.cjpay.value==0) {      alert("请选择一个套餐！");      return false;    }
  if (Form.pa1j.value=="") {      alert("请输入登录密码！");      return false;    }
  if (Form.pa2j.value=="") {      alert("请输入二级密码！");      return false;    }
  return true;  }  
 </script>
<div align="center">
	<form method="POST" action="bdreg" name="Form" onSubmit="return checkdate()">
		<p>　</p>
		<p>　</p>
		<table border="0" width="53%" id="table1" height="194" cellspacing="1">
			<tr>
				<td align="right" width="31%">选择接点人：</td>
				<td width="68%"><input type="hidden" name="up" size="8" readonly value="${myup}"><b><font color="#FF0000">${myup}</font></b></td>
			</tr>
			<tr>
				<td align="right" width="31%">开户用户名：</td>
				<td width="68%"><input type="text" name="bduser" size="15" value="${bdid}"><font size="2" color="#000080"> 系统默认从左到右放置</font></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right">选择套餐：</td>
				<td align="center" width="68%"><p align="left"><b>
              <select size="1" name="cjpay">
				<option selected value="0">==请选择您要消费的套餐==</option>
				<option value="10000">1万-报单币</option>
				<option value="20000">2万-报单币</option>
				<option value="50000">5万-报单币</option>
				<option value="1000">1千（一币）</option>
				<option value="2000">2千（一币）</option>
				<option value="5000">5千（一币）</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right">输入登录密码：</td>
				<td align="center" width="68%"><p align="left"><input type="password" name="pa1j" size="20"></td>
			</tr>
			<tr>
				<td align="center" width="31%"><p align="right">输入二级密码：</td>
				<td align="center" width="68%"><p align="left"><input type="password" name="pa2j" size="20"></td>
			</tr>
			<tr>
				<td align="center" width="98%" colspan="2"><font color="#800000"><span style="font-size: 11pt">费用将从您的（</font><b><font color="#008000">${userName}</font></b><font color="#800000">）报单币或一币账户扣除</font></span></td>
			</tr>
		</table>
		<p><input type="submit" value="提交" name="B1" style="font-size: 12pt; font-weight: bold" ></p>
	</form>
<p align="center">　</p>
<p align="center"><a href="javascript:history.back();" style="text-decoration: none"><font color="#FF6600" style="font-weight: 700" size="4">返回上一页</font></a></p>
<p>　</div>