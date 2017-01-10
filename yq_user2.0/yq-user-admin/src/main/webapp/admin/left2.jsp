<%@page import="com.yq.common.ProblemCode"%>
<%@page import="java.util.List"%>
<%@page import="com.yq.manager.bean.PlayerResource"%>
<%@page import="com.yq.manage.bean.Resource"%>
<%@page import="java.util.Comparator"%>
<%@page import="com.yq.manage.util.CompareResource"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script language="javascript"  src="/manage/scripts/jquery-1.7.2.min.js"></script>
<script language="javascript"  src="/manage/scripts/script.js"></script>
<script src="/manage/widgets/open/lhgdialog.js" type=text/javascript></script>
<link href="/manage/widgets/open/lhgdialog.css" type="text/css"/>
<link href="/manage/styles/css.css" rel="stylesheet" type="text/css" />
<link href="/manage/scripts/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
<link href="/manage/styles/main.css" rel="stylesheet" type="text/css" />
<c:if test="${erroCodeNum==99999}"><script language=javascript>alert('你沒有权限！');history.go(-1);</script></c:if>
<head>
<title>管理页面</title>
<style type=text/css>
body  { background:#799AE1; margin:0px; font:9pt 宋体; }
table  { border:0px; }
td  { font:normal 12px 宋体; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#428EFF;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#D6DFF7; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#215DC6; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#428EFF; font-weight:bold; }
</style>
<script type="text/javascript">

</script>
<SCRIPT language=javascript1.2>

	
	function showsubmenu(sid)
	{
		whichEl = eval("submenu" + sid);
		if (whichEl.style.display == "none")
		{
		eval("submenu" + sid + ".style.display=\"\";");
		//location.href="/admin/left";
		}
		else
		{
		eval("submenu" + sid + ".style.display=\"none\";");
		//location.href="/admin/getResource";
		}
	}

	
	function heartbeat(){ 
		location.href="/admin/getResource";
		/* $.post("/admin/getResource","json"); */
    } 
	    
	setInterval("heartbeat();",600000); 

	
	function reflush(){
		location.href="/admin/getResource";
	}

</SCRIPT>

</head>

<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table>
<tr>
<td valign=top> 
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr> 
<td height=38 class=menu_title onMouseOver=this.className='menu_title2'; onMouseOut=this.className='menu_title'; background="images/title.gif" onclick="reflush()" ></td>
</tr>
<tr>
<td height=25 > 
&nbsp;<a href="/admin/readme" target="BoardList"><b>首页</b></a> | ${user.adminusername} ${adminusername}<!-- <a href="/user/toPwdPage.action?status=2" target="BoardList" > <b>修改密码</b></a> --> | <a href="/admin/logout001" target="_top"><b>退出</b></a></td> 
</tr>
</table>
&nbsp; 

								
			<%
				List<PlayerResource> list = (List<PlayerResource>) request.getSession().getAttribute("SYS_MENU");
				 String url;
				 if (list != null) {
				        for (int i = 0; i < list.size(); i++) {
				        	url = list.get(i).getResoUrl();
				        	
				        	if(list.get(i).getResourceList().size()>0){
				  %>
					<table style="cellpadding:0; cellspacing:0;width:158;align:center;" >
					<tr>
					<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="<%=list.get(i).getResoClass()%>" id=menuTitle1 onclick="showsubmenu(<%=i%>)"> 
					<b><span><%=list.get(i).getResoName()%></span></b></td>
					</tr>
					<tr>
					<td style="display:" id='submenu<%=i%>'>
					<div class=sec_menu style="width:158px; height:260px">
					 <table style="cellpadding:0; cellspacing:0;width:150;align:center;height:153;">
					<%
					 List<Resource> list2 = list.get(i).getResourceList();
					 Collections.sort(list2,new CompareResource());
					 if(list2!=null){
						 for (int j = 0; j < list2.size(); j++) {
							 url = list2.get(j).getResoUrl();
							 %>
							 
								  <tr>
								  	<td height=20>☉  <a href="<%=url%>" target="BoardList"><%=list2.get(j).getResoName()%></a></td> 
								  </tr>
					           
							 <%
						 }
					}
					
					%>
					 </table>
					</div>
					</td>
					</tr>
					</table> 
					
					&nbsp;
					
				  <%	
	               }
				        }
			  	}%>
											
</table>
<p><!-- <iframe name="I1" src="managequeren.asp">浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe> --></p>