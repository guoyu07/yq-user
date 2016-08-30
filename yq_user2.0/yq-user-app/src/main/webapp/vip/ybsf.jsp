<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script src="/scripts/sms.js"></script>
<script>
function rst(n){
if(n!=""){
document.getElementById('pay10').value=(n*0.02).toFixed(0);
document.getElementById('ybpay').value=(n*1.02).toFixed(0);
}else{
document.getElementById('pay10').value="";
document.getElementById('ybpay').value="";
}
}


function Check()
{
	if ( Form.user.value==""){
		alert ("<s:text name='vipybsf.jsp.ybsf.jsp.-2036326914'/>!！");
		Form.user.focus();
		return false;
	}
	var uName=document.Form.user.value;
	var data= null;
	$.post("yb?username="+uName,data, function(response) {
		if(response.erroCodeNum==0){//注册成功
			alert('<s:text name='vipybsf.jsp.ybsf.jsp.945991493'/>：'+response.yb);
		}else{
			alert('<s:text name='vipybsf.jsp.ybsf.jsp.-1777679097'/>！');
		}
		return true;
	});
}

function checkdate()  {
  	
	//$("#btn").attr("disabled","disabled");
	//var data = $("#Form").serialize();
	//$.post("sms.asp", data, function(data) {
	//	$("#btn").removeAttr("disabled");
	//	if (data != "success") { alert("<s:text name='vipybpay.jsp.ybpay.jsp.1886666017'/>"); return false; }
	//	alert("<s:text name='vipybpay.jsp.ybpay.jsp.1886721436'/>");
	//});
	return false;
}  

function checkdate1()  {  
	  if (Form.shpa.value=="") {      alert("<s:text name='vipybsf.jsp.ybsf.jsp.-781315880'/>!");  Form.shpa.focus();      return false;    }
	  if (Form.sfpay.value=="") {     alert("<s:text name='vipybsf.jsp.ybsf.jsp.-1672844946'/>!");  Form.sfpay.focus();      return false;    }
	  if (Form.user.value=="") {     alert("<s:text name='vipybpay.jsp.ybpay.jsp.751820177'/>!");  Form.user.focus();      return false;    }
	  if (Form.pa01.value=="") {      alert("<s:text name='vipybpay.jsp.ybpay.jsp.1841070946'/>!");  Form.pa01.focus();      return false;    }
	  if (Form.pa02.value=="") {      alert("<s:text name='vipybpay.jsp.ybpay.jsp.1544222851'/>!");  Form.pa02.focus();      return false;    }
  //if (Form.sfcode.value=="") {   alert("<s:text name='vipybpay.jsp.ybpay.jsp.-352812950'/>");  Form.sfcode.focus();   return false;    }
  	  var data = $("#Form").serialize();
  	  alert(data);
	  $.post("ybsf?status=1", data, function(response) {
			alert(response);		     
		    var responseMsg = response;
			if(responseMsg.erroCodeNum==0){//注册成功
				alert('<s:text name='vipybsf.jsp.ybsf.jsp.801114631'/>！');
				location.replace('ybsf');
				return false;
			}else if(responseMsg.erroCodeNum==1){
				alert('<s:text name='vipybsf.jsp.ybsf.jsp.1635825042'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==2){
				alert('<s:text name='vipybsf.jsp.ybsf.jsp.-1519470525'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==3){
				alert('<s:text name='vipybpay.jsp.ybpay.jsp.274591465'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==4){
				alert('<s:text name='vipybpay.jsp.ybpay.jsp.-155027371'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==5){
				alert('<s:text name='vipybpay.jsp.ybpay.jsp.-1103003435'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==6){
				alert('<s:text name='vipybpay.jsp.ybpay.jsp.2037393748'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==7){
				alert('<s:text name='vipybpay.jsp.ybpay.jsp.1747166923'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==8){
				alert('<s:text name='vipybsf.jsp.ybsf.jsp.2053058834'/>！');
				return false;
			}
		});
  return false;
} 
</script>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<body topmargin="0" bgcolor="#FFEBC1">
<form method="post" action="" id="Form" name="Form" onSubmit="return checkdate1()">
	<input type="hidden" name="targetdate" size="8">
	<input type="hidden" name="xmlmode" size="8">
	<div align="center">
	　<p><font size="6" color="#FF0000">${gcuser.name}</font></p>
	<table border="0" id="table1" height="326" width="560">
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybsf.jsp.ybsf.jsp.871323142'/>：</td>
			<td width="336" align="left"><font color="#0000FF"><b>${gcuser.name}</b></font></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25">商户<s:text name='vipybpay.jsp.ybpay.jsp.29623262'/>：</td>
			<td width="336" align="left" height="18"><font color="#008000"><b>${gcuser.username}</b></font><input type="hidden" name="sh" size="20" value="${gcuser.username}" readonly></td>
			</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybpay.jsp.ybpay.jsp.630954966'/>：</td>
			<td width="336" align="left" height="23"><font color="#008000"><input type="password" name="shpa" size="20"></font></td>
			</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybsf.jsp.ybsf.jsp.871278941'/>：</td>
			<td width="336" align="left"><input type="text" name="sfpay" onKeyUp="value=value.replace(/[^\d]/g,'');rst(this.value)" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybpay.jsp.ybpay.jsp.26044037'/>(2%)：</td>
			<td width="336" align="left"><input id="pay10" type="text" name="pay10" size="20" style="color: #0000FF" readonly><input type="hidden" name="remark" size="5" value="12" readonly></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybpay.jsp.ybpay.jsp.702617'/>一币：</td>
			<td width="336" align="left"><b><font color="#FF0000"><input id="ybpay" type="text" name="ybpay" size="15" style="; color: #FF0000; font-weight: bold" readonly></font></b></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybpay.jsp.ybpay.jsp.29623262'/>：</td>
			<td width="336" align="left" height="25"><b><font color="#0000FF"><input type="text" name="user" size="20"><input type="button" onClick="Check()" value="<s:text name='vipybsf.jsp.ybsf.jsp.-391780560'/>" name="B3"></font></b></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybpay.jsp.ybpay.jsp.927803061'/>：</td>
			<td width="336" align="left" height="25"><input type="password" name="pa01" size="20"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="25"><s:text name='vipybpay.jsp.ybpay.jsp.630954966'/>：</td>
			<td width="336" align="left" height="25"><span style="font-size: 9pt"><font size="1"><input type="password" name="pa02" size="20" maxlength="20"></font></span></td>
		</tr>
		<tr>
			<td width="214" align="right"><s:text name='vipybpay.jsp.ybpay.jsp.-1704827075'/>：</td>
			<td width="333" align="left"><input name="sfcode" size="10"><input id="btn" type="button" onClick="checkdate()" value="<s:text name='vipybpay.jsp.ybpay.jsp.1753968781'/>" name="B2"></td>
		</tr>
		<tr>
			<td width="214" align="right" height="57"><p align="center">　</td>
			<td width="336" align="right" height="57"><p align="left"><span style="font-size: 9pt"><font size="1"><input type="submit" value="<s:text name='vipybpay.jsp.ybpay.jsp.-1071255236'/>" name="B1" onClick="return confirm('提示：您<s:text name='vipybpay.jsp.ybpay.jsp.-1071255236'/>了吗？')" style="font-family: 楷体_GB2312; font-size: 14pt; font-weight: bold; "></font></span></td>
		</tr>
		</table>
	<p><s:text name='vipybpay.jsp.ybpay.jsp.-1255245828'/>！</p>
	</div>
</form>
