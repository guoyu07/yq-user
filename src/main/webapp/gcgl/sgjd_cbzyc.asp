<!--#include file="../mq0618222.asp"-->
<%
Dim StrSQL,rsTest
Set rsTest = server.CreateObject("ADODB.Recordset")
StrSQL = "SELECT * FROM sgxt where zaq>0 and id>15266 order by id"
rsTest.Open StrSQL,conn7,2,3
While Not rsTest.EOF
myup=rsTest("username")
sql_z1="select sum(sjb) as z1 from zuo_mingxi where tjuser='"&myup&"' and count=1" 
Set rs_z1 = conn7.execute(sql_z1)
z1ab=rs_z1("z1")
rs_z1.close()
set rs_z1=Nothing
sql_y1="select sum(sjb) as y1 from you_mingxi where tjuser='"&myup&"' and count=1" 
Set rs_y1 = conn7.execute(sql_y1)
y1ab=rs_y1("y1")
rs_y1.close()
set rs_y1=Nothing
sql_z2="select sum(sjb) as z2 from zuo_mingxi where tjuser='"&myup&"' and count=2" 
Set rs_z2 = conn7.execute(sql_z2)
z2ab=rs_z2("z2")
rs_z2.close()
set rs_z2=Nothing
sql_y2="select sum(sjb) as y2 from you_mingxi where tjuser='"&myup&"' and count=2" 
Set rs_y2 = conn7.execute(sql_y2)
y2ab=rs_y2("y2")
rs_y2.close()
set rs_y2=Nothing
sql_z3="select sum(sjb) as z3 from zuo_mingxi where tjuser='"&myup&"' and count=3" 
Set rs_z3 = conn7.execute(sql_z3)
z3ab=rs_z3("z3")
rs_z3.close()
set rs_z3=Nothing
sql_y3="select sum(sjb) as y3 from you_mingxi where tjuser='"&myup&"' and count=3" 
Set rs_y3 = conn7.execute(sql_y3)
y3ab=rs_y3("y3")
rs_y3.close()
set rs_y3=Nothing
sql_z4="select sum(sjb) as z4 from zuo_mingxi where tjuser='"&myup&"' and count=4" 
Set rs_z4 = conn7.execute(sql_z4)
z4ab=rs_z4("z4")
rs_z4.close()
set rs_z4=Nothing
sql_y4="select sum(sjb) as y4 from you_mingxi where tjuser='"&myup&"' and count=4" 
Set rs_y4 = conn7.execute(sql_y4)
y4ab=rs_y4("y4")
rs_y4.close()
set rs_y4=Nothing
sql_z5="select sum(sjb) as z5 from zuo_mingxi where tjuser='"&myup&"' and count=5" 
Set rs_z5 = conn7.execute(sql_z5)
z5ab=rs_z5("z5")
rs_z5.close()
set rs_z5=Nothing
sql_y5="select sum(sjb) as y5 from you_mingxi where tjuser='"&myup&"' and count=5" 
Set rs_y5 = conn7.execute(sql_y5)
y5ab=rs_y5("y5")
rs_y5.close()
set rs_y5=Nothing
sql_z6="select sum(sjb) as z6 from zuo_mingxi where tjuser='"&myup&"' and count=6" 
Set rs_z6 = conn7.execute(sql_z6)
z6ab=rs_z6("z6")
rs_z6.close()
set rs_z6=Nothing
sql_y6="select sum(sjb) as y6 from you_mingxi where tjuser='"&myup&"' and count=6" 
Set rs_y6 = conn7.execute(sql_y6)
y6ab=rs_y6("y6")
rs_y6.close()
set rs_y6=Nothing
sql_z7="select sum(sjb) as z7 from zuo_mingxi where tjuser='"&myup&"' and count=7" 
Set rs_z7 = conn7.execute(sql_z7)
z7ab=rs_z7("z7")
rs_z7.close()
set rs_z7=Nothing
sql_y7="select sum(sjb) as y7 from you_mingxi where tjuser='"&myup&"' and count=7" 
Set rs_y7 = conn7.execute(sql_y7)
y7ab=rs_y7("y7")
rs_y7.close()
set rs_y7=Nothing
sql_z8="select sum(sjb) as z8 from zuo_mingxi where tjuser='"&myup&"' and count=8" 
Set rs_z8 = conn7.execute(sql_z8)
z8ab=rs_z8("z8")
rs_z8.close()
set rs_z8=Nothing
sql_y8="select sum(sjb) as y8 from you_mingxi where tjuser='"&myup&"' and count=8" 
Set rs_y8 = conn7.execute(sql_y8)
y8ab=rs_y8("y8")
rs_y8.close()
set rs_y8=Nothing
sql_z9="select sum(sjb) as z9 from zuo_mingxi where tjuser='"&myup&"' and count=9" 
Set rs_z9 = conn7.execute(sql_z9)
z9ab=rs_z9("z9")
rs_z9.close()
set rs_z9=Nothing
sql_y9="select sum(sjb) as y9 from you_mingxi where tjuser='"&myup&"' and count=9" 
Set rs_y9 = conn7.execute(sql_y9)
y9ab=rs_y9("y9")
rs_y9.close()
set rs_y9=Nothing
sql_z10="select sum(sjb) as z10 from zuo_mingxi where tjuser='"&myup&"' and count=10" 
Set rs_z10 = conn7.execute(sql_z10)
z10ab=rs_z10("z10")
rs_z10.close()
set rs_z10=Nothing
sql_y10="select sum(sjb) as y10 from you_mingxi where tjuser='"&myup&"' and count=10" 
Set rs_y10 = conn7.execute(sql_y10)
y10ab=rs_y10("y10")
rs_y10.close()
set rs_y10=Nothing
sql_z11="select sum(sjb) as z11 from zuo_mingxi where tjuser='"&myup&"' and count=11" 
Set rs_z11 = conn7.execute(sql_z11)
z11ab=rs_z11("z11")
rs_z11.close()
set rs_z11=Nothing
sql_y11="select sum(sjb) as y11 from you_mingxi where tjuser='"&myup&"' and count=11" 
Set rs_y11 = conn7.execute(sql_y11)
y11ab=rs_y11("y11")
rs_y11.close()
set rs_y11=Nothing
sql_z12="select sum(sjb) as z12 from zuo_mingxi where tjuser='"&myup&"' and count=12" 
Set rs_z12 = conn7.execute(sql_z12)
z12ab=rs_z12("z12")
rs_z12.close()
set rs_z12=Nothing
sql_y12="select sum(sjb) as y12 from you_mingxi where tjuser='"&myup&"' and count=12" 
Set rs_y12 = conn7.execute(sql_y12)
y12ab=rs_y12("y12")
rs_y12.close()
set rs_y12=Nothing
sql_z13="select sum(sjb) as z13 from zuo_mingxi where tjuser='"&myup&"' and count=13" 
Set rs_z13 = conn7.execute(sql_z13)
z13ab=rs_z13("z13")
rs_z13.close()
set rs_z13=Nothing
sql_y13="select sum(sjb) as y13 from you_mingxi where tjuser='"&myup&"' and count=13" 
Set rs_y13 = conn7.execute(sql_y13)
y13ab=rs_y13("y13")
rs_y13.close()
set rs_y13=Nothing
sql_z14="select sum(sjb) as z14 from zuo_mingxi where tjuser='"&myup&"' and count=14" 
Set rs_z14 = conn7.execute(sql_z14)
z14ab=rs_z14("z14")
rs_z14.close()
set rs_z14=Nothing
sql_y14="select sum(sjb) as y14 from you_mingxi where tjuser='"&myup&"' and count=14" 
Set rs_y14 = conn7.execute(sql_y14)
y14ab=rs_y14("y14")
rs_y14.close()
set rs_y14=Nothing
sql_z15="select sum(sjb) as z15 from zuo_mingxi where tjuser='"&myup&"' and count=15" 
Set rs_z15 = conn7.execute(sql_z15)
z15ab=rs_z15("z15")
rs_z15.close()
set rs_z15=Nothing
sql_y15="select sum(sjb) as y15 from you_mingxi where tjuser='"&myup&"' and count=15" 
Set rs_y15 = conn7.execute(sql_y15)
y15ab=rs_y15("y15")
rs_y15.close()
set rs_y15=Nothing
sql_z16="select sum(sjb) as z16 from zuo_mingxi where tjuser='"&myup&"' and count=16" 
Set rs_z16 = conn7.execute(sql_z16)
z16ab=rs_z16("z16")
rs_z16.close()
set rs_z16=Nothing
sql_y16="select sum(sjb) as y16 from you_mingxi where tjuser='"&myup&"' and count=16" 
Set rs_y16 = conn7.execute(sql_y16)
y16ab=rs_y16("y16")
rs_y16.close()
set rs_y16=Nothing
rsTest("1z")=z1ab
rsTest("1y")=y1ab
rsTest("2z")=z2ab
rsTest("2y")=y2ab
rsTest("3z")=z3ab
rsTest("3y")=y3ab
rsTest("4z")=z4ab
rsTest("4y")=y4ab
rsTest("5z")=z5ab
rsTest("5y")=y5ab
rsTest("6z")=z6ab
rsTest("6y")=y6ab
rsTest("7z")=z7ab
rsTest("7y")=y7ab
rsTest("8z")=z8ab
rsTest("8y")=y8ab
rsTest("9z")=z9ab
rsTest("9y")=y9ab
rsTest("10z")=z10ab
rsTest("10y")=y10ab
rsTest("11z")=z11ab
rsTest("11y")=y11ab
rsTest("12z")=z12ab
rsTest("12y")=y12ab
rsTest("13z")=z13ab
rsTest("13y")=y13ab
rsTest("14z")=z14ab
rsTest("14y")=y14ab
rsTest("15z")=z15ab
rsTest("15y")=y15ab
rsTest("16z")=z16ab
rsTest("16y")=y16ab
rsTest.update
set rs_d1 = Server.CreateObject("ADODB.Recordset")
sql_d1 = "SELECT * FROM cbzyc"
rs_d1.open sql_d1,conn7,2,3
rs_d1.addnew
rs_d1("bid")=rsTest("id")
rs_d1("buser")=rsTest("username")
rs_d1("bdate")=Now()
rs_d1.update
    rsTest.MoveNext
Wend
response.Write "<script language=javascript>alert('全部左右层数据已成功更新。。。！');location.href='searchg0701.asp'</script>"
'response.redirect "searchg0701.asp"
%>