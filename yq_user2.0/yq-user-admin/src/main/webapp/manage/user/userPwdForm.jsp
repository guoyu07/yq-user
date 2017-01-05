<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>修改密码</title>
	<%@ include file="/manage/commons/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="${exthome}/resources/css/ext-all.css" />
	<script type="text/javascript" src="${exthome}/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="${exthome}/ext-all.js"></script>
	<script type="text/javascript">
	var p = window.parent;
	var d = p.loadinndlg();
	function newFormSubmit(){
		var newPwd=$("#newPwd").val();
		var password2=$("#password2").val();
		if(newPwd!=password2){
			alert($("#NewPassword_ConfirmPassword_Inconsistent").val());
			return ;
		}
		$.post("/user/savePwd.action", 
		  { newPwd: $("#newPwd").val(),userId:$("#userId").val()},
			function(data){
				alert(data.info);
				p.cancel();	
			},
		 "json");
	}	
	
	function checkedPwd(){
		if(document.getElementById("oldPwd")!=null){
			var oldPwd=$("#oldPwd").val();
			if(oldPwd!=null&&oldPwd!=""){
				$.post("/user/checkedPwd.action", 
				  { oldPwd: oldPwd,userId:$("#userId").val()},
					function(data){
						if (data.success) {
							document.getElementById("msg").innerHTML="";
							p.crebtn('button',$("#Confirm").val(),newFormSubmit);
						} else {
							document.getElementById("msg").innerHTML=data.info;
							document.getElementById("oldPwd").focus();
							p.rembtn('button');
						}
					},
				 "json");
			}
		}else{
			p.crebtn('button',$("#Confirm").val(),newFormSubmit);
		}
	}
	</script>
  </head> 
  <body>
  <input type="hidden" name="NewPassword_ConfirmPassword_Inconsistent" id="NewPassword_ConfirmPassword_Inconsistent" value="新密码与确认密码不一致！" />
  <input type="hidden" name="Confirm" id="Confirm" value="确定" />
  <input type="hidden" name="userId" id="userId" value="<%=request.getParameter("id")%>"/>
  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      	<td>
      		&nbsp;
      	</td>
        <td>
        <form action="" method="post" name="newForm" id="newForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_item">
        <c:if test="${IS_ADMIN eq false}">
        	 <tr>
            	<td width="20%" height="30" align="right" class="left_txt2">旧密码</td>
            	<td width="77%" height="30"><input name="oldPwd" type="password" id="oldPwd" size="30" />&nbsp;&nbsp;&nbsp;<span id="msg" style="color:red"></span></td>
          	</tr>
        </c:if>
          <tr>
            <td height="30" align="right" class="left_txt2">新密码</td>
            <td height="30"><input type="password" name="newPwd" id="newPwd"  size="30" onfocus="checkedPwd();"/></td>
            </tr>
          <tr>
            <td height="30" align="right" valign="top" class="left_txt2">确认密码</td>
            <td height="30"><input type="password" name="password2" id="password2" size="30" onfocus="checkedPwd();"/></td>
            </tr>
          </table>
          </form>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
