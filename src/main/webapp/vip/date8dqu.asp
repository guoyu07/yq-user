<!--#include file="../mq0618.asp"-->
<title>显示全国各大区服务中心情况-各大区、省的考核指数</title>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=720,height=650');
    }
//-->
</SCRIPT>
<% 
dim sql_bj0
dim rs_bj0
sql_bj0="select sum(pdlb) as down_bj0 from mqfh where addsheng = '北京市' and DateDiff('d',date(),pddate)=0 " 
Set rs_bj0= Server.CreateObject("ADODB.Recordset") 
rs_bj0.open sql_bj0,conn7,1,1
%>
<% 
dim sql_tj0
dim rs_tj0
sql_tj0="select sum(pdlb) as down_tj0 from mqfh where addsheng = '天津市' and DateDiff('d',date(),pddate)=0 " 
Set rs_tj0= Server.CreateObject("ADODB.Recordset") 
rs_tj0.open sql_tj0,conn7,1,1
%>
<% 
dim sql_hb0
dim rs_hb0
sql_hb0="select sum(pdlb) as down_hb0 from mqfh where addsheng = '河北省' and DateDiff('d',date(),pddate)=0 " 
Set rs_hb0= Server.CreateObject("ADODB.Recordset") 
rs_hb0.open sql_hb0,conn7,1,1
%>
<% 
dim sql_sx0
dim rs_sx0
sql_sx0="select sum(pdlb) as down_sx0 from mqfh where addsheng = '山西省' and DateDiff('d',date(),pddate)=0 " 
Set rs_sx0= Server.CreateObject("ADODB.Recordset") 
rs_sx0.open sql_sx0,conn7,1,1
%>
<% 
dim sql_nmg0
dim rs_nmg0
sql_nmg0="select sum(pdlb) as down_nmg0 from mqfh where addsheng = '内蒙古自治区' and DateDiff('d',date(),pddate)=0 " 
Set rs_nmg0= Server.CreateObject("ADODB.Recordset") 
rs_nmg0.open sql_nmg0,conn7,1,1
%>
<% 
dim sql_ln0
dim rs_ln0
sql_ln0="select sum(pdlb) as down_ln0 from mqfh where addsheng = '辽宁省' and DateDiff('d',date(),pddate)=0 " 
Set rs_ln0= Server.CreateObject("ADODB.Recordset") 
rs_ln0.open sql_ln0,conn7,1,1
%>
<% 
dim sql_jl0
dim rs_jl0
sql_jl0="select sum(pdlb) as down_jl0 from mqfh where addsheng = '吉林省' and DateDiff('d',date(),pddate)=0 " 
Set rs_jl0= Server.CreateObject("ADODB.Recordset") 
rs_jl0.open sql_jl0,conn7,1,1
%>
<% 
dim sql_hlj0
dim rs_hlj0
sql_hlj0="select sum(pdlb) as down_hlj0 from mqfh where addsheng = '黑龙江省' and DateDiff('d',date(),pddate)=0 " 
Set rs_hlj0= Server.CreateObject("ADODB.Recordset") 
rs_hlj0.open sql_hlj0,conn7,1,1
%>
<% 
dim sql_sh0
dim rs_sh0
sql_sh0="select sum(pdlb) as down_sh0 from mqfh where addsheng = '上海市' and DateDiff('d',date(),pddate)=0 " 
Set rs_sh0= Server.CreateObject("ADODB.Recordset") 
rs_sh0.open sql_sh0,conn7,1,1
%>
<% 
dim sql_zs0
dim rs_zs0
sql_zs0="select sum(pdlb) as down_zs0 from mqfh where addsheng = '江苏省' and DateDiff('d',date(),pddate)=0 " 
Set rs_zs0= Server.CreateObject("ADODB.Recordset") 
rs_zs0.open sql_zs0,conn7,1,1
%>
<% 
dim sql_zz0
dim rs_zz0
sql_zz0="select sum(pdlb) as down_zz0 from mqfh where addsheng = '浙江省' and DateDiff('d',date(),pddate)=0 " 
Set rs_zz0= Server.CreateObject("ADODB.Recordset") 
rs_zz0.open sql_zz0,conn7,1,1
%>
<% 
dim sql_nf0
dim rs_nf0
sql_nf0="select sum(pdlb) as down_nf0 from mqfh where addsheng = '安徽省' and DateDiff('d',date(),pddate)=0 " 
Set rs_nf0= Server.CreateObject("ADODB.Recordset") 
rs_nf0.open sql_nf0,conn7,1,1
%>
<% 
dim sql_fz0
dim rs_fz0
sql_fz0="select sum(pdlb) as down_fz0 from mqfh where addsheng = '福建省' and DateDiff('d',date(),pddate)=0 " 
Set rs_fz0= Server.CreateObject("ADODB.Recordset") 
rs_fz0.open sql_fz0,conn7,1,1
%>
<%
dim sql_zx0
dim rs_zx0
sql_zx0="select sum(pdlb) as down_zx0 from mqfh where addsheng = '江西省' and DateDiff('d',date(),pddate)=0 " 
Set rs_zx0= Server.CreateObject("ADODB.Recordset") 
rs_zx0.open sql_zx0,conn7,1,1
%>
<%
dim sql_sd0
dim rs_sd0
sql_sd0="select sum(pdlb) as down_sd0 from mqfh where addsheng = '山东省' and DateDiff('d',date(),pddate)=0 " 
Set rs_sd0= Server.CreateObject("ADODB.Recordset") 
rs_sd0.open sql_sd0,conn7,1,1
%>
<%
dim sql_hn0
dim rs_hn0
sql_hn0="select sum(pdlb) as down_hn0 from mqfh where addsheng = '河南省' and DateDiff('d',date(),pddate)=0 " 
Set rs_hn0= Server.CreateObject("ADODB.Recordset") 
rs_hn0.open sql_hn0,conn7,1,1
%>
<%
dim sql_hbs0
dim rs_hbs0
sql_hbs0="select sum(pdlb) as down_hbs0 from mqfh where addsheng = '湖北省' and DateDiff('d',date(),pddate)=0 " 
Set rs_hbs0= Server.CreateObject("ADODB.Recordset") 
rs_hbs0.open sql_hbs0,conn7,1,1
%>
<%
dim sql_hns0
dim rs_hns0
sql_hns0="select sum(pdlb) as down_hns0 from mqfh where addsheng = '湖南省' and DateDiff('d',date(),pddate)=0 " 
Set rs_hns0= Server.CreateObject("ADODB.Recordset") 
rs_hns0.open sql_hns0,conn7,1,1
%>
<%
dim sql_gd0
dim rs_gd0
sql_gd0="select sum(pdlb) as down_gd0 from mqfh where addsheng = '广东省' and DateDiff('d',date(),pddate)=0 " 
Set rs_gd0= Server.CreateObject("ADODB.Recordset") 
rs_gd0.open sql_gd0,conn7,1,1
%>
<%
dim sql_gx0
dim rs_gx0
sql_gx0="select sum(pdlb) as down_gx0 from mqfh where addsheng = '广西壮族自治区' and DateDiff('d',date(),pddate)=0 " 
Set rs_gx0= Server.CreateObject("ADODB.Recordset") 
rs_gx0.open sql_gx0,conn7,1,1
%>
<%
dim sql_nn0
dim rs_nn0
sql_nn0="select sum(pdlb) as down_nn0 from mqfh where addsheng = '海南省' and DateDiff('d',date(),pddate)=0 " 
Set rs_nn0= Server.CreateObject("ADODB.Recordset") 
rs_nn0.open sql_nn0,conn7,1,1
%>
<%
dim sql_cq0
dim rs_cq0
sql_cq0="select sum(pdlb) as down_cq0 from mqfh where addsheng = '重庆市' and DateDiff('d',date(),pddate)=0 " 
Set rs_cq0= Server.CreateObject("ADODB.Recordset") 
rs_cq0.open sql_cq0,conn7,1,1
%>
<%
dim sql_xc0
dim rs_xc0
sql_xc0="select sum(pdlb) as down_xc0 from mqfh where addsheng = '四川省' and DateDiff('d',date(),pddate)=0 " 
Set rs_xc0= Server.CreateObject("ADODB.Recordset") 
rs_xc0.open sql_xc0,conn7,1,1
%>
<%
dim sql_gz0
dim rs_gz0
sql_gz0="select sum(pdlb) as down_gz0 from mqfh where addsheng = '贵州省' and DateDiff('d',date(),pddate)=0 " 
Set rs_gz0= Server.CreateObject("ADODB.Recordset") 
rs_gz0.open sql_gz0,conn7,1,1
%>
<%
dim sql_un0
dim rs_un0
sql_un0="select sum(pdlb) as down_un0 from mqfh where addsheng = '云南省' and DateDiff('d',date(),pddate)=0 " 
Set rs_un0= Server.CreateObject("ADODB.Recordset") 
rs_un0.open sql_un0,conn7,1,1
%>
<%
dim sql_xz0
dim rs_xz0
sql_xz0="select sum(pdlb) as down_xz0 from mqfh where addsheng = '西藏自治区' and DateDiff('d',date(),pddate)=0 " 
Set rs_xz0= Server.CreateObject("ADODB.Recordset") 
rs_xz0.open sql_xz0,conn7,1,1
%>
<%
dim sql_sxs0
dim rs_sxs0
sql_sxs0="select sum(pdlb) as down_sxs0 from mqfh where addsheng = '陕西省' and DateDiff('d',date(),pddate)=0 " 
Set rs_sxs0= Server.CreateObject("ADODB.Recordset") 
rs_sxs0.open sql_sxs0,conn7,1,1
%>
<%
dim sql_js0
dim rs_js0
sql_js0="select sum(pdlb) as down_js0 from mqfh where addsheng = '甘肃省' and DateDiff('d',date(),pddate)=0 " 
Set rs_js0= Server.CreateObject("ADODB.Recordset") 
rs_js0.open sql_js0,conn7,1,1
%>
<%
dim sql_qh0
dim rs_qh0
sql_qh0="select sum(pdlb) as down_qh0 from mqfh where addsheng = '青海省' and DateDiff('d',date(),pddate)=0 " 
Set rs_qh0= Server.CreateObject("ADODB.Recordset") 
rs_qh0.open sql_qh0,conn7,1,1
%>
<%
dim sql_ns0
dim rs_ns0
sql_ns0="select sum(pdlb) as down_ns0 from mqfh where addsheng = '宁夏回族自治区' and DateDiff('d',date(),pddate)=0 " 
Set rs_ns0= Server.CreateObject("ADODB.Recordset") 
rs_ns0.open sql_ns0,conn7,1,1
%>
<%
dim sql_sj0
dim rs_sj0
sql_sj0="select sum(pdlb) as down_sj0 from mqfh where addsheng = '新疆维吾尔自治区' and DateDiff('d',date(),pddate)=0 " 
Set rs_sj0= Server.CreateObject("ADODB.Recordset") 
rs_sj0.open sql_sj0,conn7,1,1
%>
<%
dim sql_tw0
dim rs_tw0
sql_tw0="select sum(pdlb) as down_tw0 from mqfh where addsheng = '台湾省' and DateDiff('d',date(),pddate)=0 " 
Set rs_tw0= Server.CreateObject("ADODB.Recordset") 
rs_tw0.open sql_tw0,conn7,1,1
%>
<%
dim sql_sg0
dim rs_sg0
sql_sg0="select sum(pdlb) as down_sg0 from mqfh where addsheng = '香港特别行政区' and DateDiff('d',date(),pddate)=0 " 
Set rs_sg0= Server.CreateObject("ADODB.Recordset") 
rs_sg0.open sql_sg0,conn7,1,1
%>
<%
dim sql_om0
dim rs_om0
sql_om0="select sum(pdlb) as down_om0 from mqfh where addsheng = '澳门特别行政区' and DateDiff('d',date(),pddate)=0 " 
Set rs_om0= Server.CreateObject("ADODB.Recordset") 
rs_om0.open sql_om0,conn7,1,1
%>
<div align="center">
	　<table border="0" width="90%" id="table2" cellspacing="1">
	<tr>
	<td>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><a href="javascript:openwindow('datesheng.asp')" style="text-decoration: none"><span style="font-size: 11pt">全国统计情况</span></a><span style="font-size: 11pt">
	</span> </b>
	<span style="font-size: 11pt">
	<iframe name="I1" src="dateshiqu.asp" height="30" width="800" border="0" frameborder="0" scrolling="no"></iframe>
	<iframe name="I2" scrolling="no" border="0" frameborder="0" height="30" width="850"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前华东一区<b><font color="#0000FF"><%=rs_sd0("down_sd0")+rs_zs0("down_zs0")+rs_sh0("down_sh0")%></font></b>股（其中山东<b><font color="#800000"><%=rs_sd0("down_sd0")%></font></b>股、江苏<b><font color="#800000"><%=rs_zs0("down_zs0")%></font></b>股、上海<b><font color="#800000"><%=rs_sh0("down_sh0")%></font></b>股）---<a href="javascript:openwindow('8dqu0.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I3" scrolling="no" border="0" frameborder="0" height="85" width="620" src="8dqu0.asp" marginwidth="1" marginheight="1"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前华东二区<b><font color="#0000FF"><%=rs_nf0("down_nf0")+rs_zz0("down_zz0")+rs_fz0("down_fz0")%></font></b>股（其中安徽<b><font color="#800000"><%=rs_nf0("down_nf0")%></font></b>股、浙江<b><font color="#800000"><%=rs_zz0("down_zz0")%></font></b>股、福建<b><font color="#800000"><%=rs_fz0("down_fz0")%></font></b>股）---<a href="javascript:openwindow('8dqu1.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I4" scrolling="no" border="0" frameborder="0" height="85" width="620" marginwidth="1" marginheight="1" src="8dqu1.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前华南地区<b><font color="#0000FF"><%=rs_gd0("down_gd0")+rs_gx0("down_gx0")+rs_nn0("down_nn0")%></font></b>股（其中广东<b><font color="#800000"><%=rs_gd0("down_gd0")%></font></b>股、广西<b><font color="#800000"><%=rs_gx0("down_gx0")%></font></b>股、海南<b><font color="#800000"><%=rs_nn0("down_nn0")%></font></b>股、四川<b><font color="#800000"><%=rs_xc0("down_xc0")%></font></b>股）---<a href="javascript:openwindow('8dqu2.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I5" scrolling="no" border="0" frameborder="0" height="85" width="620" marginwidth="1" marginheight="1" src="8dqu2.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前华中地区<b><font color="#0000FF"><%=rs_hbs0("down_hbs0")+rs_hns0("down_hns0")+rs_hn0("down_hn0")+rs_zx0("down_zx0")%></font></b>股（其中湖北<b><font color="#800000"><%=rs_hbs0("down_hbs0")%></font></b>股、湖南<b><font color="#800000"><%=rs_hns0("down_hns0")%></font></b>股、河南<b><font color="#800000"><%=rs_hn0("down_hn0")%></font></b>股、江西<b><font color="#800000"><%=rs_zx0("down_zx0")%></font></b>股）---<a href="javascript:openwindow('8dqu3.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I6" scrolling="no" border="0" frameborder="0" height="85" width="680" marginwidth="1" marginheight="1" src="8dqu3.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前华北地区<b><font color="#0000FF"><%=rs_bj0("down_bj0")+rs_tj0("down_tj0")+rs_hb0("down_hb0")+rs_sx0("down_sx0")+rs_nmg0("down_nmg0")%></font></b>股（其中北京<b><font color="#800000"><%=rs_bj0("down_bj0")%></font></b>股、天津<b><font color="#800000"><%=rs_tj0("down_tj0")%></font></b>股、河北<b><font color="#800000"><%=rs_hb0("down_hb0")%></font></b>股、山西<b><font color="#800000"><%=rs_sx0("down_sx0")%></font></b>股、内蒙古<b><font color="#800000"><%=rs_nmg0("down_nmg0")%></font></b>股）---<a href="javascript:openwindow('8dqu4.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I7" scrolling="no" border="0" frameborder="0" height="85" width="720" src="8dqu4.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前西北地区<b><font color="#0000FF"><%=rs_ns0("down_ns0")+rs_sj0("down_sj0")+rs_qh0("down_qh0")+rs_sxs0("down_sxs0")+rs_js0("down_js0")%></font></b>股（其中宁夏<b><font color="#800000"><%=rs_ns0("down_ns0")%></font></b>股、新疆<b><font color="#800000"><%=rs_sj0("down_sj0")%></font></b>股、青海<b><font color="#800000"><%=rs_qh0("down_qh0")%></font></b>股、陕西<b><font color="#800000"><%=rs_sxs0("down_sxs0")%></font></b>股、甘肃<b><font color="#800000"><%=rs_js0("down_js0")%></font></b>股）---<a href="javascript:openwindow('8dqu5.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I8" scrolling="no" border="0" frameborder="0" height="85" width="720" src="8dqu5.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前西南地区<b><font color="#0000FF"><%=rs_xc0("down_xc0")+rs_un0("down_un0")+rs_gz0("down_gz0")+rs_xz0("down_xz0")+rs_cq0("down_cq0")%></font></b>股（其中云南<b><font color="#800000"><%=rs_un0("down_un0")%></font></b>股、贵州<b><font color="#800000"><%=rs_gz0("down_gz0")%></font></b>股、西藏<b><font color="#800000"><%=rs_xz0("down_xz0")%></font></b>股、重庆<b><font color="#800000"><%=rs_cq0("down_cq0")%></font></b>股）---<a href="javascript:openwindow('8dqu6.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I9" scrolling="no" border="0" frameborder="0" height="85" width="720" src="8dqu6.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前东北地区<b><font color="#0000FF"><%=rs_ln0("down_ln0")+rs_jl0("down_jl0")+rs_hlj0("down_hlj0")%></font></b>股（其中辽宁<b><font color="#800000"><%=rs_ln0("down_ln0")%></font></b>股、吉林<b><font color="#800000"><%=rs_jl0("down_jl0")%></font></b>股、黑龙江<b><font color="#800000"><%=rs_hlj0("down_hlj0")%></font></b>股）---<a href="javascript:openwindow('8dqu7.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I10" scrolling="no" border="0" frameborder="0" height="85" width="620" src="8dqu7.asp"></iframe>
	</span>
	</p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">今天目前港澳台地区<b><font color="#0000FF"><%=rs_tw0("down_tw0")+rs_sg0("down_sg0")+rs_om0("down_om0")%></font></b>股（其中台湾<b><font color="#800000"><%=rs_tw0("down_tw0")%></font></b>股、香港<b><font color="#800000"><%=rs_sg0("down_sg0")%></font></b>股、澳门<b><font color="#800000"><%=rs_om0("down_om0")%></font></b>股）---<a href="javascript:openwindow('8dqu8.asp')" style="text-decoration: none">历史记录</a></span></p>
	<p style="line-height: 150%; margin-top: 0; margin-bottom: 0">
	<span style="font-size: 11pt">
	<iframe name="I11" scrolling="no" border="0" frameborder="0" height="85" width="620" src="8dqu8.asp"></iframe>
	</span>
	</p>
	</td>
		</tr>
	</table>
	</div>