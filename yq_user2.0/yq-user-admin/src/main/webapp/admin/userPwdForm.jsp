<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('密码不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==3}"><script language=javascript>alert('玩家不存在！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==4}"><script language=javascript>alert('修改密码失败！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==5}"><script language=javascript>alert('确认密码不能为空！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==6}"><script language=javascript>alert('两次输入密码不一致！');history.go(-1);</script></c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>修改密码</title>
	<%@ include file="/manage/commons/meta.jsp"%>
	<script type="text/javascript">
	function FormSubmit(){
		if(Form.newPwd.value!=Form.password2.value){
			alert("新密码与确认密码不一致！");
			Form.password2.focus();
			return false;
		}
		if (Form.newPwd.value==""){
			alert ("请输入密码！");
			Form.newPwd.focus();
			return false;
		}
		if (Form.password2.value==""){
			alert ("请输入确认密码！");
			Form.password2.focus();
			return false;
		}
		var data = $("#Form").serialize();
		  $.post("/admin/saveWd", data, function(response) {
				if(response.erroCodeNum==0){
					alert('更新密码成功! 请重新登录！');
					window.location.href ="/adminindex";
				}
			});
		
		
		
	}
	
	</script>
  </head> 
  <body>
  <input type="hidden" name="userId" id="userId" value="<%=request.getParameter("id")%>"/>
  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      	<td>
      		&nbsp;
      	</td>
        <td>
        <form action="/admin/saveWd" method="post" name="Form" id="Form">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_item">
          <tr>
            <td height="30" align="right" class="left_txt2">新密码</td>
            <td height="30"><input type="password" name="newPwd" id="newPwd"  size="30" /></td>
            </tr>
          <tr>
            <td height="30" align="right" valign="top" class="left_txt2">确认密码</td>
            <td height="30"><input type="password" name="password2" id="password2" size="30" /></td>
            </tr>
            <tr>
            <td ></td>
            <td ><input type="button" name="Confirm" id="Confirm" onclick="FormSubmit()" value="确定" /></td>
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
