<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.yq.manage.bean.Resource"%>
<%@page import="org.apache.struts2.components.Else"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<script src="${widgethome}/open/lhgdialog.js" type=text/javascript></script>
<script type="text/javascript">
	var ctx = "${ctx}";

	function showAdmin(url){
		var w=(document.documentElement.clientWidth)+"px";
		var h=(document.documentElement.clientHeight)+"px";
		window.open (url,'', 'height='+h+', width='+w+', top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes,resizable=yes,location=yes, status=yes');
	}
	function showDataSys(url){
		var w=(document.documentElement.clientWidth)+"px";
		var h=(document.documentElement.clientHeight)+"px";
		window.open (url,'', 'height='+h+', width='+w+', top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes,resizable=yes,location=yes, status=yes');
	}

	function changePwd(userId){
		lhgdialog.opendlg('修改密码',"/user/toPwdPage.action?id="+userId,480,200,true,true);
	}
	
</script>
<div class="top">
	<div id="logo" title="后台管理"></div>
	<div id="dishi">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="select_dishi">
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
		</table>
	</div>
	<div class="userinfo">
		<table width="100%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="left">
					&nbsp;&nbsp;&nbsp;&nbsp;${LOGIN_CURRENT_USER.adminusername}【${staffTable.fullName}】，
					您好，欢迎登录会员中心后台管理系统！
					&nbsp;(&nbsp;<a href="https://vip.zgyce.com/index_r.jsp">会员中心</a>|&nbsp;<a href="http://y1600q7716.imwork.net:28454/admin/adminmanager">增值服务管理后台</a>|&nbsp;<a href="http://y1600q7716.imwork.net:28454/adminindex/cwlogin">财务登录</a>&nbsp;)
				</td>
				<td>
				&nbsp;&nbsp;
					<a href="javascript:changePwd(${LOGIN_CURRENT_USER.id});" id="icon2">修改密码 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<%
					    String hasAdmin = (String) request.getSession().getAttribute("FIRST_ADMIN_URL");
					    if (hasAdmin != null) {
					%>
					<a href="javascript:showAdmin('<%=hasAdmin%>');" id="icon2">系统管理 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<%
					    }
					%>
					<a href="/logout/logout.action" id="icon2">退出系统 </a>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</div>
	<%-- <div class="topnav">
		<table style="border='0';width='100%' ; align='center'; cellpadding:'0'; cellspacing:'0';">
			<tr>
				<td align="center" id="nav">
					<table style="border='0';width='100%' ; align='center'; cellpadding:'0'; cellspacing:'0';text-align:'center';">
						<tr>
							<td align="center" id="nav" >
								<table style="border='0';width='660' ; align='center'; cellpadding:'0'; cellspacing:'0';text-align:'center';">
									<tbody><tr>
										<td id="sys_menu_td">
											<a href="#" class="nav"></a>
										</td>
									</tr>
								</tbody>
									<tr >
										<td id="sys_menu_td">
										<a href="#" class="nav"></a>
											 <s:iterator var="data" value="rootList">	
											  	<a href="${ctx}/${data.resoUrl}" class="nav" id="${data.id}"><span>${data.resoName}</span> </a> <div></div>
											 </s:iterator>
											 <%
											 List<Resource> list = (List<Resource>) request.getSession().getAttribute("SYS_MENU");
											 System.out.println("list="+list.size());
											 String url;
											    if (list != null) {
											        for (int i = 0; i < list.size(); i++) {
											            url = list.get(i).getResoUrl();
											            if (("XTGL").equals(list.get(i).getResoCode())) continue;
											            if (("MENBER_MANAGE").equals(list.get(i).getResoCode())) {
											                String temp = (String) request.getSession().getAttribute("FIRST_PLAYER_URL");
											                if (temp != null && !("").equals(temp)) {
											                    url = temp;
											                }
											            }
											            if (("INFO_MANAGER").equals(list.get(i).getResoCode())) {
											                String temp = (String) request.getSession().getAttribute("FIRST_INFO_URL");
											                if (temp != null && !("").equals(temp)) {
											                    url = temp;
											                }
											            }
											            if (("FJGL").equals(list.get(i).getResoCode())) {
											                String temp = (String) request.getSession().getAttribute("FIRST_PLAYER_URL");
											                if (temp != null && !("").equals(temp)) {
											                    url = temp;
											                }
											            }
											
												  
											%>
												<a href="<%=url%>" class="nav" id="<%=list.get(i).getaId()%>"><span><%=list.get(i).getResoName()%></span> </a><div></div>
											<%
											        }
											        }
											%>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div> --%>
	<div class="topnav">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center" id="nav">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center" id="nav">
								<table width="660" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td id="sys_menu_td">
											<a href="#" class="nav"></a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
