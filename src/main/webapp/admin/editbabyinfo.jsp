<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('关键参数不能为空！请重新填写！');location.href='editBaby?id=${id}';</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('操作密码错误！');location.href='editBaby?id=${id}';</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('修改成功！');location.href='editBaby?id=${id}';</script></c:if>
<c:if test="${erroCodeNum==2001}"><script language=javascript>alert('删除成功！');location.href='editBaby?id=${id}';</script></c:if>
<c:if test="${erroCodeNum==2002}"><script language=javascript>alert('恢复成功！');location.href='editBaby?id=${id}';</script></c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<script type="text/javascript"> 
function checkdate()  {
	if (Form.babyName.value=="") {      alert("请填入宝宝姓名!");  Form.babyName.focus();      return false;    }
	  if (Form.babyAge.value=="") {      alert("请填入宝宝年龄!");  Form.babyAge.focus();      return false;    }
	  if (Form.dadyName.value=="") {      alert("请填入爸爸姓名!");  Form.dadyName.focus();      return false;    }
	  if (Form.dadyAge.value=="") {      alert("请填入爸爸年龄!");  Form.dadyAge.focus();      return false;    }
	  if (Form.dadyCall.value=="") {      alert("请填入爸爸联系方式!");  Form.dadyCall.focus();      return false;    }
	  if (Form.momName.value=="") {      alert("请填入妈妈姓名!");  Form.momName.focus();      return false;    }
	  if (Form.momAge.value=="") {      alert("请填入妈妈年龄!");  Form.momAge.focus();      return false;    }
	  if (Form.momCall.value=="") {      alert("请填入妈妈联系方式!");  Form.momCall.focus();      return false;    }
	  if (Form.address.value=="") {      alert("请填入详细的地址!");  Form.address.focus();      return false;    }
	  if (Form.details.value=="") {      alert("请填入宝宝的描述!");  Form.details.focus();      return false;    }
	  if (Form.pa3.value=="") {      alert("请输入二级密码密码!");    Form.pa3.focus();  return false;    }
	return true;
}  
function urlencode (str) {  
    str = (str + '').toString();   

    return encodeURIComponent(str).replace(/!/g, '%21').replace(/'/g, '%27').replace(/\(/g, '%28').  
    replace(/\)/g, '%29').replace(/\*/g, '%2A').replace(/%20/g, '+');  
} 

function sub(st){
	var pass = $("#opPassDel").val();
	if(pass==""){
		alert("操作密码不能为空！");
		return false;
	}
	if(st==0&&$("#deleteName").val()){
		alert("恢复人不能为空");
		return false;
	}
	if(st==1&&$("#recoverName").val()){
		alert("删除人不能为空");
		return false;
	}
	if(st==0){
		location.href="recBaby?id=${data.id}&opPa="+pass+"&st="+st+"&deleteName="+urlencode($("#deleteName").val())+"&recoverName="+urlencode($("#recoverName").val());
	}
	if(st==1){
		location.href="delBaby?id=${data.id}&opPa="+pass+"&st="+st+"&deleteName="+urlencode($("#deleteName").val())+"&recoverName="+urlencode($("#recoverName").val());
	}
	
	
}
</script>

<body bgcolor="#DDFFDD">
<form method="post" action="editBaby?st=1&id=${id}" name="Form" id="Form" onSubmit="return checkdate()">
	<div align="center">
	<p><b><font color="#FF0000" size="5">资料修改</font></b></p>
	<p><label>用户名：</label>${data.userName}</p>
	<p><label>姓名：</label>${data.name}</p>
							<p><label>宝宝姓名：</label><input type="text" name="babyName" value="${data.babyName}"></p>
							<p><label>宝宝年龄：</label><input type="text"  name="babyAge" value="${data.babyAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label>宝宝性别：</label><select name="babySex"><option value="男" <c:if test="${data.babySex=='男'}">selected</c:if>>男</option><option value="女" <c:if test="${data.babySex=='女'}">selected</c:if> >女</option></select></p>
							<p><label>爸爸姓名：</label><input type="text" name="dadyName" value="${data.dadyName}"></p>
							<p><label>爸爸年龄：</label><input type="text"  name="dadyAge" value="${data.dadyAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label>联系方式：</label><input type="text"  name="dadyCall" value="${data.dadyCall}" /></p>
							<p><label>妈妈姓名：</label><input type="text" name="momName" value="${data.momName}"></p>
							<p><label>妈妈年龄：</label><input type="text"  name="momAge"  value="${data.momAge}" onKeyUp="value=value.replace(/[^\d]/g,'')"/></p>
							<p><label>联系方式：</label><input type="text"  name="momCall"  value="${data.momCall}" /></p>
							<p><label>地址：</label><input type="text" name="address" value="${data.address}"></p>
							<p><label>宝宝描述：</label><textarea rows="5" name="details" cols="30">${data.details}</textarea>100字以内</p>
							<p><label>修改人：</label><input type="text" name="editName" value="${data.editName}"></p>
							<c:if test="${not empty data.editTime}"><p><label>修改时间：</label>${data.editTime}</p></c:if>
							<p><label>操作密码：</label><input type="password" name="opPa"></p>
							<p><label></label><button class="but1" type="submit">确定</button></p>
		<table border="0" id="table2" height="200" width="800" cellspacing="1">
		<c:if test="${data.status==0}">
	    <tr>
			<td width="800" align="right">
			是否删除该姓名【<font color="#FF0000" size="5">${data.babyName}</font>】
			删除人:<input type="text" name="deleteName" id="deleteName" size="10" value="" />
			操作密码:<input type="password" name="opPassDel" id="opPassDel" size="10" value="" />
			<c:if test="${not empty data.recoverName}">
			  恢复人：${data.recoverName}
			</c:if>
		   <input type="button" value="确认删除" onClick="sub(1);" /></td>
		</tr>
		</c:if>
		<c:if test="${data.status==1}">
	    <tr>
			<td width="800" align="right">
			是否恢复该姓名【<font color="#FF0000" size="5">${data.babyName}</font>】
			恢复人:<input type="text" name="recoverName" id="recoverName" size="10" value="" />
			操作密码:<input type="password" name="opPassDel" id="opPassDel" size="10" value="" />
			<c:if test="${not empty data.deleteName}"> 删除人：${data.deleteName}</c:if><input type="button" value="确认恢复" onClick="sub(0);" /></td>
		</tr>
		</c:if>
		</table>
		</form>
	</div>
</form>
</body>
</html>