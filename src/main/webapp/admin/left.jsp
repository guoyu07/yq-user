<%@page import="com.yq.common.ProblemCode"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>

</head>

<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table>
<tr>
<td valign=top> 
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr> 
<td height=38 class=menu_title onMouseOver=this.className='menu_title2'; onMouseOut=this.className='menu_title'; background=images/title.gif></td>
</tr>
<tr>
<td height=25 background=images/title_bg_quit.gif> 
&nbsp;<a href="/admin/readme" target="BoardList"><b>管理首页</b></a> | <a href="/admin/logout001" target="_top"><b>退出</b></a></td> 
</tr>
</table>
&nbsp; 
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr>
<td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onclick="showsubmenu(1)"> 
<b><span>会员管理</span></b></td>
</tr>
<tr>
<td style="display:" id='submenu1'>
<div class=sec_menu style="width:158px; height:182px">
            <table cellpadding=0 cellspacing=0 align=center width=150 height="133">
              <tr> 
                <td height=20>☉  <a href="/admin/userlist" target="BoardList"><font color="#000000">全部会员管理</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a href="/admin/chargeDetails" target="BoardList"><font color="#000000">充值记录明细</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a href="/admin/goldcardmanager" target="BoardList"><font color="#000000">金币卡--管理</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a href="/admin/gcSendRecord" target="BoardList"><font color="#000000">金币卡--转赠记录</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉   <a target="BoardList" href="/admin/outday"><font color="#000000">双区系统报表</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉   <a target="BoardList" href="/admin/bdbdate"><font color="#000000">报单币明细</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a target="BoardList" href="/admin/tradeManager">交易数据管理</a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a target="BoardList" href="/admin/ljsy">会员收益报表</a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a target="BoardList" href="/admin/epjysc">EP-交易市场情况</a></td>
              </tr>
            </table>
</div>
</td>
</tr>
</table>
&nbsp;
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_7.gif" id=menuTitle1 onclick="showsubmenu(6)"><span>信息管理</span></td>
</tr>
<tr>
<td style="display:" id='submenu6'>
<div class=sec_menu style="width:158px; height:182px">
<table cellpadding=0 cellspacing=0 align=center width=150 height="167">
<tr>
<td height=20>☉   <font color="#BB0000" style="font-size: 11pt"><a target="BoardList" href="/admin/fhjl"><font color="#000000">每期记录</font></a></font></td>
</tr>
<tr> 
<td height=20>☉  <a href="/admin/searchuser"  target="BoardList"><font color="#FF0000">搜索会员</font></a></td>
</tr>
<tr> 
<td height=20>☉  <a href="w123.asp"  target="BoardList">会员提现管理</a></td> 
</tr>
<tr>
<td height=20>☉  <font color="#FF0000"><a target="BoardList" href="ok.asp"><font color="#000000">转帐记录管理</font></a></font></td>
</tr>
<tr>
<td height=20>☉  <font color="#FF0000"><a target="BoardList" href="datepay.asp"><font color="#000000">统计网站数据</font></a></font></td>
</tr>
<tr>
<td height=20>☉  <font color="#FF0000"><a target="_self" href="mtfhjl.asp"><font color="#000000">每天返本计算</font></a></font></td> 
</tr>
<tr>
<td height=20>☉  <a href="date.asp" target="BoardList"><font color="#FF0000">数据报表</font></a></td> 
</tr>
<tr>
<td height=20>☉  <a href="bdbjzpay.asp" target="BoardList">报单币转账</a></td> 
</tr>
<tr>
<td height=20>☉  <a href="/vgo/newdate.asp" target="BoardList">会员登录日志</a></td> 
</tr>
</table>
</div>
</td>
</tr>
</table>
&nbsp;
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_4.gif" id=menuTitle1 onclick="showsubmenu(3)"><span>附加管理</span></td>
</tr>
<tr>
<td style="display:" id='submenu3'>
<div class=sec_menu style="width:158px; height:95px">
            <table cellpadding=0 cellspacing=0 align=center width=150 height="93">
              <tr> 
                <td height=20>☉  <font color="#FF0000"><a target="BoardList" href="cgcp.asp"><font color="#0000FF">抢购管理</font></a></font></td>
              </tr>
              <tr> 
                <td height=20>☉  <font color="#FF0000"><a target="BoardList" href="vip545.asp"><font color="#000000">设置交易股价</font></a></font></td>
              </tr>
              <tr> 
                <td height=20>☉  <font color="#800000"><b><a target="BoardList" href="/vgo/adslist.asp"><font color="#000000">公告管理</font></a></b><font color="#000000"> | 
                </font><b><a target="BoardList" href="/vgo/ggads.asp"><font color="#000000">添加公告</font></a></b></font></td>
              </tr>
              <tr> 
                <td height=20>☉  <font color="#FF0000"><a target="_self" href="jssqdate.asp"><font color="#000000">双区结算</font></a></font></td>
              </tr>
              </table>
	  </div>
	</td>
  </tr>
</table>
&nbsp;
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onclick="showsubmenu(11)"><span>邮件系统管理</span></td>
</tr>
<tr>
<td style="display:" id='submenu11'>
<div class=sec_menu style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=150>
              <tr> 
                <td height=20>☉  <a href="sendmailvip.asp" target="BoardList"><font color="#000000">群发正式会员</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a href="sendmailtem.asp" target="BoardList"><font color="#000000">群发临时会员</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <a href="sendmailall.asp" target="BoardList"><font color="#000000">群发全部会员</font></a></td>
              </tr>
            </table>
	  </div>
	</td>
  </tr>
</table>&nbsp;
<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr>
      <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_8.gif" id=menuTitle1 onclick="showsubmenu(7)"><span>参数设置</span></td>
</tr>
<tr>
<td style="display:" id='submenu7'>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=150>
              <tr> 
                <td height=20>☉   <font color="#FF0000"><span style="font-size: 11pt"><font style="font-size: 11pt; font-weight: 700"><a target="BoardList" href="../config.asp"><font color="#000000">系统参数设置</font></a></font></span></font></td>
              </tr>
              <tr> 
                <td height=20>☉  <font style="font-size: 11pt"><a target="BoardList" href="modify_contact.asp"><font color="#000000">修改注册协议</font></a></font></td>
              </tr>
              <tr> 
                <td height=20>☉  <a href="updategl.asp" target="BoardList"><font color="#000000">管理员资料修改</font></a></td>
              </tr>
              <tr> 
                <td height=20>☉  <span style="font-size: 11pt"><a target="BoardList" href="searchg.asp"><font color="#000000">首页模板设置</font></a></span></td>
              </tr>
              <tr> 
                <td height=20>☉  <a target="BoardList" href="../bf.asp">数据备份</a></td>
              </tr>
              </table>
	  </div>
	</td>
  </tr>
</table>
&nbsp; </table>
<p><!-- <iframe name="I1" src="managequeren.asp">浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe> --></p>