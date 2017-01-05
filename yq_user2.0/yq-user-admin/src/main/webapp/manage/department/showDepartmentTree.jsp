<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>科宇科技</title>
<%@ include file="/manage/commons/meta.jsp"%>
<link href="${ctx}/styles/css.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="${ctx}/scripts/zTree/zTreeStyle/zTreeStyle.css" type="text/css"/>
<!--	<script type="text/javascript" src="${ctx}/script/zTree/jquery-1.4.4.min.js"></script>-->
	<script type="text/javascript" src="${ctx}/scripts/zTree/jquery.ztree.core-3.0.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/zTree/jquery.ztree.excheck-3.0.js"></script>
   <script type="text/javascript" src="${ctx}/scripts/loadTree/departmentTree.js"></script>
<script type="text/javascript">

$(document).ready(function(){


	loadDepartmentTree();//加载tree
});



function select_terminal(){
	
	var resourceId=$("#resourceId").val();
	
	var eleName = window.parent.document.getElementById("${param['eleName']}");
	
	var eleId = window.parent.document.getElementById("${param['eleId']}");
	
	var parEle="";
	//获取选中的值
	var zTree = $.fn.zTree.getZTreeObj("departmentTree");
	var treeNode = zTree.getSelectedNodes();
	
	if(treeNode.length>0){
	//alert(treeNode[0].id);
	//alert(treeNode[0].name);
	
	eleName.value=treeNode[0].name;
	eleId.value=treeNode[0].id;

	parent.$.colorbox.close();
	}else{
		alert($("#SelectArea").val());
	}
	
	

    
}

function subString(str){
	return str.substr(0,str.lastIndexOf(','))
}

</script>



<!--[if lte IE 6]>

<link href="css/ie_hack.css" rel="stylesheet" type="text/css" />

<![endif]-->



</head>



<body >
<input type="hidden" name="SelectArea" id="SelectArea" value="请选择部门" />
<input type="hidden"  name="resourceId" id="resourceId" value="${param['id']}"/>
<div class="table_div">
  <table border="0" cellspacing="0" cellpadding="0" width="" style=" width:100%; ">
    <tr>
      <td valign="top">
        <div class="table_right">
          <div class="moudle_div">
             <div class="sidebar_title">
              <div class="sidebar_title_border">请选择部门</div>
            </div>
            <div class="div_content">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="220" valign="top" style="border:#dedee0 1px solid;"><div class="modlue_menu_div"><ul id="departmentTree" class="ztree"></ul></div></td>
                </tr>
              </table>
              <div style="clear:both;"></div>
            </div>
          </div>
        </div>
      </td>
    </tr>
    <tr>
    	<td align="right">
    		<input type="button" value="确定" onclick="select_terminal();"/>
    	</td>
    </tr>
  </table>
</div>
</body>
  
</html>

