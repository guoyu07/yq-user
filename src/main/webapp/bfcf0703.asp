<!--#include file=gcgl/checkadmin.asp-->
<head>
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%
yy=year(date)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
yytime01=yy&mm&dd&xiaoshi&fenzhong
zgba = Server.MapPath("zgba/") 'zgba.exe rar.exe Ŀ¼����  zgba.exe��ԴWIN7ϵͳ,��ʹ������ϵͳ����WINDOWS/SYSTEM32�µ�zgba.exe�ļ��滻��zgba/zgba.exe�ļ�
path = Server.MapPath("cf9dl/") 'ѹ����Ŀ¼
rar = Server.MapPath("001") 'ѹ���ļ�����Ŀ¼
Set Shell = Server.CreateObject("WScript.Shell")
dos = zgba&"\zgba.exe /c "&zgba&"\rar.exe a -ep1 -r -t -y -o+ -pzgyc168 "&rar&"\cf9dl_"&yytime01&".tar "&path
Shell.Run dos,1, True
If Err.Number<>0 Then
	Response.Write (Err.Description)
	Response.End()
End If
%>
<%
yy=year(date)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
yytime02=yy&mm&dd&xiaoshi&fenzhong
zgba = Server.MapPath("zgba/") 'zgba.exe rar.exe Ŀ¼����  zgba.exe��ԴWIN7ϵͳ,��ʹ������ϵͳ����WINDOWS/SYSTEM32�µ�zgba.exe�ļ��滻��zgba/zgba.exe�ļ�
path = Server.MapPath("cftogo/") 'ѹ����Ŀ¼
rar = Server.MapPath("001") 'ѹ���ļ�����Ŀ¼
Set Shell = Server.CreateObject("WScript.Shell")
dos = zgba&"\zgba.exe /c "&zgba&"\rar.exe a -ep1 -r -t -y -o+ -pzgyc168 "&rar&"\cftog_"&yytime02&".tar "&path
Shell.Run dos,1, True
If Err.Number<>0 Then
	Response.Write (Err.Description)
	Response.End()
End If
%>
<p align="center">��</p>
<p align="center">��</p>
<p align="center"><b><font size="6"><a href="001/cf9dl_<%=yytime01%>.tar" style="text-decoration: none">���ر���ѹ����(1)</a></font></b></p>
<p align="center"><b><font size="6"><a href="001/cftog_<%=yytime02%>.tar" style="text-decoration: none">���ر���ѹ����(2)</a></font></b></p>