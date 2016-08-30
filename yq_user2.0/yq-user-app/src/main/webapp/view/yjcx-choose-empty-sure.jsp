<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1610007112'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1396378774'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-394660049'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1923400400'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1060799146'/>！！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1996562206'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==7}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1380597198'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==8}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1649708849'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==9}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1817862406'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==10}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.153703061'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==11}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1554447127'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==12}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1554447127'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==13}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-131078147'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==14}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1541818965'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==15}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1917340790'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==16}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1463370214'/>！');history.go(-2);</script></c:if>
<c:if test="${erroCodeNum==17}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1086940459'/>！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==100}"><script language=javascript>alert('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-632272473'/>！');history.go(-1);</script></c:if>
 <!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<style type="text/css">
	.zzbg{display:none;position:fixed;width:100%;height:100%;background:#000;z-index:2;top:0;left:0;opacity:0.7;}
	.zzcontent{display:none;width:500px;height:50px;position:fixed;top:50%;margin-top:-150px;background:#fff;z-index:3;left:50%;margin-left:-250px;}
</style>
	<script type="text/javascript" src="images/jquery.min.js"></script>
<script language="JavaScript">
 function checkdate()  { 
  
		$("#btn").attr("disabled","disabled");
		var data = $("#Form").serialize();
		$.post("/sms?op=2", data, function(response) {
			$("#btn").removeAttr("disabled");
			if (response.erroCodeNum!=0) { alert("<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1886666017'/>"); return false; }
			settime($("#btn"));
			alert("<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1886721436'/>");
		});
	return false;
}  

function checkdate1()  {  
  if (Form.ceid.value=="") {   alert("<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-352812950'/>");  Form.ceid.focus();   return false;    }
  return true;
} 
</script>
</head>
<body>
<div class="zzbg"></div>
<div class="zzcontent">
<h2 align="center"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.579202987'/>本页！</h2>
</div>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp"%>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<%@ include file="/view/user.jsp" %>
                <%@ include file="/view/yjcx.jsp" %>
			</div>
			<div class="z-l">
				<div class="content-box2">
					<div class="content-title">
						<span><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.1201559896'/></span>
					</div>
					<div class="form_tj">
						<a style="font-size: 16px; color: #ff6600; float:right;" href="javascript:history.back();"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.326654005'/></a>
						<form class="form form3 formtj"  method="POST" action="bdreg" name="Form" id="Form" onSubmit="return showZz()">
						<input type="hidden" name="targetdate" size="8">
						<input type="hidden" name="status" size="8" value="1" />
	                    <input type="hidden" name="xmlmode" size="8">
	                    <input type="hidden" name="cjpay" size="10" value="${cjpay}" readonly><input type="hidden" name="remark" size="8" value="3" readonly><input type="hidden" name="user" size="10" value="${userName}" readonly>
							<p><label><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.473018246'/>：</label><b style="color: #ff0000;"><input type="hidden" name="up" size="10" value="${up}" readonly>${up}</b></p>
							<p><label><s:text name='viewyjcx-choose-empty.jsp.yjcx-choose-empty.jsp.779063'/><s:text name='reg.jsp.reg.jsp.29623262'/>：</label><input type="hidden" name="bduser" size="10" value="${bduser}" readonly>${bduser}</p>
							<p><label><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.473018246'/>：</label>
								<font color="#008000"><b>${cjpay}</b></font><input type="hidden" name="pa1j" size="8" value="${pa1j}"><input type="hidden" name="pa2j" size="8" value="${pa2j}">（将从您的（<b>${userName}</b>）<c:if test="${cjpay<9000}"><s:text name='viewzhgl-tmzhgl.jsp.zhgl-tmzhgl.jsp.643073'/></c:if><c:if test="${cjpay>=9000}">报单币</c:if>账户扣除${cjpay}）
							</p>
							<c:if test="${cjpay<9000}">
							   <p><label><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1539312043'/>：</label>${call}</p>
							   <p><label><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1704827075'/>：</label><input type="text" name="ceid" size="8" /><input id="btn" type="button"
										onclick="checkdate()" value="<s:text name='resetUserPass.jsp.resetUserPass.jsp.1753968781'/>" name="B2" /></p>
							</c:if>
							<p align="center"><input class="but1" type="submit" value="确认无误" name="B1" onClick="{if(confirm('<s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-1719272165'/>?')){this.style.visibility='hidden';return true;}return false;}" /></p>
							<p align="center"><b><font color="#FF0000"><s:text name='viewyjcx-choose-empty-sure.jsp.yjcx-choose-empty-sure.jsp.-2118781725'/>！</p>
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

function showZz(){
    $('.zzbg').fadeIn(200);
    $('.zzcontent').fadeIn(400);
    return true;
}
</script>
