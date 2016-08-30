<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1635825042'/>！');history.go(-1);</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
<script type="text/javascript" src="/images/jquery.min.js"></script>
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
		alert ("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-2036326914'/>!！");
		Form.user.focus();
		return false;
	}
	var uName=document.Form.user.value;
	var data= null;
	$.post("yb?username="+uName,data, function(response) {
		if(response.erroCodeNum==0){//注册<s:text name='reg1.jsp.reg1.jsp.799375'/>
			alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.945991493'/>：'+response.yb);
		}else{
			alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1777679097'/>！');
		}
		return true;
	});
}

function checkdate()  {
	 if (Form.shpa.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-781315880'/>!");  Form.shpa.focus();      return false;    }
	  if (Form.sfpay.value=="") {     alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1672844946'/>!");  Form.sfpay.focus();      return false;    }
	  if (Form.user.value=="") {     alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.751820177'/>!");  Form.user.focus();      return false;    }
	  if (Form.pa01.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1841070946'/>!");  Form.pa01.focus();      return false;    }
	  if (Form.pa02.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1544222851'/>!");  Form.pa02.focus();      return false;    }
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=11&toUserName="+Form.user.value, data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1886666017'/>"); return false; }
		settime($("#btn"));
		alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1886721436'/>");
	});
	return false;
}  

function checkdate1()  {  
	  if (Form.shpa.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-781315880'/>!");  Form.shpa.focus();      return false;    }
	  if (Form.sfpay.value=="") {     alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1672844946'/>!");  Form.sfpay.focus();      return false;    }
	  if (Form.user.value=="") {     alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.751820177'/>!");  Form.user.focus();      return false;    }
	  if (Form.pa01.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1841070946'/>!");  Form.pa01.focus();      return false;    }
	  if (Form.pa02.value=="") {      alert("<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1544222851'/>!");  Form.pa02.focus();      return false;    }
  //if (Form.sfcode.value=="") {   alert("请先点击<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>，然后再填入您的<s:text name='reg.jsp.reg.jsp.806479'/>收到的验证码");  Form.sfcode.focus();   return false;    }
  	  var data = $("#Form").serialize();
	  $.post("ybsf?status=1", data, function(response) {
		    var responseMsg = response;
			if(responseMsg.erroCodeNum==0){//注册<s:text name='reg1.jsp.reg1.jsp.799375'/>
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.801114631'/>！');
				location.replace('ybsf');
				return false;
			}else if(responseMsg.erroCodeNum==1){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1635825042'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==2){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1519470525'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==3){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.274591465'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==4){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-155027371'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==5){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-1103003435'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==6){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.2037393748'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==7){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1747166923'/>！');
				return false;
			}else if(responseMsg.erroCodeNum==8){
				alert('<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.2053058834'/>！');
				return false;
			}
		});
  return false;
} 
</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span>${gcuser.name}</span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.871323142'/>：<span class="c-r">${gcuser.name}</span></p>
						<p class="z-b" style="padding-left:70px;"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-535714675'/>：：<b class="c-r">${gcuser.username}</b></p>
						<form class="form form4 e6b" method="post" action="" id="Form" name="Form" onSubmit="return checkdate1()">
							<p><label class="c-r"><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.-535714675'/>：</label>${gcuser.username}<input type="hidden" name="sh" size="20" value="${gcuser.username}" readonly></p>
							<p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.630954966'/>：</label><input type="password" name="shpa" size="20"></p>
							<p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.871278941'/>：</label><input style="width:100px;" type="text" name="sfpay" onKeyUp="value=value.replace(/[^\d]/g,'');rst(this.value)" size="20"></p>
                            <p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.26044037'/>(2%)：</label><input id="pay10" type="text" name="pay10" size="20" readonly><input type="hidden" name="remark" size="5" value="12" readonly></p>
                            <p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.675858010'/>：</label><input id="ybpay" type="text" name="ybpay" size="15" readonly></p>
                            <p><label><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.29623262'/>：</label><input type="text" name="user" size="20"><input type="button" onClick="Check()" value="<s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.1725871048'/>" name="B3" style="cursor: pointer"></p>
                            <p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>：</label><input type="password" name="pa01" size="20"></p>
                            <p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.630954966'/>：</label><input type="password" name="pa02" size="20" maxlength="20"></p>
                            <p><label><s:text name='resetUserPass.jsp.resetUserPass.jsp.-1704827075'/>：</label><input name="sfcode" size="10"><input id="btn" type="button" onClick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2" style="cursor: pointer"></p>
							<p><label></label><button class="but1" type=submit  name=submit2  onClick="return confirm('提示：您确定支付了吗？')">确定支付</button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"));
</script>
