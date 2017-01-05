<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>科宇科技</title>
		<%@ include file="/manage/commons/meta.jsp"%>
		<script language="javascript" src="${ctx}/scripts/script.js"></script>
		<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/scripts/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/validate/jquery.validate.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/validate/messages_cn.js" type="text/javascript"></script>
		<script type="text/javascript">
	$(document).ready(function(){
	
	//选中菜单
	$("#system").attr("class","nav hover");
	$("input:radio[name='security'][value='${info.security}']").attr("checked", true);
	//为newForm注册validate函数
	$("#newForm").validate({
	
	});

	});


</script>
		<!--[if lte IE 6]>

<link href="css/ie_hack.css" rel="stylesheet" type="text/css" />

<![endif]-->
	</head>
	<body>
		<!-- 头部菜单 -->
		<jsp:include flush="false" page="/manage/admin_menu.jsp" />
		<div style="height: 10px;">
		</div>
		<div class="table_div">
			<form action="/resource/saveOrUpdateResource.action" method="post" name="newForm" id="newForm">
				<input type="hidden" id="id" name="id" value="${info.id}" />
				<input type="hidden" name="treeId" id="treeId" value="${treeId}" />
				<table border="0" cellspacing="0" cellpadding="0" width="" style="width: 100%;">
					<tr>
						<td width="188" valign="top">
							<!-- 嵌入右侧菜单页面 -->
							<%@ include file="/manage/include/adminLeft.jsp"%>
						</td>
						<td valign="top">
							<!---->
							<div class="table_right">
								<div class="moudle_div">
									<div class="sidebar_title">
										<div class="sidebar_title_border">
											现在的位置：资源管理 > 新建资源
										</div>
									</div>
									<div class="div_content border_css" style="border: #CCC solid 1px;">
										<div class="form_body">
											<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_item">
												<tr>
													<td height="30" align="right" class="left_txt2">
														资源名称：
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="resoName" id="resoName" type="text" value="${info.resoName}" class="required" />
													</td>
													<td width="100" align="right">
														<span class="left_txt2">资源编码：</span>
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="resoCode" id="resoCode" type="text" value="${info.resoCode}" class="required" />
													</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">
														资源URL：
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="resoUrl" id="resoUrl" type="text" value="${info.resoUrl}" />
													</td>
													<td width="100" align="right">
														<span class="left_txt2">资源级别：</span>
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<select name="resoLevel" id="resoLevel">
															<c:choose>
																<c:when test="${info.resoLevel eq '2'}">
																	<option value="2" selected="selected">
																		二级菜单
																	</option>
																	<option value="3">
																		三级菜单
																	</option>
																	<option value="4">
																		四级菜单
																	</option>
																</c:when>
																<c:when test="${info.resoLevel eq '3'}">
																	<option value="2">
																		二级菜单
																	</option>
																	<option value="3" selected="selected">
																		三级菜单
																	</option>
																	<option value="4">
																		四级菜单
																	</option>
																</c:when>
																<c:when test="${info.resoLevel eq '4'}">
																	<option value="2">
																		二级菜单
																	</option>
																	<option value="3">
																		三级菜单
																	</option>
																	<option value="4" selected="selected">
																		四级菜单
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="2">
																		二级菜单
																	</option>
																	<option value="3">
																		三级菜单
																	</option>
																	<option value="4">
																		四级菜单
																	</option>
																</c:otherwise>
															</c:choose>
														</select>
													</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">
														资源顺序：
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<select name="resoNo" id="resoNo">
															<c:choose>
																<c:when test="${info.resoNo eq '1'}">
																	<option value="1" selected="selected">
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '2'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2" selected="selected">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '3'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3" selected="selected">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '4'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3" >
																		三
																	</option>
																	<option value="4" selected="selected">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '5'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3" >
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5" selected="selected">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '6'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3" >
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6" selected="selected">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '7'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7"  selected="selected">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '8'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8"  selected="selected">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '9'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9" selected="selected">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '10'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10" selected="selected">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '11'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11" selected="selected">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:when>
																<c:when test="${info.resoNo eq '12'}">
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12" selected="selected">
																		十二
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="1" >
																		一
																	</option>
																	<option value="2">
																		二
																	</option>
																	<option value="3">
																		三
																	</option>
																	<option value="4">
																		四
																	</option>
																	<option value="5">
																		五
																	</option>
																	<option value="6">
																		六
																	</option>
																	<option value="7">
																		七
																	</option>
																	<option value="8">
																		八
																	</option>
																	<option value="9">
																		九
																	</option>
																	<option value="10">
																		十
																	</option>
																	<option value="11">
																		十一
																	</option>
																	<option value="12">
																		十二
																	</option>
																</c:otherwise>
															</c:choose>
														</select>
													</td>
													<td width="100" align="right">
														<span class="left_txt2">样式代码：</span>
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														<input name="resoClass" id="resoClass" type="text" value="${info.resoClass}" />
													</td>
													<td width="150" align="right">
														<span class="">是否需要登录验证：</span>
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														是
														<input type="radio" name="security" id="security" checked="checked" value="1" />
														否
														<input type="radio" name="security" id="security2" value="0" />
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
														&nbsp;
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
														<span class="left_txt2"> <a href="#"> <input name="input" type="submit" class="btn_w102_blue"
																	value="保存" />&nbsp;&nbsp;</a> <input name="input" type="button" class="btn_w102_blue"
																value="返回" onclick="history.go(-1);" /> </span>
													</td>
													<td width="5">
														&nbsp;
													</td>
													<td height="30">
														&nbsp;
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
							<!---->
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
