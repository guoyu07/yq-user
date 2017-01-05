<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>科宇科技</title>
		<%@ include file="/manage/commons/meta.jsp"%>
		<link rel="stylesheet" href="${ctx}/scripts/zTree/zTreeStyle/zTreeStyle.css" type="text/css" />
		<script type="text/javascript" src="${ctx}/scripts/zTree/jquery.ztree.core-3.0.js"></script>
		<script type="text/javascript" src="${ctx}/scripts/zTree/jquery.ztree.excheck-3.0.js"></script>
		<script type="text/javascript" src="${ctx}/scripts/loadTree/departmentTree.js"></script>
		<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<script src="${widgethome}/open/lhgdialog.js" type=text/javascript></script>
		<script type="text/javascript">
		$(document).ready(function(){
			loadDepartmentTree();//加载tree
		});
		function sub(){
			var userName=$("#queryUserName").val() ;
			$.post("/user/pageList.action",{ajax: "true", "queryUserName": userName},
					   function(data){
			              $("#biaoge").html(data);
					   });
		}
		</script>
	</head>
	<body>
		<jsp:include flush="false" page="/manage/admin_menu.jsp" />
		<div style="height: 10px;">
		</div>
		<div class="table_div">
			<table border="0" cellspacing="0" cellpadding="0" width=""
				style="width: 100%;">
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
										现在的位置：系统管理 > 用户管理
									</div>
								</div>
								<div class="seach_div">
									用户名
									<input name="queryUserName" id="queryUserName" type="text" value="${userName}" />
									&nbsp;&nbsp;
									<label for="select4"></label>
									<label for="select"></label>
									&nbsp;&nbsp;
									<input name="input" type="button" " value="查询"
										class="btn_w66_write" onclick="sub()" />
								</div>
								<div class="div_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="180" height="100%" valign="top"
												style="border: #dedee0 1px solid;">
												<div class="modlue_menu_div">
													<ul id="departmentTree" class="ztree"></ul>
												</div>
											</td>
											<td width="100%" height="100%" valign="top">
												<div id="biaoge"></div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
				</tr>
			</table>
		</div>
		<div class="bottom" id="bottom">
			<jsp:include flush="false" page="/manage/down.jsp" />
		</div>
	</body>
</html>

