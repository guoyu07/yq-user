<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-61194610'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1523887120'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1770252909'/>');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1147694370'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3001}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-47326774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.246684949'/>！');location.replace('/userscoreslog');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language="JavaScript"> 
 function checkdate(){  
  if (Form.jzpay.value=="") {      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1476772112'/>!");      return false;    } 
  if (Form.jzpay.value<0) {      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.778936623'/>0!");      return false;    } 
  if (Form.jzuser.value=="") {      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1569959089'/>!");      return false;    }
  if (Form.adgl.value=="") {      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-201974515'/>!");      return false;    }
  if (Form.dbz.value=="" && document.getElementById("C1").checked) { alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1237533928'/>!"); return false;  }
 }

 function setmaller(txlb){  
	  if (Form.fromUser.value=="") {      alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.618310955'/>!");      return false;    } 
	  $("#btnn").attr("disabled","disabled");
		//var data = $("#Form").serialize();
		$.post("/maller?fromUser="+Form.fromUser.value+"&txlb="+txlb, null, function(response) {
			$("#btnn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1097836932'/>"); return false; }
			if(txlb==3){
				alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1580305552'/>");
			}else{
				alert("<s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.1059539826'/>！");
			}
		});
	  
 }
 
function dbz_show(){
	if (document.getElementById("C1").checked)
		document.getElementById("dbz").style.display="";
	else{
		document.getElementById("dbz").style.display="none";
		document.getElementById("dbz").value="";
	}
}   

</script>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>
				<%@ include file="/view/yblc.jsp" %>
				
			</div>
			<div class="z-l">
				<div class="content-box1">
					<div class="content-title">
						<span><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1199974190'/></span>
					</div>
					<div class="content-form">				 
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="/backscores?status=1">
						    <p><label class="c-r"><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1081070777'/></label><input type="text" name="fromUser" size="15" maxlength="20"><button class="but1" type="button" value="设置成商户" name="btnn" id="btnn"  onClick="setmaller(3)"><s:text name="viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1081070777a"></s:text></button><button class="but1" type="button" value="<s:text name="viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1081070777a"></s:text>" name="btnn" id="btnn"  onClick="setmaller(0)"><s:text name="viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.-1081070777b"></s:text></button></p>
							<p><label class="c-r"><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.198636997'/>：</label><input type="text" name="jzuser" size="15" maxlength="20"></p>
							<p><label><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129727398'/>：</label><input style="width:100px;" type="text" name="jzpay" size="15"></p>
							<p><label><s:text name='viewyblc-mallbackscores.jsp.yblc-mallbackscores.jsp.789039466'/></label><input type="password" name="pa3" size="15"></p>
							<p><label><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129224748'/>：</label><input type="text" name="yy" size="20"></p>
							<p><label><input type="checkbox" name="C1" id="C1" onclick="dbz_show()" value="1" style="width:auto; vertical-align: middle;border:none;"> <s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614'/>：</label><input type="text" name="dbz" id="dbz" size="20"></p>
							<p><label></label><button class="but1" type=submit value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614a'/>" name=submit2  onClick="return confirm('<s:text name='viewjflc-jfmr-2.jsp.jflc-jfmr-2.jsp.600719861'/>？')"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.537856614a'/></button></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script language="JavaScript">dbz_show()</script>
