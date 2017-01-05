<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/table.js"></script>
<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".iframe").colorbox({iframe:true, width:"35%", height:"60%"});
});

function changePwd(userId){
	lhgdialog.opendlg($("#ModifyPassword").val(),"/user/toPwdPage.action?id="+userId,480,200,true,true);
}
</script>

<div class="div_content">
	<table class="bought-table">
		<thead>
			<tr class="toolbar skin-gray">
				<td colspan="7">
					<input type="checkbox" class="all-selector" id="J_AllSelector" onclick="comBoxChange(this);" />
						全选
					<a href="/user/form.action" class=" toolbtn">新增</a>
					<a id="J_CombinPay2" href="javascript:dataDelete('/user/deleteUser.action');" class=" toolbtn">批量删除</a>
				</td>
			</tr>
		</thead>
	</table>
	<input type="hidden" name="ModifyPassword" id="ModifyPassword" value="修改密码" />
	<input name="urls" id="urls" value="/user/pageList.action?ajax=true&treeId=${clickId}" type="hidden" />
	<input name="treeId" value="${clickId}" type="hidden" />
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table class="bought-table">
					<thead>
						<tr>
							<th style="text-align: center" width="30"></th>
							<th style="text-align: center">
								用户名称
							</th>
							<th align="center">
								登陆名称
							</th>
							<th align="center">
								角色
							</th>
							<th align="center">
								角色分配
							</th>
							<th align="center">
								操作
							</th>
						</tr>
					</thead>
					<tbody class=" success-order">
					<s:iterator var="item" value="dataList">
						<tr>
								<td>
									<input type="checkbox" class="all-selector" name="table_id" value="${item.id}" />
								</td>
								<td align="center">
									${item.fullName}
								</td>
								<td align="center">
									${item.adminusername}
								</td>
								<td align="center">
									${item.roleName}
								</td>
								<td align="center">
									<a class="iframe" href="/manage/user/showRoleTree.jsp?id=${item.id}">角色分配</a>
								</td>
								<td rowspan="1" align="center">
									<a href="/user/form.action?id=${item.id}">编辑</a>
									&nbsp;&nbsp;
									<a href="javascript:changePwd('${item.id}');" id="icon2">修改密码</a>
								</td>
							</tr>
					</s:iterator>
					</tbody>
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
											<%-- <aldtags:pageTag paraStr="pid,${pid},ajax,true"/> --%>
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
</div>
