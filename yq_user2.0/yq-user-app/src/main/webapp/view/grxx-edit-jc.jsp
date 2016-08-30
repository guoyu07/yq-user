<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<script language="JavaScript"> 
		 function checkdate()  {
		
		 if (Form.jcname.value=="") {      alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-849491093'/>!");  Form.jcname.focus();    return false;    }
		 if (Form.jcname.value.length<2) {      alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1970552070'/>!");   Form.jcname.focus();     return false;    } 
		 if (Form.jcname.value.length>8) {      alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1715922523'/>!");   Form.jcname.focus();     return false;    }
		 if (Form.jcuserid.value=="") {      alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1596209606'/>!");  Form.jcuserid.focus();      return false;    }
		 if (Form.jcuserid.value.length<18) {      alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1560156081'/>!"); Form.jcuserid.focus();     return false;    } 
		 if (Form.jcuserid.value.length>18) {      alert("<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1814845210'/>!"); Form.jcuserid.focus();     return false;    }
		
		  var data = $("#Form").serialize();
		  $.post("updateuserjc?status=1", data, function(response) {
				if(response.erroCodeNum==0){//注册成功
					alert('<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-1456138858'/>！');
					return false;
				}else if(response.erroCodeNum==1){
					alert('<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-26097813'/>');
					return false;
				}else{
					alert('<s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-745085746'/>.['+response.erroCodeNum+']');
					return false;
				}
			});
		  return true;
		 }  
</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<%@ include file="/view/head.jsp"%>
		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp"%>

				<%@ include file="/view/grxx.jsp"%>
			</div>
			<div class="z-l">
				<div class="content-box1 new5-box">
					<div class="content-title">
						<span><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/></span>
						<p class="r-link">
							<a href="userga"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.616632997'/></a>|
							<a href="#" class="hover"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.709350807'/></a>
						</p>
					</div>
					<div class="content-form">				 
						<p style="color: red; padding-bottom: 40px;"><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-2147423581'/>！</p>
						<form class="form" METHOD="post" action="" name="Form" id="Form" onSubmit="return false">
							<p><label><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.708938076'/>：</label><input type="text" maxlength=32 name="jcname" value="${gcuser.jcname}" size="16" <c:if test="${not empty gcuser.jcname}">readonly</c:if> ></p>
							<p><label><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.1224987511'/>：</label><input type="text" maxlength=19 name="jcuserid" value="${gcuser.jcuserid}" size="22" <c:if test="${not empty gcuser.jcuserid}">readonly</c:if> ></p>
							<p><label></label><button class="but1" onClick="checkdate();"><s:text name='increase'/></button></p>
					</form>
					</div>
					<div class="new5-right">
						<h3><s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.-948760164'/></h3>
                        <p><a target="_blank" href="images/积分游戏平台用户名转让申请书.doc">《积分游戏平台用户名转让申请书》</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
