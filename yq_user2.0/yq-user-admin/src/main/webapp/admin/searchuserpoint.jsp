<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<table width="100%" border="1" height="117" style="border-collapse: collapse" bordercolor="#006699">
    <tr> 
      <td height="25" align="center" background="images/admin_bg_1.gif"><b>
		<font size="2">会员搜索</font></b></td>
    </tr>
    <tr>
      <td height="86" align="center" bgcolor="#C3DAF9">
        <form name="form1" method="POST" action="/admin/searchuserpoint?status=1">
          <span style="font-size: 9pt">&nbsp;<input type="text" name="user" size="20">
          <input type="submit" name="Submit" value="搜索">输入该会员</span></form>
      </td>
    </tr>
  </table>
</div> 
</body> 
</html>