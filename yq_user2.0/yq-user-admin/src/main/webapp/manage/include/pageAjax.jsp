<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@page import="com.wyd.empire.upload.domain.UploadHistory"%> --%>
<%@ include file="/manage/commons/taglibs.jsp"%>
<%@ page import="com.yq.admin.manage.action.PageResponse"%>
<%
    PageResponse rpage = (PageResponse) request.getAttribute("page");

    String pageInfoNum_str =request.getParameter("pageInfoNum");
    System.out.println("pageInfoNum_str="+pageInfoNum_str);
    pageInfoNum_str = pageInfoNum_str == null ? "1" : pageInfoNum_str;
    Integer pageInfoNum = Integer.parseInt(pageInfoNum_str);
    int totalPageCount = rpage.getTotalPageCount();
    int currentPageNo = rpage.getCurrentPageNo();
    int pageInfoSize =5;//页码个数
    int pageInfoMaxNum = pageInfoSize * pageInfoNum;//最大页码
    int pageInfoStartNum = pageInfoMaxNum + 1 - pageInfoSize;//开始页码
    boolean noNextPageInfo = pageInfoMaxNum > totalPageCount; //是否有下一组页码
    System.out.println("pageInfoStartNum="+pageInfoStartNum);
    System.out.println("totalPageCount="+totalPageCount);
    System.out.println("currentPageNo="+currentPageNo);
    System.out.println("pageInfoMaxNum="+pageInfoMaxNum);
    System.out.println("pageInfoStartNum="+pageInfoStartNum);
    pageInfoMaxNum = noNextPageInfo ? totalPageCount : pageInfoMaxNum;//页面最大的页数不能大于总页数
    System.out.println("pageInfoSize="+pageInfoSize);
%>
<script type="text/javascript">
function pageGo(page){
	$("#pageNumber").val(page);
	var pageInfoNum=parseInt($("#pageInfoNum").val());
	var urls=$("#urls").val();
	   alert(urls);
	   alert(page);
	   alert(pageInfoNum);
		//默认首次加载
		$.ajax({
			  url: urls+"&pageNumber="+page+"&pageInfoNum="+pageInfoNum,
			  cache: false,
			  success: function(html){
			    $("#biaoge").html(html);
			  }
		});
	//window.document.forms[0].submit();
}
//上一组页码
function nextPageInfo(page){
 var pageInfoNum=parseInt($("#pageInfoNum").val());
 pageInfoNum++;
 $("#pageInfoNum").val(pageInfoNum);

 
 var urls=$("#urls").val();
 
 
	//默认首次加载
	$.ajax({
		  url: urls+"&pageNumber="+page+"&pageInfoNum="+pageInfoNum,
		  cache: false,
		  success: function(html){
			  alert("html="+html);
		    $("#biaoge").html(html);
		  }
	});
 
}
//下一组页码
function prePageInfo(page){
 var pageInfoNum=parseInt($("#pageInfoNum").val());
 pageInfoNum--;
 $("#pageInfoNum").val(pageInfoNum);
 var urls=$("#urls").val();
	//默认首次加载
	$.ajax({
		  url: urls+"&pageNumber="+page+"&pageInfoNum="+pageInfoNum,
		  cache: false,
		  success: function(html){
		    $("#biaoge").html(html);
		  }
	});
 
}
</script>
<input type="hidden" name="pageTotalPageCount" id="pageTotalPageCount"
	value="${page.totalPageCount}" />
<input type="hidden" value="${page.pageSize}" name="pageSize"
	id="pageSize" />
<input type="hidden" value="${page.currentPageNo}" name="pageNumber"
	id="pageNumber" />
<input type="hidden" value="1" name="pageInfoNum"
	id="pageInfoNum" />
 
<div id="tnt_pagination">
	<%
	    if (pageInfoNum > 1) {
	%>
	<a href="javascript:prePageInfo(<%=pageInfoStartNum - 1%>)">前<%=pageInfoSize%>页
	</a>
	<%
	    } else {
	    	 
	%>
	<span class="disabled_tnt_pagination">前<%=pageInfoSize%>页</span>
	<%
	    }
	%>
	<%
	    for (int i = pageInfoStartNum; i <= pageInfoMaxNum; i++) {
	        if (currentPageNo == i) {
	%>
	<span class="active_tnt_link"><%=i%></span>
	<%
	    } else {
	%><a href="javascript:pageGo(<%=i%>)"><%=i%></a>
	<%
	    }
	    }
	%>
	<%
	    if (noNextPageInfo) {
	%>
		<span class="disabled_tnt_pagination">后<%=pageInfoSize%>页</span>
	<%
	    } else {
	%>
	<a href="javascript:nextPageInfo(<%=pageInfoMaxNum + 1%>)">后<%=pageInfoSize%>页</a>
	<%
	    }
	%>

</div>

