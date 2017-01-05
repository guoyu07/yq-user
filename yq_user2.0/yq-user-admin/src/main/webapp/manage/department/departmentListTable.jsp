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
</script>
<div class="div_content">
	<table class="bought-table">
		<thead>
			<tr class="toolbar skin-gray">
				<td colspan="7">
					<label>
						<input type="checkbox" class="all-selector" id="J_AllSelector" onclick="comBoxChange(this);" />
						全选
					</label>
					<a href="/department/form.action?treeId=${clickId}" class=" toolbtn">新建 </a>
					<a id="J_CombinPay2" href="javascript:dataDelete('/department/deleteDepartment.action');" class=" toolbtn">批量删除
					</a>
				</td>
			</tr>
		</thead>
	</table>
	<form action="/department/listPage.action?ajax=true" method="post">
		<input name="selectTreeId" id="selectTreeId" type="hidden" />
		<input name="urls" id="urls" value="/department/listPage.action?ajax=true&treeId=${clickId}" type="hidden" />
		<input name="treeId" value="${clickId}" type="hidden" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table class="bought-table">
						<thead>
							<tr>
								<th style="text-align: left" width="30"></th>
								<th style="text-align: center" width="200">
									部门名称
								</th>
								<th width="160" align="center">
									角色备注
								</th>
								<th width="160" align="center">
									创建时间
								</th>
								<th width="160" align="center">
									修改时间
								</th>
								<th width="20%" align="center">
									操&nbsp;&nbsp;作
								</th>
							</tr>
						</thead>
							<tbody class="success-order">
							<s:iterator var="item" value="dataList">
									<tr>
									<td width="30">
										<input type="checkbox" class="all-selector" name="table_id" value="${item.id}" />
									</td>
									<td align="center">
										${item.deptName}
									</td>
									<td align="center">
										${item.deptDesc}
									</td>
									<td align="center">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createDate}" var="cd" />
										${cd}
									</td>
									<td align="center">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateDate}" var="ud" />
										${ud}
									</td>
									
									<td rowspan="1" align="center">
										<a href="/department/form.action?treeId=${clickId}">新建</a>
										<a>|</a>
										<a href="/department/form.action?id=${item.id}&treeId=${clickId}"> 编辑 </a>
										<a>|</a>
										<a href="/department/deleteDepartment.action?ids=${item.id}">删除</a>
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
												<%-- <aldtags:pageTag /> --%>
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
