<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>科宇科技</title>
<script language="javascript"  src="${ctx}/script/script.js"></script>
<%@ include file="/manage/commons/meta.jsp"%>
<link href="/manage/styles/main.css" rel="stylesheet" type="text/css" />
<script language="javascript"  src="${jshome}/jquery-1.7.2.min.js"></script>


<style type="text/css">
#Map_info_div {
	height: 320px;
	width:100%;
	_width:498px;
	overflow-y:scroll;
}

.t1 {background-color:#fff;}/* 第一行的背景色 */
.t2 {background-color:#f5f5f5;}/* 第二行的背景色 */
.t3 {background-color:#e3efff;}/* 鼠标经过时的背景色 */

</style>
<script type="text/javascript">
        
var ctx = "${ctx}";

window.onload = function(){
	if(document.getElementById("tab0")!=null){
		document.getElementById("tab0").className = "nav hover";
	}
};

</script>

</head>
<body>
<jsp:include flush="false" page="/manage/sys_menu.jsp"/>
	<div style="height: 10px;"></div>
	<div class="table_div" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
		    <td width="17" valign="top" background="${ctx}/images/mail_leftbg.gif"><img src="${ctx}/images/left-top-right.gif" width="17" height="29" /></td>
		    <td valign="top"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
		        <tr>
		          <td height="31"></td>
		        </tr>
		      </table></td>
		    <td width="16" valign="top" background="${ctx}/images/mail_rightbg.gif"><img src="${ctx}/images/nav-right-bg.gif" width="16" height="29" /></td>
		  </tr>
		  <tr>
		    <td valign="middle" background="${ctx}/images/mail_leftbg.gif">&nbsp;</td>
		    <td valign="top" bgcolor="#fbfbfb"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		        <tr>
		          <td valign="top">&nbsp;</td>
		          <td valign="top">&nbsp;</td>
		          <td valign="top">&nbsp;</td>
		        </tr>
		        <tr>
		          <td colspan="3" valign="top"><span class="left_bt">&nbsp;&nbsp;${staffTable.fullName}&nbsp;&nbsp;欢迎!&nbsp;&nbsp;</span></td>
		        </tr>
		        <tr>
		          <td colspan="3" valign="top">&nbsp;</td>
		        </tr>
		        <tr>
		          <td width="49%" valign="top">
		          <table width="100%" height="315" border="0" cellpadding="0" cellspacing="0" class="line_table" style="margin:0px 0 10px 0;">
		            <tr>
		              <td width="10" height="27" background="${ctx}/images/news-title-bg.gif"><img src="${ctx}/images/news-title-bg.gif" width="2" height="27" /></td>
		              <td width="504" background="${ctx}/images/news-title-bg.gif" class="left_bt2">
			           	用户在线数统计
		              </td>
		              <td width="50" background="${ctx}/images/news-title-bg.gif" class="left_bt2">
		              </td>
		            </tr>
		            <tr>
		              <td  valign="top">&nbsp;</td>
		              <td  colspan="2" valign="top">
		                <div class="Lv2_COLUMN">
		                    <ul class="news_list2">
		                    	<li>后台在线人数&nbsp;：&nbsp;${SYSTEM_INFO.adminOnlinePlayerNum}</li>
		                    	<li>财务后台在线人数&nbsp;：&nbsp;${SYSTEM_INFO.cwOnlinePlayerNum}</li>
		                    </ul>
		                  </div></td>
		            </tr>
		            <tr>
		              <td height="5" colspan="3">&nbsp;</td>
		            </tr>
		          </table>
		         </td>
		          <td valign="top">&nbsp;</td>
		          <td valign="top">
		          <table width="100%" height="315" border="0" cellpadding="0" cellspacing="0" class="line_table" style="margin:0px 0 10px 0;">
		            <tr>
		              <td width="10" height="27" background="${ctx}/images/news-title-bg.gif"><img src="${ctx}/images/news-title-bg.gif" width="2" height="27" /></td>
		              <td width="504" background="${ctx}/images/news-title-bg.gif" class="left_bt2">
			                  	操作点击右边
		              </td>
		              <td width="50" background="${ctx}/images/news-title-bg.gif" class="left_bt2">
		              </td>
		            </tr>
		            <tr>
		              <td  valign="top">&nbsp;</td>
		              <td  colspan="2" valign="top">
		                <div class="Lv2_COLUMN">
		                    <ul class="news_list2">
                    			<li>
		                    		用户管理&nbsp;：&nbsp;</font>&nbsp;<a href="/role/pageList.action">角色管理</a>
		                    	</li>
		                    	<li>
		                    		用户管理&nbsp;：&nbsp;</font>&nbsp;<a href="/user/pageList.action">用户管理</a>
		                    	</li>
		                    	<li>
		                    		部门管理&nbsp;：&nbsp;</font>&nbsp;<a href="/department/listPage.action">部门管理</a>
		                    	</li>
		                    	<li>
		                    		资源管理&nbsp;：&nbsp;</font>&nbsp;<a href="/resource/listPage.action">资源管理</a>
		                    	</li>
		                    </ul>
		                  </div></td>
		            </tr>
		            <tr>
		              <td height="5" colspan="3">&nbsp;</td>
		            </tr>
		          </table>
		          </td>
		        </tr>
		      </table></td>
		    <td background="${ctx}/images/mail_rightbg.gif">&nbsp;</td>
		  </tr>
		  <tr>
		    <td valign="bottom" background="${ctx}/images/mail_leftbg.gif"><img src="${ctx}/images/buttom_left2.gif" width="17" height="17" /></td>
		    <td background="${ctx}/images/buttom_bgs.gif"><img src="${ctx}/images/buttom_bgs.gif" width="17" height="17"></td>
		    <td valign="bottom" background="${ctx}/images/mail_rightbg.gif"><img src="${ctx}/images/buttom_right2.gif" width="16" height="17" /></td>
		  </tr>
		</table>
	</div>

<div class="bottom" id="bottom">
  <jsp:include flush="false" page="/manage/down.jsp"/>
</div>
</body>
</html>
