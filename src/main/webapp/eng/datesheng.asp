<!--#include file="../mq0618.asp"-->
<% 
dim sql_cg
dim rs_cg
sql_cg="select sum(pdlb) as down_cg from mqfh " 
Set rs_cg= Server.CreateObject("ADODB.Recordset") 
rs_cg.open sql_cg,conn7,1,1
%>
<% 
dim sql_bj
dim rs_bj
sql_bj="select sum(pdlb) as down_bj from mqfh where addsheng = '北京市'" 
Set rs_bj= Server.CreateObject("ADODB.Recordset") 
rs_bj.open sql_bj,conn7,1,1
%>
<% 
dim sql_tj
dim rs_tj
sql_tj="select sum(pdlb) as down_tj from mqfh where addsheng = '天津市'" 
Set rs_tj= Server.CreateObject("ADODB.Recordset") 
rs_tj.open sql_tj,conn7,1,1
%>
<% 
dim sql_hb
dim rs_hb
sql_hb="select sum(pdlb) as down_hb from mqfh where addsheng = '河北省'" 
Set rs_hb= Server.CreateObject("ADODB.Recordset") 
rs_hb.open sql_hb,conn7,1,1
%>
<% 
dim sql_sx
dim rs_sx
sql_sx="select sum(pdlb) as down_sx from mqfh where addsheng = '山西省'" 
Set rs_sx= Server.CreateObject("ADODB.Recordset") 
rs_sx.open sql_sx,conn7,1,1
%>
<% 
dim sql_nmg
dim rs_nmg
sql_nmg="select sum(pdlb) as down_nmg from mqfh where addsheng = '内蒙古自治区'" 
Set rs_nmg= Server.CreateObject("ADODB.Recordset") 
rs_nmg.open sql_nmg,conn7,1,1
%>
<% 
dim sql_ln
dim rs_ln
sql_ln="select sum(pdlb) as down_ln from mqfh where addsheng = '辽宁省'" 
Set rs_ln= Server.CreateObject("ADODB.Recordset") 
rs_ln.open sql_ln,conn7,1,1
%>
<% 
dim sql_jl
dim rs_jl
sql_jl="select sum(pdlb) as down_jl from mqfh where addsheng = '吉林省'" 
Set rs_jl= Server.CreateObject("ADODB.Recordset") 
rs_jl.open sql_jl,conn7,1,1
%>
<% 
dim sql_hlj
dim rs_hlj
sql_hlj="select sum(pdlb) as down_hlj from mqfh where addsheng = '黑龙江省'" 
Set rs_hlj= Server.CreateObject("ADODB.Recordset") 
rs_hlj.open sql_hlj,conn7,1,1
%>
<% 
dim sql_sh
dim rs_sh
sql_sh="select sum(pdlb) as down_sh from mqfh where addsheng = '上海市'" 
Set rs_sh= Server.CreateObject("ADODB.Recordset") 
rs_sh.open sql_sh,conn7,1,1
%>
<% 
dim sql_zs
dim rs_zs
sql_zs="select sum(pdlb) as down_zs from mqfh where addsheng = '江苏省'" 
Set rs_zs= Server.CreateObject("ADODB.Recordset") 
rs_zs.open sql_zs,conn7,1,1
%>
<% 
dim sql_zz
dim rs_zz
sql_zz="select sum(pdlb) as down_zz from mqfh where addsheng = '浙江省'" 
Set rs_zz= Server.CreateObject("ADODB.Recordset") 
rs_zz.open sql_zz,conn7,1,1
%>
<% 
dim sql_nf
dim rs_nf
sql_nf="select sum(pdlb) as down_nf from mqfh where addsheng = '安徽省'" 
Set rs_nf= Server.CreateObject("ADODB.Recordset") 
rs_nf.open sql_nf,conn7,1,1
%>
<% 
dim sql_fz
dim rs_fz
sql_fz="select sum(pdlb) as down_fz from mqfh where addsheng = '福建省'" 
Set rs_fz= Server.CreateObject("ADODB.Recordset") 
rs_fz.open sql_fz,conn7,1,1
%>
<%
dim sql_zx
dim rs_zx
sql_zx="select sum(pdlb) as down_zx from mqfh where addsheng = '江西省'" 
Set rs_zx= Server.CreateObject("ADODB.Recordset") 
rs_zx.open sql_zx,conn7,1,1
%>
<%
dim sql_sd
dim rs_sd
sql_sd="select sum(pdlb) as down_sd from mqfh where addsheng = '山东省'" 
Set rs_sd= Server.CreateObject("ADODB.Recordset") 
rs_sd.open sql_sd,conn7,1,1
%>
<%
dim sql_hn
dim rs_hn
sql_hn="select sum(pdlb) as down_hn from mqfh where addsheng = '河南省'" 
Set rs_hn= Server.CreateObject("ADODB.Recordset") 
rs_hn.open sql_hn,conn7,1,1
%>
<%
dim sql_hbs
dim rs_hbs
sql_hbs="select sum(pdlb) as down_hbs from mqfh where addsheng = '湖北省'" 
Set rs_hbs= Server.CreateObject("ADODB.Recordset") 
rs_hbs.open sql_hbs,conn7,1,1
%>
<%
dim sql_hns
dim rs_hns
sql_hns="select sum(pdlb) as down_hns from mqfh where addsheng = '湖南省'" 
Set rs_hns= Server.CreateObject("ADODB.Recordset") 
rs_hns.open sql_hns,conn7,1,1
%>
<%
dim sql_gd
dim rs_gd
sql_gd="select sum(pdlb) as down_gd from mqfh where addsheng = '广东省'" 
Set rs_gd= Server.CreateObject("ADODB.Recordset") 
rs_gd.open sql_gd,conn7,1,1
%>
<%
dim sql_gx
dim rs_gx
sql_gx="select sum(pdlb) as down_gx from mqfh where addsheng = '广西壮族自治区'" 
Set rs_gx= Server.CreateObject("ADODB.Recordset") 
rs_gx.open sql_gx,conn7,1,1
%>
<%
dim sql_nn
dim rs_nn
sql_nn="select sum(pdlb) as down_nn from mqfh where addsheng = '海南省'" 
Set rs_nn= Server.CreateObject("ADODB.Recordset") 
rs_nn.open sql_nn,conn7,1,1
%>
<%
dim sql_cq
dim rs_cq
sql_cq="select sum(pdlb) as down_cq from mqfh where addsheng = '重庆市'" 
Set rs_cq= Server.CreateObject("ADODB.Recordset") 
rs_cq.open sql_cq,conn7,1,1
%>
<%
dim sql_xc
dim rs_xc
sql_xc="select sum(pdlb) as down_xc from mqfh where addsheng = '四川省'" 
Set rs_xc= Server.CreateObject("ADODB.Recordset") 
rs_xc.open sql_xc,conn7,1,1
%>
<%
dim sql_gz
dim rs_gz
sql_gz="select sum(pdlb) as down_gz from mqfh where addsheng = '贵州省'" 
Set rs_gz= Server.CreateObject("ADODB.Recordset") 
rs_gz.open sql_gz,conn7,1,1
%>
<%
dim sql_un
dim rs_un
sql_un="select sum(pdlb) as down_un from mqfh where addsheng = '云南省'" 
Set rs_un= Server.CreateObject("ADODB.Recordset") 
rs_un.open sql_un,conn7,1,1
%>
<%
dim sql_xz
dim rs_xz
sql_xz="select sum(pdlb) as down_xz from mqfh where addsheng = '西藏自治区'" 
Set rs_xz= Server.CreateObject("ADODB.Recordset") 
rs_xz.open sql_xz,conn7,1,1
%>
<%
dim sql_sxs
dim rs_sxs
sql_sxs="select sum(pdlb) as down_sxs from mqfh where addsheng = '陕西省'" 
Set rs_sxs= Server.CreateObject("ADODB.Recordset") 
rs_sxs.open sql_sxs,conn7,1,1
%>
<%
dim sql_js
dim rs_js
sql_js="select sum(pdlb) as down_js from mqfh where addsheng = '甘肃省'" 
Set rs_js= Server.CreateObject("ADODB.Recordset") 
rs_js.open sql_js,conn7,1,1
%>
<%
dim sql_qh
dim rs_qh
sql_qh="select sum(pdlb) as down_qh from mqfh where addsheng = '青海省'" 
Set rs_qh= Server.CreateObject("ADODB.Recordset") 
rs_qh.open sql_qh,conn7,1,1
%>
<%
dim sql_ns
dim rs_ns
sql_ns="select sum(pdlb) as down_ns from mqfh where addsheng = '宁夏回族自治区'" 
Set rs_ns= Server.CreateObject("ADODB.Recordset") 
rs_ns.open sql_ns,conn7,1,1
%>
<%
dim sql_sj
dim rs_sj
sql_sj="select sum(pdlb) as down_sj from mqfh where addsheng = '新疆维吾尔自治区'" 
Set rs_sj= Server.CreateObject("ADODB.Recordset") 
rs_sj.open sql_sj,conn7,1,1
%>
<%
dim sql_tw
dim rs_tw
sql_tw="select sum(pdlb) as down_tw from mqfh where addsheng = '台湾省'" 
Set rs_tw= Server.CreateObject("ADODB.Recordset") 
rs_tw.open sql_tw,conn7,1,1
%>
<%
dim sql_sg
dim rs_sg
sql_sg="select sum(pdlb) as down_sg from mqfh where addsheng = '香港特别行政区'" 
Set rs_sg= Server.CreateObject("ADODB.Recordset") 
rs_sg.open sql_sg,conn7,1,1
%>
<%
dim sql_om
dim rs_om
sql_om="select sum(pdlb) as down_om from mqfh where addsheng = '澳门特别行政区'" 
Set rs_om= Server.CreateObject("ADODB.Recordset") 
rs_om.open sql_om,conn7,1,1
%><div align="center">
	<table BORDER="0" BGCOLOR="#ffffff" id="table1" width="221" height="889" cellpadding="2" cellspacing="3">
	<thead>
	</thead>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font color="#0000FF"><b>Nationwide</b></font></td>
		<td BORDERCOLOR="#c0c0c0" align="left"><font color="#0000FF"><b><%=rs_cg("down_cg")%></b></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Beijing</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_bj("down_bj")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Tianjin</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_tj("down_tj")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Hebei Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_hb("down_hb")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Shanxi Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_sx("down_sx")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Inner Mongolia</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_nmg("down_nmg")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Liaoning Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_ln("down_ln")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Jilin Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_jl("down_jl")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Heilongjiang Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_hlj("down_hlj")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Shanghai</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_sh("down_sh")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Jiangsu Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_zs("down_zs")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Zhejiang Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_zz("down_zz")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Anhui Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_nf("down_nf")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Fujian Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_fz("down_fz")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Jiangxi Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_zx("down_zx")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Shandong Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_sd("down_sd")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Henan Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_hn("down_hn")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Hubei Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_hbs("down_hbs")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Hunan Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_hns("down_hns")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Guangdong Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_gd("down_gd")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Guangxi Zhuang Autonomous Region</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_gx("down_gx")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Hainan Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_nn("down_nn")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Chongqing</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_cq("down_cq")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Sichuan Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_xc("down_xc")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Guizhou Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_gz("down_gz")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Yunnan Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_un("down_un")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Tibet Autonomous Region</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_xz("down_xz")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Shaanxi Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_sxs("down_sxs")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Gansu Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_js("down_js")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Qinghai Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_qh("down_qh")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Ningxia Hui Autonomous Region</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_ns("down_ns")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Xinjiang</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_sj("down_sj")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Taiwan Province</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_tw("down_tw")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Region</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_sg("down_sg")%></font></td>
	</tr>
	<tr VALIGN="TOP">
		<td BORDERCOLOR="#c0c0c0" width="134" align="right">
		<font FACE="宋体" COLOR="#000000">Macao Special Administrative Region</font></td>
		<td BORDERCOLOR="#c0c0c0" align="left">
		<font style="font-weight:700" FACE="宋体" COLOR="#FF0000" size="2"><%=rs_om("down_om")%></font></td>
	</tr>
	<tfoot>
	</tfoot>
</table></div>