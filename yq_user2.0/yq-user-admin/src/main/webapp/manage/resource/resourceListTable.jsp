<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
					<a href="/resource/form.action?treeId=${clickId}" class=" toolbtn">新建</a>
					<a id="J_CombinPay2" href="javascript:dataDelete('/resource/deleteResource.action');" class=" toolbtn">批量删除
					</a>
				</td>
			</tr>
		</thead>
	</table>
	<form action="/resource/listPage.action" method="post">
		<input name="urls" id="urls" value="/resource/listPage.action?ajax=true&treeId=${clickId}" type="hidden" />
		<input name="treeId" value="${clickId}" type="hidden" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="toolbar skin-gray">
				<td>
					<br />
				</td>
			</tr>
			<tr>
				<td>
					<table class="bought-table">
						<thead>
							<tr>
								<th style="text-align: center" width=30></th>
								<th width="55" align="center">
									资源顺序
								</th>
								<th width="55" align="center">
									资源级别
								</th>
								<th width="100" align="center">
									资源名称
								</th>
								<th width="100" align="center">
									资源编码
								</th>
								<th width="15%" align="center">
									查看分配
								</th>
								<th width="20%" align="center">
									操作
								</th>
							</tr>
						</thead>
							<tbody class="success-order">
							<s:iterator var="data" value="resourceList">
									<tr>
										<td colspan="5" align="left" class="jiange"></td>
									</tr>
									<tr>
										<td rowspan="2">
											<input type="checkbox" class="all-selector" name="table_id" value="${data.id}" />
										</td>
										<td colspan="6" align="left" class="header_item">
											<span> URL: ${data.resoUrl} </span>
										</td>
									</tr>
									<tr>
										<td align="left">
											<div class="item_body">
												${data.resoNo}
											</div>
										</td>
										<td align="left">
											<div class="item_body">
												${data.resoLevel}
											</div>
										</td>
										<td align="center">
											${ data.resoName}
										</td>
										<td align="center">
											${data.resoCode}
										</td>
										<td align="center">
											<a class="iframe" href="/manage/resource/showRoleResourceTree.jsp?id=${data.id}" >查看分配 </a>
										</td>
										<td rowspan="1" align="center">
											<a href="/resource/form.action?treeId=${clickId}">新建 </a>
											<a href="/resource/form.action?id=${data.id}&treeId=${clickId}">编辑 </a>
											<a href="/resource/deleteResource.action?ids=${data.id}">删除</a>
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
												<%-- <aldtags:pageTag paraStr="pid,${pid},ajax,true,treeId,${clickId}"/> --%>
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
