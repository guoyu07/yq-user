<!--#include file="../mq0618.asp"-->
<!--#include file="checkadmin.asp"-->
<%
Dim StrSQL, rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM mqfh where ljpay>50 "
rsTest.Open StrSQL, Conn7,2,3
While Not rsTest.EOF
    mq=rsTest("ljpay")/50
    mq50=int(mq/1)
    mq120=mq50*50
    rsTest("pdlb")=rsTest("pdlb")-mq50
    rsTest("ljpay")=rsTest("ljpay")-mq120
    rsTest.update
    rsTest.MoveNext
Wend
rsTest.UpdateBatch
%>
<%
set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "SELECT sum(pdlb) as jt FROM mqfh where DateDiff('d',date(),pddate)=-1 "
rs1.open sql1,Conn7,2,3
%>
<%
set rs2 = Server.CreateObject("ADODB.Recordset")
sql2 = "SELECT sum(pdlb) as ct FROM mqfh where DateDiff('d',date(),pddate)<-1 "
rs2.open sql2,Conn7,2,3
cjt=rs1("jt")+rs2("ct")
%>
<%
set rs4 = Server.CreateObject("ADODB.Recordset")
sql4 = "SELECT sum(mqpay) as mq FROM mqfh where pdid>0"
rs4.open sql4,Conn7,2,3
%>
<%
set rs_fh = Server.CreateObject("ADODB.Recordset")
sql_fh = "SELECT * FROM fhdate"
rs_fh.open sql_fh,Conn7,2,3
rs_fh.addnew
rs_fh("date")=date()-1
rs_fh("zly")=rs1("jt")
'ly5=rs1("jt")*10/2
'rs_fh("ly5")=ly5
rs_fh("fhk")=cjt
rs_fh("tjmq")=rs4("mq")
rs_fh("vipfhpay")=0.005
rs_fh("fhpay")=0.001
rs_fh.update
%>
<%
dim sql_cg
dim rs_cg
sql_cg="select sum(pdlb) as down_cg from mqfh where DateDiff('d',date(),pddate)=-1 " 
Set rs_cg= Server.CreateObject("ADODB.Recordset") 
rs_cg.open sql_cg,Conn7,1,1
%>
<% 
sql_01="select * from mqfh where addsheng = '北京市' and DateDiff('d',date(),pddate)=-1 "
Set rs_01= Server.CreateObject("ADODB.Recordset")
rs_01.open sql_01,Conn7,1,1
if not rs_01.eof then
sql_bj="select sum(pdlb) as down_bj from mqfh where addsheng = '北京市' and DateDiff('d',date(),pddate)=-1 " 
Set rs_bj= Server.CreateObject("ADODB.Recordset")
rs_bj.open sql_bj,Conn7,1,1
   bj=rs_bj("down_bj")
else
   bj=0
end if
%>
<% 
sql_02="select * from mqfh where addsheng = '天津市' and DateDiff('d',date(),pddate)=-1 "
Set rs_02= Server.CreateObject("ADODB.Recordset")
rs_02.open sql_02,Conn7,1,1
if not rs_02.eof then
sql_tj="select sum(pdlb) as down_tj from mqfh where addsheng = '天津市' and DateDiff('d',date(),pddate)=-1 " 
Set rs_tj= Server.CreateObject("ADODB.Recordset") 
rs_tj.open sql_tj,Conn7,1,1
   tj=rs_tj("down_tj")
else
   tj=0
end if
%>
<% 
sql_03="select * from mqfh where addsheng = '河北省' and DateDiff('d',date(),pddate)=-1 "
Set rs_03= Server.CreateObject("ADODB.Recordset")
rs_03.open sql_03,Conn7,1,1
if not rs_03.eof then
sql_hb="select sum(pdlb) as down_hb from mqfh where addsheng = '河北省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_hb= Server.CreateObject("ADODB.Recordset") 
rs_hb.open sql_hb,Conn7,1,1
   hb=rs_hb("down_hb")
else
   hb=0
end if
%>
<% 
sql_04="select * from mqfh where addsheng = '山西省' and DateDiff('d',date(),pddate)=-1 "
Set rs_04= Server.CreateObject("ADODB.Recordset")
rs_04.open sql_04,Conn7,1,1
if not rs_04.eof then
sql_sx="select sum(pdlb) as down_sx from mqfh where addsheng = '山西省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_sx= Server.CreateObject("ADODB.Recordset") 
rs_sx.open sql_sx,Conn7,1,1
   sx=rs_sx("down_sx")
else
   sx=0
end if
%>
<% 
sql_05="select * from mqfh where addsheng = '内蒙古自治区' and DateDiff('d',date(),pddate)=-1 "
Set rs_05= Server.CreateObject("ADODB.Recordset")
rs_05.open sql_05,Conn7,1,1
if not rs_05.eof then
sql_nmg="select sum(pdlb) as down_nmg from mqfh where addsheng = '内蒙古自治区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_nmg= Server.CreateObject("ADODB.Recordset") 
rs_nmg.open sql_nmg,Conn7,1,1
   nmg=rs_nmg("down_nmg")
else
   nmg=0
end if
%>
<% 
sql_06="select * from mqfh where addsheng = '辽宁省' and DateDiff('d',date(),pddate)=-1 "
Set rs_06= Server.CreateObject("ADODB.Recordset")
rs_06.open sql_06,Conn7,1,1
if not rs_06.eof then
sql_ln="select sum(pdlb) as down_ln from mqfh where addsheng = '辽宁省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_ln= Server.CreateObject("ADODB.Recordset") 
rs_ln.open sql_ln,Conn7,1,1
   ln=rs_ln("down_ln")
else
   ln=0
end if
%>
<% 
sql_07="select * from mqfh where addsheng = '吉林省' and DateDiff('d',date(),pddate)=-1 "
Set rs_07= Server.CreateObject("ADODB.Recordset")
rs_07.open sql_07,Conn7,1,1
if not rs_07.eof then
sql_jl="select sum(pdlb) as down_jl from mqfh where addsheng = '吉林省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_jl= Server.CreateObject("ADODB.Recordset") 
rs_jl.open sql_jl,Conn7,1,1
   jl=rs_jl("down_jl")
else
   jl=0
end if
%>
<% 
sql_08="select * from mqfh where addsheng = '黑龙江省' and DateDiff('d',date(),pddate)=-1 "
Set rs_08= Server.CreateObject("ADODB.Recordset")
rs_08.open sql_08,Conn7,1,1
if not rs_08.eof then
sql_hlj="select sum(pdlb) as down_hlj from mqfh where addsheng = '黑龙江省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_hlj= Server.CreateObject("ADODB.Recordset") 
rs_hlj.open sql_hlj,Conn7,1,1
  hlj=rs_hlj("down_hlj")
else
  hlj=0
end if
%>
<% 
sql_09="select * from mqfh where addsheng = '上海市' and DateDiff('d',date(),pddate)=-1 "
Set rs_09= Server.CreateObject("ADODB.Recordset")
rs_09.open sql_09,Conn7,1,1
if not rs_09.eof then
sql_sh="select sum(pdlb) as down_sh from mqfh where addsheng = '上海市' and DateDiff('d',date(),pddate)=-1 " 
Set rs_sh= Server.CreateObject("ADODB.Recordset") 
rs_sh.open sql_sh,Conn7,1,1
   sh=rs_sh("down_sh")
else
   sh=0
end if
%>
<% 
sql_10="select * from mqfh where addsheng = '江苏省' and DateDiff('d',date(),pddate)=-1 "
Set rs_10= Server.CreateObject("ADODB.Recordset")
rs_10.open sql_10,Conn7,1,1
if not rs_10.eof then
sql_zs="select sum(pdlb) as down_zs from mqfh where addsheng = '江苏省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_zs= Server.CreateObject("ADODB.Recordset") 
rs_zs.open sql_zs,Conn7,1,1
   zs=rs_zs("down_zs")
else
   zs=0
end if
%>
<% 
sql_11="select * from mqfh where addsheng = '浙江省' and DateDiff('d',date(),pddate)=-1 "
Set rs_11= Server.CreateObject("ADODB.Recordset")
rs_11.open sql_11,Conn7,1,1
if not rs_11.eof then
sql_zz="select sum(pdlb) as down_zz from mqfh where addsheng = '浙江省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_zz= Server.CreateObject("ADODB.Recordset") 
rs_zz.open sql_zz,Conn7,1,1
   zz=rs_zz("down_zz")
else
   zz=0
end if
%>
<% 
sql_12="select * from mqfh where addsheng = '安徽省' and DateDiff('d',date(),pddate)=-1 "
Set rs_12= Server.CreateObject("ADODB.Recordset")
rs_12.open sql_12,Conn7,1,1
if not rs_12.eof then
sql_nf="select sum(pdlb) as down_nf from mqfh where addsheng = '安徽省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_nf= Server.CreateObject("ADODB.Recordset") 
rs_nf.open sql_nf,Conn7,1,1
   nf=rs_nf("down_nf")
else
   nf=0
end if
%>
<% 
sql_13="select * from mqfh where addsheng = '福建省' and DateDiff('d',date(),pddate)=-1 "
Set rs_13= Server.CreateObject("ADODB.Recordset")
rs_13.open sql_13,Conn7,1,1
if not rs_13.eof then
sql_fz="select sum(pdlb) as down_fz from mqfh where addsheng = '福建省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_fz= Server.CreateObject("ADODB.Recordset") 
rs_fz.open sql_fz,Conn7,1,1
  fz=rs_fz("down_fz")
else
  fz=0
end if
%>
<%
sql_14="select * from mqfh where addsheng = '江西省' and DateDiff('d',date(),pddate)=-1 "
Set rs_14= Server.CreateObject("ADODB.Recordset")
rs_14.open sql_14,Conn7,1,1
if not rs_14.eof then
sql_zx="select sum(pdlb) as down_zx from mqfh where addsheng = '江西省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_zx= Server.CreateObject("ADODB.Recordset") 
rs_zx.open sql_zx,Conn7,1,1
  zx=rs_zx("down_zx")
else
  zx=0
end if
%>
<%
sql_15="select * from mqfh where addsheng = '山东省' and DateDiff('d',date(),pddate)=-1 "
Set rs_15= Server.CreateObject("ADODB.Recordset")
rs_15.open sql_15,Conn7,1,1
if not rs_15.eof then
sql_sd="select sum(pdlb) as down_sd from mqfh where addsheng = '山东省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_sd= Server.CreateObject("ADODB.Recordset") 
rs_sd.open sql_sd,Conn7,1,1
  sd=rs_sd("down_sd")
else
  sd=0
end if
%>
<%
sql_16="select * from mqfh where addsheng = '河南省' and DateDiff('d',date(),pddate)=-1 "
Set rs_16= Server.CreateObject("ADODB.Recordset")
rs_16.open sql_16,Conn7,1,1
if not rs_16.eof then
sql_hn="select sum(pdlb) as down_hn from mqfh where addsheng = '河南省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_hn= Server.CreateObject("ADODB.Recordset") 
rs_hn.open sql_hn,Conn7,1,1
  hn=rs_hn("down_hn")
else
  hn=0
end if
%>
<%
sql_17="select * from mqfh where addsheng = '湖北省' and DateDiff('d',date(),pddate)=-1 "
Set rs_17= Server.CreateObject("ADODB.Recordset")
rs_17.open sql_17,Conn7,1,1
if not rs_17.eof then
sql_hbs="select sum(pdlb) as down_hbs from mqfh where addsheng = '湖北省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_hbs= Server.CreateObject("ADODB.Recordset") 
rs_hbs.open sql_hbs,Conn7,1,1
  hbs=rs_hbs("down_hbs")
else
  hbs=0
end if
%>
<%
sql_18="select * from mqfh where addsheng = '湖南省' and DateDiff('d',date(),pddate)=-1 "
Set rs_18= Server.CreateObject("ADODB.Recordset")
rs_18.open sql_18,Conn7,1,1
if not rs_18.eof then
sql_hns="select sum(pdlb) as down_hns from mqfh where addsheng = '湖南省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_hns= Server.CreateObject("ADODB.Recordset") 
rs_hns.open sql_hns,Conn7,1,1
  hns=rs_hns("down_hns")
else
  hns=0
end if
%>
<%
sql_19="select * from mqfh where addsheng = '广东省' and DateDiff('d',date(),pddate)=-1 "
Set rs_19= Server.CreateObject("ADODB.Recordset")
rs_19.open sql_19,Conn7,1,1
if not rs_19.eof then
sql_gd="select sum(pdlb) as down_gd from mqfh where addsheng = '广东省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_gd= Server.CreateObject("ADODB.Recordset") 
rs_gd.open sql_gd,Conn7,1,1
  gd=rs_gd("down_gd")
else
  gd=0
end if
%>
<%
sql_20="select * from mqfh where addsheng = '广西壮族自治区' and DateDiff('d',date(),pddate)=-1 "
Set rs_20= Server.CreateObject("ADODB.Recordset")
rs_20.open sql_20,Conn7,1,1
if not rs_20.eof then
sql_gx="select sum(pdlb) as down_gx from mqfh where addsheng = '广西壮族自治区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_gx= Server.CreateObject("ADODB.Recordset") 
rs_gx.open sql_gx,Conn7,1,1
   gx=rs_gx("down_gx")
else
  gx=0
end if
%>
<%
sql_21="select * from mqfh where addsheng = '海南省' and DateDiff('d',date(),pddate)=-1 "
Set rs_21= Server.CreateObject("ADODB.Recordset")
rs_21.open sql_21,Conn7,1,1
if not rs_21.eof then
sql_nn="select sum(pdlb) as down_nn from mqfh where addsheng = '海南省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_nn= Server.CreateObject("ADODB.Recordset") 
rs_nn.open sql_nn,Conn7,1,1
   nn=rs_nn("down_nn")
else
   nn=0
end if
%>
<%
sql_22="select * from mqfh where addsheng = '重庆市' and DateDiff('d',date(),pddate)=-1 "
Set rs_22= Server.CreateObject("ADODB.Recordset")
rs_22.open sql_22,Conn7,1,1
if not rs_22.eof then
sql_cq="select sum(pdlb) as down_cq from mqfh where addsheng = '重庆市' and DateDiff('d',date(),pddate)=-1 " 
Set rs_cq= Server.CreateObject("ADODB.Recordset") 
rs_cq.open sql_cq,Conn7,1,1
   cq=rs_cq("down_cq")
else
   cq=0
end if
%>
<%
sql_23="select * from mqfh where addsheng = '四川省' and DateDiff('d',date(),pddate)=-1 "
Set rs_23= Server.CreateObject("ADODB.Recordset")
rs_23.open sql_23,Conn7,1,1
if not rs_23.eof then
sql_xc="select sum(pdlb) as down_xc from mqfh where addsheng = '四川省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_xc= Server.CreateObject("ADODB.Recordset") 
rs_xc.open sql_xc,Conn7,1,1
   xc=rs_xc("down_xc")
else
   xc=0
end if
%>
<%
sql_24="select * from mqfh where addsheng = '贵州省' and DateDiff('d',date(),pddate)=-1 "
Set rs_24= Server.CreateObject("ADODB.Recordset")
rs_24.open sql_24,Conn7,1,1
if not rs_24.eof then
sql_gz="select sum(pdlb) as down_gz from mqfh where addsheng = '贵州省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_gz= Server.CreateObject("ADODB.Recordset") 
rs_gz.open sql_gz,Conn7,1,1
  gz=rs_gz("down_gz")
else
  gz=0
end if
%>
<%
sql_25="select * from mqfh where addsheng = '云南省' and DateDiff('d',date(),pddate)=-1 "
Set rs_25= Server.CreateObject("ADODB.Recordset")
rs_25.open sql_25,Conn7,1,1
if not rs_25.eof then
sql_un="select sum(pdlb) as down_un from mqfh where addsheng = '云南省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_un= Server.CreateObject("ADODB.Recordset") 
rs_un.open sql_un,Conn7,1,1
  un=rs_un("down_un")
else
  un=0
end if
%>
<%
sql_26="select * from mqfh where addsheng = '西藏自治区' and DateDiff('d',date(),pddate)=-1 "
Set rs_26= Server.CreateObject("ADODB.Recordset")
rs_26.open sql_26,Conn7,1,1
if not rs_26.eof then
sql_xz="select sum(pdlb) as down_xz from mqfh where addsheng = '西藏自治区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_xz= Server.CreateObject("ADODB.Recordset") 
rs_xz.open sql_xz,Conn7,1,1
  xz=rs_xz("down_xz")
else
  xz=0
end if
%>
<%
sql_27="select * from mqfh where addsheng = '陕西省' and DateDiff('d',date(),pddate)=-1 "
Set rs_27= Server.CreateObject("ADODB.Recordset")
rs_27.open sql_27,Conn7,1,1
if not rs_27.eof then
sql_sxs="select sum(pdlb) as down_sxs from mqfh where addsheng = '陕西省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_sxs= Server.CreateObject("ADODB.Recordset") 
rs_sxs.open sql_sxs,Conn7,1,1
  sxs=rs_sxs("down_sxs")
else
  sxs=0
end if
%>
<%
sql_28="select * from mqfh where addsheng = '甘肃省' and DateDiff('d',date(),pddate)=-1 "
Set rs_28= Server.CreateObject("ADODB.Recordset")
rs_28.open sql_28,Conn7,1,1
if not rs_28.eof then
sql_js="select sum(pdlb) as down_js from mqfh where addsheng = '甘肃省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_js= Server.CreateObject("ADODB.Recordset") 
rs_js.open sql_js,Conn7,1,1
  js=rs_js("down_js")
else
  js=0
end if
%>
<%
sql_29="select * from mqfh where addsheng = '青海省' and DateDiff('d',date(),pddate)=-1 "
Set rs_29= Server.CreateObject("ADODB.Recordset")
rs_29.open sql_29,Conn7,1,1
if not rs_29.eof then
sql_qh="select sum(pdlb) as down_qh from mqfh where addsheng = '青海省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_qh= Server.CreateObject("ADODB.Recordset") 
rs_qh.open sql_qh,Conn7,1,1
  qh=rs_qh("down_qh")
else
  qh=0
end if
%>
<%
sql_30="select * from mqfh where addsheng = '宁夏回族自治区' and DateDiff('d',date(),pddate)=-1 "
Set rs_30= Server.CreateObject("ADODB.Recordset")
rs_30.open sql_30,Conn7,1,1
if not rs_30.eof then
sql_ns="select sum(pdlb) as down_ns from mqfh where addsheng = '宁夏回族自治区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_ns= Server.CreateObject("ADODB.Recordset") 
rs_ns.open sql_ns,Conn7,1,1
  ns=rs_ns("down_ns")
else
  ns=0
end if
%>
<%
sql_31="select * from mqfh where addsheng = '新疆维吾尔自治区' and DateDiff('d',date(),pddate)=-1 "
Set rs_31= Server.CreateObject("ADODB.Recordset")
rs_31.open sql_31,Conn7,1,1
if not rs_31.eof then
sql_sj="select sum(pdlb) as down_sj from mqfh where addsheng = '新疆维吾尔自治区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_sj= Server.CreateObject("ADODB.Recordset") 
rs_sj.open sql_sj,Conn7,1,1
  sj=rs_sj("down_sj")
else
  sj=0
end if
%>
<%
sql_32="select * from mqfh where addsheng = '台湾省' and DateDiff('d',date(),pddate)=-1 "
Set rs_32= Server.CreateObject("ADODB.Recordset")
rs_32.open sql_32,Conn7,1,1
if not rs_32.eof then
sql_tw="select sum(pdlb) as down_tw from mqfh where addsheng = '台湾省' and DateDiff('d',date(),pddate)=-1 " 
Set rs_tw= Server.CreateObject("ADODB.Recordset") 
rs_tw.open sql_tw,Conn7,1,1
  tw=rs_tw("down_tw")
else
  tw=0
end if
%>
<%
sql_33="select * from mqfh where addsheng = '香港特别行政区' and DateDiff('d',date(),pddate)=-1 "
Set rs_33= Server.CreateObject("ADODB.Recordset")
rs_33.open sql_33,Conn7,1,1
if not rs_33.eof then
sql_sg="select sum(pdlb) as down_sg from mqfh where addsheng = '香港特别行政区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_sg= Server.CreateObject("ADODB.Recordset") 
rs_sg.open sql_sg,Conn7,1,1
  sg=rs_sg("down_sg")
else
  sg=0
end if
%>
<%
sql_34="select * from mqfh where addsheng = '澳门特别行政区' and DateDiff('d',date(),pddate)=-1 "
Set rs_34= Server.CreateObject("ADODB.Recordset")
rs_34.open sql_34,Conn7,1,1
if not rs_34.eof then
sql_om="select sum(pdlb) as down_om from mqfh where addsheng = '澳门特别行政区' and DateDiff('d',date(),pddate)=-1 " 
Set rs_om= Server.CreateObject("ADODB.Recordset") 
rs_om.open sql_om,Conn7,1,1
  om=rs_om("down_om")
else
  om=0
end if
%>
<%
sql_s="select * from addsheng " 
Set rs_s= Server.CreateObject("ADODB.Recordset") 
rs_s.open sql_s,Conn7,2,3
rs_s.addnew
rs_s("date")=date()-1
rs_s("cg")=rs_cg("down_cg")
rs_s("bj")=bj
rs_s("qh")=qh
rs_s("js")=js
rs_s("sxs")=sxs
rs_s("xz")=xz
rs_s("gz")=gz
rs_s("un")=un
rs_s("xc")=xc
rs_s("cq")=cq
rs_s("nn")=nn
rs_s("sg")=sg
rs_s("tw")=tw
rs_s("sj")=sj
rs_s("ns")=ns
rs_s("jl")=jl
rs_s("hlj")=hlj
rs_s("sh")=sh
rs_s("zs")=zs
rs_s("zz")=zz
rs_s("nf")=nf
rs_s("fz")=fz
rs_s("om")=om
rs_s("hns")=hns
rs_s("hb")=hb
rs_s("ln")=ln
rs_s("sx")=sx
rs_s("nmg")=nmg
rs_s("tj")=tj
rs_s("hbs")=hbs
rs_s("hn")=hn
rs_s("sd")=sd
rs_s("zx")=zx
rs_s("gx")=gx
rs_s("gd")=gd
rs_s.update
%>
<%
response.Write "<script language=javascript>alert('执行更新成功！');location.href='fhjl.asp'</script>"
response.end
%>