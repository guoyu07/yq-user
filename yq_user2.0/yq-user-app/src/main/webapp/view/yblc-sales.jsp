<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1713705348'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.834213896'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1543089961'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-817035023'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2053058834='/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.165401067'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.939890499'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1027680370'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.2057159235'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='VIP_users_can_not_withdraw_cash'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='nosuremanytimesforclose'/>！');history.go(-1);</script></c:if>

<c:if test="${erroCodeNum==-1}"><script language=javascript>alert('<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1862966729'/>！');location.replace('epmcjl');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/ecmascript" src="images/md5.js"></script>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.txpay.value==0) {      alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-861806777'/>!");      return false;    }
  if (!chkinteger(Form.txpay.value)){
	alert('<s:text name='vipuserpay.jsp.userpay.jsp.431301541'/>!');
	document.Form.txpay.focus;
	return false;
 }
 function chkinteger(checkStr) {
		var checkOK = "0123456789";
		var allValid = true;
		for (i=0; i<checkStr.length; i++) {
		ch = checkStr.charAt(i);
		if (checkOK.indexOf(ch) == -1) {
		allValid = false;
		break;
		}
		if ((ch == '+' || ch == '-') && i>0) {
		allValid = false;
		break;
		}
		}
		return (allValid);
  }
 
  
  if (Form.txpay.value> ${gcuser.pay} ) { <c:if test="${transferType==1}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977'/>"); </c:if> <c:if test="${transferType==2}"> alert("<s:text name='vipuserpay.jsp.userpay.jsp.1247340977a'/>"); </c:if>     return false;    }
  if (Form.txpay.value<100) {      alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1837041227'/>!");      return false;    } 
  if (Form.pa3.value=="") {      alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1989247238'/>!");      return false;    } 
	
	$("#btn").attr("disabled","disabled");
	var data = $("#Form").serialize();
	$.post("/sms?op=3", data, function(response) {
		$("#btn").removeAttr("disabled");
		if (response.erroCodeNum!=0) { alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1886666017'/>"); return false; }
		settime($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
		alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1886721436'/>");
	});
	return false;
}  

function checkdate1()  {  
  if (Form.ybcodeid.value=="") {   alert("<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-352812950'/>");  Form.ybcodeid.focus();   return false;    }
  return true;
}
</script>	
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yblc.jsp" %>
                
			</div>
						<div class="z-l">
				<div class="content-box1 new7" style="height:190px;">
					<div class="content-title">
						<span><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/><s:text name='viewjflc-jfmc.jsp.jflc-jfmc.jsp.682340'/></span>
					</div>
					<div class="content-form">
						 <h4><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1523778640'/></h4>  
						 <p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.398889769'/>！</p>
						<p style="color: red;">2.<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.476105277'/></p>
					</div>
				</div>
				<div class="content-box2 mth10" >
					<div style="color: #515151;">
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1318893197'/></p>
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.36915859'/>：<b style="color: red"><c:if test="${transferType==1}"><c:if test="${gcuser.pay<1}"> 0${gcuser.pay-gcuser.vippay} </c:if><c:if test="${gcuser.pay>=1}"> ${gcuser.pay-gcuser.vippay} </c:if></c:if><c:if test="${transferType==2}">${gcuser.pay}</c:if></b><s:text name='yibi'/></p>
					</div>
					<div class="z-cb">
					<form class="form form3" style="width: 420px; float:left;" method="POST" name="Form" id="Form" onSubmit="return checkdate1()" action="userpay?status=1">
							<p><label><s:text name='reg.jsp.reg.jsp.29623262'/>：</label>${userName}</p>
							<p><label><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-586037884'/>：</label><select size="1" name="txpay">
								<option selected value="0">=<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1646927970'/>=</option>
								<option value="100">100</option>
								<option value="200">200</option>
								<option value="500">500</option>
								<option value="1000">1000</option>
								<option value="2000">2000</option>
								<option value="5000">5000</option>
								<option value="10000">10000</option>
								<option value="20000">20000</option>
								<option value="30000">30000</option>
								</select></p>
							<p><label><s:text name='reg.jsp.reg.jsp.630954966'/>：</label><INPUT name="pa3" size=15 type=password></p>
							<c:if test="${gcuser.ganew!=0}"><p><label><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1451653422'/> name="B2"></span></c:if>
							<p><label></label><button class="but1" type="submit" id="btn"  onClick="return confirm('<s:text name='vipuserpay.jsp.userpay.jsp.-1517150275a'/>')"><s:text name='vipuserpay.jsp.userpay.jsp.-1517150275b'/></button></p>
					</form>
					<%-- <div style=" float:left; padding:30px 0 0 30px; ">
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.931750201'/>：${gcuser.name}</p>
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.775723385'/>：${gcuser.simpleCall}</p>
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.799099710'/>：${gcuser.bank}</p>
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.1141649'/>：${gcuser.card}</p>
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-18488543'/></p>
					</div> --%>
					</div>
					<div style="color: #515151">
						<p><s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-1485487385'/>，<s:text name='viewyblc-sales.jsp.yblc-sales.jsp.-472493681'/>！</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
btnStatus($("#btn"),'<s:text name="#SESSION_LOCALE"/>');
</script>
