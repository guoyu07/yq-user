<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>科宇科技</title>
		<%@ include file="/manage/commons/meta.jsp"%>
		<script language="javascript" src="${ctx}/scripts/script.js"></script>
		<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/colorbox/jquery.colorbox.js"></script>
		<link href="${ctx}/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">

$(document).ready(function(){
	
	
	$(".iframe").colorbox({iframe:true, width:"70%", height:"60%"});
});
</script>
		<!--[if lte IE 6]>

<link href="css/ie_hack.css" rel="stylesheet" type="text/css" />

<![endif]-->
	</head>
	<body>
		<!-- 头部菜单 -->
		<jsp:include flush="false" page="/manage/sys_menu.jsp" />
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
						<!---->
						<div class="table_right">
							<div class="moudle_div">
								<div class="sidebar_title">
									<div class="sidebar_title_border">
										现在的位置：系统管理 > 行政区域管理
									</div>
								</div>
								<div class="seach_div">
									<table width="100%" border="0" cellpadding="5" cellspacing="0" class="search_table">
										<tr>
											<td width="600">
												情报标题：
												<input name="input3" type="text" />
												&nbsp;&nbsp;&nbsp;&nbsp;
												审核状态：
												<label for="select2"></label>
												<select name="select" id="select2">
													<option>
														审核中
													</option>
													<option>
														已发布
													</option>
													<option>
														退回
													</option>
												</select>
												&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
												情报类型：
												<label for="select4"></label>
												<select name="select4" id="select4">
													<option>
														所有类型
													</option>
												</select>
												<label for="select"></label>
											</td>
											<td rowspan="2">
												<input name="input" type="button" value="搜索" class="btn_w66_write" />
											</td>
										</tr>
										<tr>
											<td>
												提交时间：
												<input name="input2" type="text" />
												－
												<input name="input2" type="text" />
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</div>
								<div class="div_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table class="bought-table">
													<thead>
														<tr>
															<th style="text-align: left">
																区域名称
																<a class="delay">sssssssssss</a>
															</th>
															<th width="100" align="center">
																区域类型
															</th>
															<th width="160" align="center">
																备注
															</th>
															<th width="100" align="center">
																创建时间
															</th>
															<th width="120" align="center">
																操作
															</th>
														</tr>
													</thead>
													<tbody class=" success-order">
														<c:forEach items="${page.list}" var="item">
															<tr>
																<td align="left">
																	${item.areaName}
																</td>
																<td align="center">
																	${item.areaType}
																</td>
																<td align="center">
																	${item.areaCode}
																</td>
																<td align="center">
																	<fmt:formatDate pattern="yyyy-MM-dd" value="${item.updateDate}" var="ud" />
																	${ud}
																</td>
																<td rowspan="1" align="center">
																	<a href="#">详情 </a>
																</td>
															</tr>
														</c:forEach>
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
																		<td width="410">
																			<!-- 嵌入分页页面 -->
																			<%-- <%@ include file="/manage/include/page.jsp"%> --%>
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
							</div>
						</div>
						<!---->
					</td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<div class="content">
				<div class="content_l"></div>
				<div class="content_r">
					珠海科宇科技 保留所有权利
					&nbsp;&nbsp;&nbsp; &copy;2012 cmcc Corporation. All rights reserved.
				</div>
			</div>
		</div>
	</body>
</html>
