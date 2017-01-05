<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>科宇科技</title>

<%@ include file="/manage/commons/meta.jsp"%>
<script language="javascript"  src="${ctx}/scripts/script.js"></script>

<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />

<link href="${ctx}/scripts/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
<script src="${ctx}/scripts/validate/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validate/messages_cn.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	//选中菜单
	$("#system").attr("class","nav hover");
	//为newForm注册validate函数
	$("#newForm").validate({
		});
	});
</script>
</head>
<body>

<!-- 头部菜单 -->
<jsp:include flush="false" page="/manage/admin_menu.jsp"/>

<div style="height:10px;"> </div>

<div class="table_div">
 <form action="/department/saveOrUpdateDepartment.action" method="post" name="newForm" id="newForm">
 <input type="hidden" id="id"  name="id" value="${info.id}"/>
  <input type="hidden" name="treeId" id="treeId" value="${treeId}"/>
  <table border="0" cellspacing="0" cellpadding="0" width="" style=" width:100%; ">

    <tr>

      <td width="188" valign="top">
       <!-- 嵌入右侧菜单页面 -->
                      	<%@ include file="/manage/include/adminLeft.jsp"%>
      </td>

      <td valign="top"><!---->

        <div class="table_right">

          <div class="moudle_div">

            <div class="sidebar_title">

              <div class="sidebar_title_border">
											现在的位置：部门管理> 新建部门
										</div>

            </div>

            <div class="div_content border_css" style="border:#CCC solid 1px; ">

              <div class="form_body">

                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_item">
                 <tr >
                    <td width="26%" height="30" align="right"  class="left_txt2">操作模块：</td>
                    <td width="26%" height="30" >
                    	<input name="deptName"  id="deptName"  type="text"  value="${info.deptName}"   class="required"/>
                    </td>
                    <td width="26%"  align="left" colspan="2">
                    </td>
                    <td height="30" >
                    </td>
                  </tr>
                  <tr >
                    <td height="30" align="right" class="left_txt2">备注：</td>
                    <td height="30" colspan="3"  >
                    <textarea name="deptDesc" rows="5"  class="input1" id="deptDesc">${info.deptDesc}</textarea>
                    </td>
                  </tr>
                      <tr>
                        <td height="30" align="right" class="left_txt2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td height="30">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td height="30">&nbsp;</td>
                      </tr>
                    <tr>
                    <td height="30" align="right"  class="left_txt2">&nbsp;</td>
                    <td height="30"  colspan="2"><span class="left_txt2"><a href="#">
                      <input name="input" type="submit"  class="btn_w102_blue" value="保存"/>&nbsp;&nbsp;</a>&nbsp;&nbsp;
                      <input name="input" type="button"  class="btn_w102_blue" value="返回" onclick="history.go(-1);"/>
                    </span></td>
                  
                    <td width="5" >&nbsp;</td>
                    <td height="30" >&nbsp;</td>
                  </tr>
                      <tr>
                        <td height="30" align="right" class="left_txt2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td height="30">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td height="30">&nbsp;</td>
                      </tr>
                  <tr>
                    <td height="17" colspan="6" align="right" >&nbsp;</td>
                  </tr>
                </table>
              </div>
              <div style="clear:both;"></div>
            </div>
          </div>
        </div>
        <!----></td>
    </tr>
  </table>
</form>
</div>
<div class="bottom" id="bottom">
  <jsp:include flush="false" page="/manage/down.jsp"/>
</div>
</body>
</html>

