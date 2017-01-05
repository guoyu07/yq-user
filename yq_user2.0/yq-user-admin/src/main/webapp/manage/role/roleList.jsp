<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>科宇科技
		</title>
		<%@ include file="/manage/commons/meta.jsp"%>
		<script language="javascript" src="${ctx}/scripts/script.js"></script>
		<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/jquery-1.3.2.js"></script>
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$(".iframe").colorbox({iframe:true, width:"35%", height:"60%"});
		});
		
		function subString(str){
			return str.substr(0,str.lastIndexOf(','))
		}
		
		function dataDelete(url){
			var boxs = document.getElementsByName('table_id');
			var data = "";
			//对象不存在,不处理,跳出方法
			if (!boxs) {
				return;
			}
			//获取选中行的ID
			for (i = 0; i < boxs.length; i++) {
				if (boxs[i].checked == true) {
					data += boxs[i].value + ",";
				}
			}
			//没有选择提示错误
			if (data == "") {
				alert($("#MustSelectCol").val());
				return;
			}
			//确认用户是否删除选中数据
			if (data != "") {
				if (!confirm($("#AreYouSureDeleteTheseData").val())) {
					return;
				}
			} else {
				return;
			}
			window.location.href = url+'?ids='+subString(data);
		}
</script>
	</head>
	<body>
		<input type="hidden" name="AreYouSureDeleteTheseData" id="AreYouSureDeleteTheseData" value="您确定要删除当前选中的这些数据吗?" />
		<input type="hidden" name="MustSelectCol" id="MustSelectCol" value="请选择要删除的列\!" />
		<!-- 头部菜单 -->
		<jsp:include flush="false" page="/manage/admin_menu.jsp" />
		<div style="height: 10px;">
		</div>
		<div class="table_div">
			<table border="0" cellspacing="0" cellpadding="0" width="" style="width: 100%;">
				<tr>
					<td width="188" valign="top">
						<!-- 嵌入分页页面 -->
						<%@ include file="/manage/include/adminLeft.jsp"%>
					</td>
					<td valign="top">
						<div class="table_right">
							<div class="moudle_div">
								<div class="sidebar_title">
									<div class="sidebar_title_border">
										现在的位置：系统管理 > 角色管理
									</div>
								</div>
								<div class="div_content">
									<table class="bought-table">
										<thead>
											<tr class="toolbar skin-gray">
												<td colspan="5">
													<label>
													<input type="checkbox" class="all-selector" id="J_AllSelector" onclick="comBoxChange(this);" />
														全选
													</label>
													<a href="/role/form.action" class="toolbtn">新增</a>
													<a id="J_CombinPay2" href="javascript:dataDelete('/role/deleteRole.action');" class="toolbtn">批量删除
													</a>
												</td>
											</tr>
										</thead>
									</table>
									<form action="/role/pageList.action" method="post">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td>
													<table class="bought-table">
														<thead>
															<tr>
																<th style="text-align: center" width="30"></th>
																<th style="text-align: center" width="200">
																	角色名称
																</th>
																<th width="200" align="center">
																	角色编码
																</th>
																<th width="200" align="center">
																	角色备注
																</th>
																<th width="160" align="center">
																	资源分配
																</th>
																<th width="160" align="center">
																	查看分配
																</th>
																<th width="15%" align="center">
																	操作
																</th>
															</tr>
														</thead>
														<s:iterator var="data" value="dataList">
														<tbody class=" success-order">
																	<tr>
																	<td align="center">
																		<input type="checkbox" class="all-selector" name="table_id" value="${data.id}" />
																	</td>
																	<td align="center">
																		${data.roleName}
																	</td>
																	<td align="center">
																		${data.roleCode}
																	</td>
																	<td align="center">
																		${data.roleDesc}
																	</td>
																	<td align="center">
																		<a class="iframe" href="/manage/role/showResourceTree.jsp?id=${data.id}">资源分配</a>
																	</td>
																	<td align="center">
																		<a class="iframe" href="/manage/role/showUserRoleTree.jsp?id=${data.id}">查看分配 </a>
																	</td>
																	<td rowspan="1" align="center">
																		<a href="/role/form.action?id=${data.id}">编辑 </a>
																		<a href="/role/deleteRole.action?ids=${data.id}">删除</a>
																	</td>
																	</tr>
														</tbody>
														</s:iterator>
														<tfoot>
															<tr class="sep-row">
																<td colspan="5"></td>
															</tr>
															<tr class="pagebar">
																<td colspan="5">
																	<table width="100%" border="0" cellspacing="0" cellpadding="5">
																		<tr>
																			<td>
																				&nbsp;
																			</td>
																			<td width="520">
																				<!-- 嵌入分页页面 -->
																				<aldtags:pageTag />
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</tfoot>
													</table>
													<div style="clear: both;"></div>
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="bottom" id="bottom">
			<jsp:include flush="false" page="/manage/down.jsp" />
		</div>
	</body>
</html>
