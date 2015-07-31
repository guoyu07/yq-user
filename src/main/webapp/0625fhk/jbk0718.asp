<%

Class Tarball
Public TarFilename   ' Resultant tarball filename

Public UserID    ' UNIX user ID
Public UserName    ' UNIX user name
Public GroupID    ' UNIX group ID
Public GroupName   ' UNIX group name

Public Permissions   ' UNIX permissions
Public BlockSize   ' Block byte size for the tarball (default=512)
Public IgnorePaths   ' Ignore any supplied paths for the tarball output
Public BasePath    ' Insert a base path with each file
Public Path
private Co,Temp,T,x,i,fsoBrowse,theFolder,TheSubFolders,FilePath,s,Stream

' Storage for file information
Private objFiles,TmpFileName
Private objMemoryFiles

' File list management subs, very basic stuff
Public Sub AddFile(sFilename)
  objFiles.Add sFilename,sFilename
End Sub

Public Sub RemoveFile(sFilename)
  objFiles.Remove sFilename
End Sub

Public Sub AddMemoryFile(sFilename,sContents)
  objMemoryFiles.Add sFilename,sContents
End Sub

Public Sub RemoveMemoryFile(sFilename)
  objMemoryFiles.Remove sFilename
End Sub

Public Sub WriteTar()
  Dim objInStream, lTemp, aFiles
  Set objInStream = Server.CreateObject("ADODB.Stream") ' The input stream for data
  Stream.Type = 2
  Stream.Charset = "x-ansi" ' Good old extended ASCII
  Stream.Open

  objInStream.Type = 2
  objInStream.Charset = "x-ansi"

  aFiles = objFiles.Items
  For lTemp = 0 to UBound(aFiles)
    objInStream.Open
    objInStream.LoadFromFile aFiles(lTemp)
    objInStream.Position = 0
    TmpFileName =replace(aFiles(lTemp),Server.Mappath(Path)&"\","")
    ExportFile TmpFileName,Stream,objInStream
    objInStream.Close
  Next
  aFiles = objMemoryFiles.Keys
  For lTemp = 0 to UBound(aFiles)
    objInStream.Open
    objInStream.WriteText objMemoryFiles.Item(aFiles(lTemp))
    objInStream.Position = 0
    ExportFile aFiles(lTemp),Stream,objInStream
    objInStream.Close
  Next

  Stream.WriteText String(BlockSize,Chr(0))
  Set objInStream = Nothing
End Sub

' Build a header for each file and send the file contents
Private Sub ExportFile(sFilename,objOutStream,objInStream)
  Dim lStart, lSum, lTemp
  lStart = objOutStream.Position ' Record where we are up to
  If IgnorePaths Then
   ' We ignore any paths prefixed to our filenames
   lTemp = InStrRev(sFilename,"\")
   if lTemp <> 0 then
    sFilename = Right(sFilename,Len(sFilename) - lTemp)
   end if
   sFilename = BasePath & sFilename
  End If
  
  ' Build the header, everything is ASCII in octal except for the data
  'objOutStream.charset="gb2312"
  objOutStream.WriteText Left(sFilename & String(100,Chr(0)),100)
  'objOutStream.charset="x-ansi"
  objOutStream.WriteText "100" & Right("000" & Oct(Permissions),3) & " " & Chr(0) 'File mode
  objOutStream.WriteText Right(String(6," ") & CStr(UserID),6) & " " & Chr(0) 'uid
  objOutStream.WriteText Right(String(6," ") & CStr(GroupID),6) & " " & Chr(0) 'gid
  objOutStream.WriteText Right(String(11,"0") & Oct(objInStream.Size),11) & Chr(0) 'size
  objOutStream.WriteText Right(String(11,"0") & Oct(dateDiff("s","1/1/1970 10:00",now())),11) & Chr(0) 'mtime (Number of seconds since 10am on the 1st January 1970 (10am correct?)
  objOutStream.WriteText "        0" & String(100,Chr(0)) 'chksum, type flag and link name, write out all blanks so that the actual checksum will get calculated correctly
  objOutStream.WriteText "ustar  "  & Chr(0) 'magic and version
  objOutStream.WriteText Left(UserName & String(32,Chr(0)),32) 'uname
  objOutStream.WriteText Left(GroupName & String(32,Chr(0)),32) 'gname
  objOutStream.WriteText "         40 " & String(4,Chr(0)) 'devmajor, devminor
  objOutStream.WriteText String(167,Chr(0)) 'prefix and leader
  objInStream.CopyTo objOutStream ' Send the data to the stream
  
  if (objInStream.Size Mod BlockSize) > 0 then
   objOutStream.WriteText String(BlockSize - (objInStream.Size Mod BlockSize),Chr(0)) 'Padding to the nearest block byte boundary
  end if
  
  ' Calculate the checksum for the header
  lSum = 0  
  objOutStream.Position = lStart
  
  For lTemp = 1 To BlockSize
   lSum = lSum + (Asc(objOutStream.ReadText(1)) And &HFF&)
  Next
  
  ' Insert it
  objOutStream.Position = lStart + 148
  objOutStream.WriteText Right(String(7,"0") & Oct(lSum),7) & Chr(0)
  
  ' Move to the end of the stream
  objOutStream.Position = objOutStream.Size
End Sub

private function gb2312Toansi(byval str)
	dim tempStream:set tempStream=Server.CreateObject("ADODB.Stream")
	tempstream.Type = 1
	tempstream.Charset = "gb2312"
	tempstream.open
	tempstream.writetext str
	tempstream.position=0
    tempstream.Charset = "x-ansi"
    gb2312Toansi=tempstream.readtext()
    tempstream.close
    set tempstream=nothing
end function

Private Sub Class_Initialize()
  Set objFiles = Server.CreateObject("Scripting.Dictionary")
  Set objMemoryFiles = Server.CreateObject("Scripting.Dictionary")
  Set Stream = Server.CreateObject("ADODB.Stream") ' The main stream
  BlockSize = 512
  Permissions = 438 ' UNIX 666
  UserID = 0
  UserName = "root"
  GroupID = 0
  GroupName = "root"
  IgnorePaths = False
  BasePath = ""
  TarFilename = "new.tar"
  Co=0
End Sub

Private Sub Class_Terminate()
  Set objMemoryFiles = Nothing
  Set objFiles = Nothing
  set stream=nothing
End Sub
public function pack(byval saveType) 
   set fsoBrowse=CreateObject("Scripting.FileSystemObject")
   Set theFolder=fsoBrowse.GetFolder(Server.Mappath(path))
   Set theSubFolders=theFolder.SubFolders
   GetFileList theFolder,""
  response.write temp
   If Co<1 Then
      Response.Write "暂时没有可更新的文件下载"
   Else
      Temp=Left(Temp,Len(Temp)-1)
      FilePath=Split(Temp,"|")
      For s=0 To Ubound(FilePath)
        AddFile Server.Mappath(path & "/" & FilePath(s))
      Next
   If Response.IsClientConnected Then
        WriteTar 
        Stream.Position = 0
        Stream.Type = 1
        if saveType=0 then
			Response.Clear
			Response.ContentType = "application/octet-stream"
			Response.AddHeader "content-disposition", "attachment; filename=" & TarFilename
			response.binarywrite stream.read()
        else
			Stream.savetofile Server.Mappath(Path) & "\" & TarFilename,2
        end if
		Stream.Close
   End If
   End If
   Set fsoBrowse= Nothing
   Set theFolder = Nothing
   Set theSubFolders = Nothing
   
end function 
Sub GetFileList(Folderobject,path)
	Dim y,m
	For Each y in Folderobject.Files
		If Path <>"" Then
			Temp= Temp &  path & y.Name&"|"
		Else
			Temp= Temp & y.Name&"|"
		End If
    	Co=Co+1
	Next
	Dim NewPath
	For Each m In Folderobject.SubFolders
	If path="" Then
			NewPath=M.name &"/"
	Else
			NewPath=path & M.name &"/"
	End If
	GetFileList m,NewPath
	Next
End Sub
End Class
%>
