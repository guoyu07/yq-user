<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:if test="${erroCodeNum==2}"><script language=javascript>alert('请选择部门！');history.go(-1);</script></c:if>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>科宇科技</title>
		<%@ include file="/manage/commons/meta.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script language="javascript" src="${ctx}/scripts/script.js"></script>
		<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/scripts/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/validate/jquery.validate.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/validate/messages_cn.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(document).ready(function(){
		
			//选中菜单
			$("#system").attr("class","nav hover");
			$(".iframe").colorbox({iframe:true, width:"35%", height:"60%"});
			$("input:radio[name='staffTable.sex'][value='${staffTable.sex}']").attr("checked", true);
			
			//聚焦第一个输入框
			//$("#name").focus();
			//为newForm注册validate函数
			$("#newForm").validate();
		});
		
		function submitForm(){
			/* if (newForm.userTable.adminusername.value==""){
				alert ("账号不能为空！");
				newForm.userTable.adminusername.focus();
				return;
			}
			if (newForm.userTable.password.value==""){
				alert ("密码不能为空！");
				newForm.userTable.password.focus();
				return;
			}
			if (newForm.deptName.value==""){
				alert ("部门不能为空！");
				newForm.deptName.focus();
				return;
			}
			if (newForm.staffTable.fullName.value==""){
				alert ("姓名不能为空！");
				newForm.staffTable.fullName.focus();
				return;
			}
			if (newForm.staffTable.mobilePhone.value==""){
				alert ("电话号码不能为空！");
				newForm.staffTable.mobilePhone.focus();
				return;
			} */
			
			document.getElementById("newForm").submit();
		}
</script>
	</head>
	<body>
		<!-- 头部菜单 -->
		<jsp:include flush="false" page="/manage/admin_menu.jsp" />
		<div style="height: 10px;">
		</div>
		<div class="table_div">
			<form action="/user/createUser.action" method="post" name="newForm" id="newForm">
				<input type="hidden" id="id" name="id" value="${userTable.id}" />
				<table border="0" cellspacing="0" cellpadding="0"  style="width: 100%;">
					<tr>
						<td width="188" valign="top">
							<!-- 嵌入右侧菜单页面 -->
							<%@ include file="/manage/include/adminLeft.jsp"%>
						</td>
						<td valign="top">

							<div class="table_right">

								<div class="moudle_div">

									<div class="sidebar_title">

										<div class="sidebar_title_border">
											现在的位置：用户管理 > 新增用户
										</div>
									</div>

									<div class="div_content border_css"
										style="border: #CCC solid 1px;">
										<div class="form_body">

											<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_item">
												<tr>
													<td height="30" width="220" align="right" class="left_txt2">
														登录帐号：
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="userTable.adminusername" id="userTable.adminusername" type="text" value="${info.adminusername}" class="required"/>
													     <%--  <c:if test="${empty userTable.userName}">
													      	<input name="userTable.userName" id="userTable.userName" type="text" value="${userTable.userName}" class="required"/>
													      </c:if>
													                 	
													      <c:if test="${!empty userTable.userName}">
													      	  <input name="userTable.userName" id="userTable.userName" type="text" disabled="disabled" value="${userTable.userName}" class="required"/>
													      </c:if> --%>
														
													</td>
													<td width="100" align="right">
														<span class="left_txt2">密码 ：</span>
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														  <c:if test="${empty userTable.password}">
													          <input name="userTable.password"  id="userTable.password"  type="password"   value="${info.password}"  class="required"/>
													      </c:if>
													                 	
													      <c:if test="${!empty userTable.password}">
													          <input name="userTable.password"  id="userTable.password"  type="password"  disabled="disabled"  value="${info.password}"  class="required"/>
													      </c:if>
													</td>
												</tr>
												<tr>
													<td height="30" width="220" align="right" class="left_txt2">
														姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="staffTable.fullName" id="staffTable.fullName" type="text" class="required" value="${staffTable.fullName}" />
													</td>
													<td width="100" align="right">
														<span class="left_txt2">性别 ：</span>
													</td>
													<td width="120" colspan="2">
														男
														<input type="radio" name="staffTable.sex" id="sex" checked="checked" value="M" />
														女
														<input type="radio" name="staffTable.sex" id="sex2" value="W" />
													</td>
												</tr>
												<tr>
													<td width="220" align="right">
														<span class="left_txt2">电话 ：</span>
													</td>
													<td width="5" height="30">
														<input style="width: 47px" name="userTable.isOverdue"
															id="userTable.isOverdue" type="text"
															value="${userTable.isOverdue}" />
													</td>
													<td height="30">
														<input name="staffTable.mobilePhone"
															id="staffTable.mobilePhone" type="text"
															value="${staffTable.mobilePhone}" />
													</td>
													<td height="30" align="right" class="left_txt2">
														Email ：
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="staffTable.email" id="staffTable.email"
															type="text" value="${staffTable.email}" />
													</td>
												</tr>
												<tr>
								                    <td height="30" align="right" class="left_txt2">部门 ：</td>
								                    <td width="5">&nbsp;</td>
								                    <td height="30">
								                    	<c:choose>
								                    		<c:when test="${staffTable.departmentId eq null}">
								                    			<input name="deptName"  id="deptName"  type="text"  value="${department.deptName}" class="required"  readonly="readonly"/>
										                        <input name="deptId" id="deptId" value="${department.id}" type="hidden"/>
								                    		</c:when>
								                    		<c:otherwise>
								                    			<input name="deptName"  id="deptName"  type="text"  value="${department.deptName}" class="required"  readonly="readonly"/>
										                        <input name="deptId" id="deptId" value="${department.id}" type="hidden"/>
								                    		</c:otherwise>
								                    	</c:choose>
								                    	  <c:if test="${IS_DEPARTMENT eq true}">
								                    	 	<a class="iframe" href="/manage/department/showDepartmentTree.jsp?eleName=deptName&eleId=deptId">请选择部门</a>
								                    	 </c:if>
								                    </td>
								                 </tr> 
												<tr>
													<td height="30" align="right" class="left_txt2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
													<td height="30">
														&nbsp;
													</td>
													<td align="right">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
													<td height="30">
														
													</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">
														&nbsp;
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30" colspan="2" align="center">
														<span class="left_txt2"> 
														 &nbsp;&nbsp;&nbsp;&nbsp;
														<input name="input" type="button" class="btn_w102_blue" value="保存" onclick="submitForm();"/>&nbsp;&nbsp; 
														<input name="input" type="button" class="btn_w102_blue" value="返回" onclick="history.go(-1);" /> 
														</span>
													</td>

													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td height="17" colspan="6" align="right">
														&nbsp;
													</td>
												</tr>
											</table>
										</div>
										<div style="clear: both;"></div>
									</div>
								</div>

							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="bottom" id="bottom">
			<jsp:include flush="false" page="/manage/down.jsp" />
		</div>
	</body>
</html>

