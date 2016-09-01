<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title><s:text name='reg1.jsp.reg1.jsp.624662580'/></title>
	<link rel="stylesheet" href="/css/common.css" />
	<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=650');
    }
//-->
</SCRIPT>
<script language="JavaScript"> 
 function checkdate()  {  
  if (Form.pdid.value=="") {      alert("<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.1195559714'/>!");      return false;    } 
  if (Form.pdpa.value=="") {      alert("<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.262785093'/>!");      return false;    }  
  if (Form.fwid.value=="") {      alert("<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-1848555661'/>!");    return false;    } 
  if (Form.sfz.value==0) {      alert("<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-185839128'/>!");      return false;    }
  return true;  }  
</script>
</head>
<body>
	<div class="mainbox mw1024">
		
		<!-- <s:text name='viewgrxx-edit-jc.jsp.grxx-edit-jc.jsp.745012'/> -->
		<%@ include file="/view/head.jsp" %>

		<div class="center z-cb">
			<div class="leftbox z-l">
				
				<!-- <s:text name='reg1.jsp.reg1.jsp.624662580'/>用户信息 -->
				<%@ include file="/view/user.jsp" %>

				<%@ include file="/view/jflc.jsp" %>
			</div>
			<div class="z-l">
				<!-- <div class="content-box1">
				
					<div class="content-title">
						<span><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.852724812'/></span>
					</div>
					
					<div class="content-form new2-top">
						<form class="form form1 e6b" method="POST" align="center" action="activedGoldCard" name="Form" onSubmit="return checkdate()"> 
						<input type="hidden" maxlength=10 name="postcode" size="6" value="123456">
							<p class="f-tk c-g">您的<s:text name='reg.jsp.reg.jsp.29623262'/>是 <span class="c-r">${userName}</span></p>
							<p><label><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.871112722'/>：</label><input type="text"maxlength="20" name="pdid" size="18" ><input type="hidden" name="jbk" size="10" value="${userName}" readonly></p>
							<p><label><s:text name='viewgrxx-shopmanager.jsp.grxx-shopmanager.jsp.927803061'/>：</label><input type="text" maxlength=15 name="pdpa" size="18"></p>
							<p><label><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.1165978851'/>：</label><input type="text" maxlength=15 name="fwid" size="18"></p>
							<p><label><s:text name='reg.jsp.reg.jsp.-692292151'/>：</label>
								<select>
											<option selected value="0">==<s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-261926398'/>==</option>
											<option value="0"><s:text name='reg.jsp.reg.jsp.19893584'/>，我不要参与，我要把卡丢了...</option>
											<option value="1"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.499821381'/>！</option>
								</select>
								<a href="javascript:openwindow('/sfz.html')" class="c-g xy-sm">查看消费者协议</a>
							</p>
							<p><label></label><button class="but1" type=submit value="确 定" name=submit2>确  定</button></p>
						</form>
					</div>
				</div> -->
				<div class="content-box2 new2-bottom mt10">
					<div class="content-title">
						<span><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.852652361'/></span>
					</div>
					<div class="content-table">
						<table>
							<tr>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.871112722'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.1136416618'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.918196047'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-2035480698'/></th>
								<th><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.820271'/></th>
							</tr>
							 <s:iterator var="data" value="dataList">
							<tr>
								<td>${data.pdid}</td>
								<td>${data.bf2}0</td>
								<td>${data.gmdate}</td>
								<td><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.1402093537'/>。</td>
								<td> 
								<c:if test="${data.gpa>1}"><a href="glfhk?id=${data.pdid}" style="text-decoration: none"><s:text name='viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.544376205'/></a></c:if>
                                <c:if test="${data.gpa<=1}"><a href="glfhk?id=${data.pdid}" ><s:text name="viewjflc-activie-goldcard.jsp.jflc-activie-goldcard.jsp.-1380739490"></s:text></a></c:if>
                                </td>
							</tr>
							</s:iterator>
						</table>
						<div class="page">
							<p><aldtags:pageTag/></p>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
