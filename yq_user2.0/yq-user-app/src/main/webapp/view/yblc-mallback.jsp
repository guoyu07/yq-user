<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-61194610'/>!');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1119381593'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-752014255'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1476527375'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyblc-transferout.jsp.yblc-transferout.jsp.1129174203'/>不能大于您<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1580362770'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-47326774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.246684949'/>！');location.replace('/datepay');</script></c:if>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
</head>
<script language="JavaScript"> 
 function checkdate(){  
  if (Form.jzpay.value=="") {      alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1060233581'/>!");      return false;    } 
  if (Form.jzpay.value<0) {      alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.311072936'/>0!");      return false;    } 
  if (Form.jzuser.value=="") {      alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1569959089'/>!");      return false;    }
  if (Form.adgl.value=="") {      alert("<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/>!");      return false;    }
  if (Form.dbz.value=="" && document.getElementById("C1").checked) { alert("<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1237533928'/>!"); return false;  }
 }

 
function dbz_show(){
	if (document.getElementById("C1").checked)
		document.getElementById("dbz").style.display="";
	else{
		document.getElementById("dbz").style.display="none";
		document.getElementById("dbz").value="";
	}
}   

function Check(user)
{
	if ( user==""){
		alert ("<s:text name='index.jsp.index.jsp.-2036326914'/>!！");
		return false;
	}
	$.post("checkUserName?user="+user,null, function(response) {
		if(response.code==0){//注册<s:text name='reg1.jsp.reg1.jsp.799375'/>
			alert('<s:text name='reg.jsp.reg.jsp.29623262'/>：['+user+']，<s:text name='reg.jsp.reg.jsp.734362'/>:['+response.name+"]");
		}else{
			alert('<s:text name='reg.jsp.reg.jsp.29623262'/>：'+user+'，<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1911170702'/>！');
		}
		return true;
	});
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
						<span><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.673109126'/></span>
					</div>
					<div class="content-form">				 
						<p class="f-tk c-g"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1396688147'/> <span class="c-r">${userName}</span></p>
						<p class="z-b" style="padding-left:70px;"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-1994385923'/>：<b class="c-r">${gcuser.pay}</b></p>
						<form class="form form4 e6b" method="POST" name="Form" onSubmit="return checkdate()" action="/glpay?status=1">
						    <p><label class="c-r"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792'/>:<input type="text" name="fromUser" id="fromUser" size="15" maxlength="20" value="${userName}"><input type="button" onClick="Check(document.getElementById('fromUser').value)" value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792a'/>" name="B3" style="cursor: pointer"></label></p>
							<p><label class="c-r"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.-377971233'/>:<input type="text" name="jzuser" id="jzuser"  size="15" maxlength="20"><input type="button" onClick="Check(document.getElementById('jzuser').value)" value="<s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.370420792a'/>" name="B3" style="cursor: pointer"></label></p>
							<p><label><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129727398'/>：</label><input style="width:100px;" type="text" name="jzpay" size="15"></p>
							<p><label><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.789039466'/>：</label><input type="password" name="pa3" size="15"></p>
							<p><label><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1129224748'/>：</label><input type="text" name="yy" size="20"></p>
							<p><label><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.1123624651'/>：</label>
							<select name="ration">
							   <option value="0.9" selected>0.9</option>
							   <option value="0.95">0.95</option>
							   <option value="0"><s:text name='viewyblc-mallback.jsp.yblc-mallback.jsp.25870507'/></option>
							</select>
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
