<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<html>
<title>显示用户信息</title>
<head>
		<style>
			#tip{
				width:200px;
				height:120px;
				background:#ccc;
				border:1px solid black;
				position:absolute;
				display:none;
			}
.box{position:absolute;width:100%;left:50%;height:auto;z-index:100;background-color:#fff;border:1px #ddd solid;padding:30px;}
.box h2{height:25px;font-size:14px;background-color:#aaa;position:relative;padding-left:10px;line-height:25px;color:#fff;}
.box h2 a{position:absolute;right:5px;font-size:12px;color:#fff;}
.box .list{padding:10px;}
.box .list li{height:24px;line-height:24px;}
.box .list li span{margin:0 5px 0 0;font-family:"宋体";font-size:12px;font-weight:400;color:#ddd;}
.showbtn {font:bold 24px '微软雅黑';}
#bg{background-color:#666;position:absolute;z-index:99;left:0;top:0;display:none;width:100%;height:100%;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
</style>
<script type="text/javascript" src="/scripts/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<script src="/scripts/go.js"></script>
</head>
<body bgcolor="#DDECFE" topmargin="5" leftmargin="5" onload="init()">
<div align="center">
  <table border="0" cellspacing="1" width="100%" height="184">
    <tr align="center">
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
        <p align="center"><font color="#000000" style="font-size: 14px"><strong>用户业绩信息详情</strong></font>
      <form name="form1" method="POST" action="/admin/userper?status=1">
用户名:<input type="text" name="user" size="20" value="${user}">
开始日期：<input type="text" name="startTime" id="startTime" size="20" value="${startTime}">
结束日期：<input type="text" name="endTime" id="endTime" size="20" value="${endTime}">
          <input type="submit" name="Submit" value="搜索"></form>
      </td>
  </tr> 
  
  <tr align="center">
      <td width="100%" height="26" background="/meme/images/admin_bg_1.gif"> 
           <p class="showbtn"><a href='userperlist'>查看2015年度获奖用户名单</a></p>
      </td>
  </tr> 
  </table>
  <c:if test="${not empty bean}">
            <table border="1" cellspacing="0" width="100%" style="border-collapse: collapse" cellpadding="0" height="62">
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>用户名</strong></font></td>
                <td>${user}</td>
                <td></td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>个人总业绩</strong></font></td>
                <td bgcolor='<c:if test="${bean.sigleAllPerformance*500>=500000}">green</c:if><c:if test="${bean.sigleAllPerformance*500<500000}">red</c:if>' >${bean.sigleAllPerformance}单=${bean.sigleAllPerformance*500}元</td>
                <td>(用户个人总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】个人总业绩</strong></font></td>
                <td>${bean.sigleTimeAllPerformance}单=${bean.sigleTimeAllPerformance*500}元</td>
                <td>(【${startTime}至${endTime}】时间段的个人总业绩)</td>
              </tr>
             <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>所有同名账号个人总业绩之和</strong></font></td>
                <td>${bean.myAllSigleAllPerformance}单=${bean.myAllSigleAllPerformance*500}元</td>
                <td>(用户所有同名账号个人总业绩之和)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】所有同名账号个人总业绩之和</strong></font></td>
                <td>${bean.myAllSignleTimeAllPerformance}单=${bean.myAllSignleTimeAllPerformance*500}元</td>
                <td>(【${startTime}至${endTime}】所有同名账号个人总业绩之和)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>5层内左总</strong></font></td>
                <td>${bean.fiveLeftPerformance}单=${bean.fiveLeftPerformance*500}元</td>
                <td>(前5层左边总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>5层内右总</strong></font></td>
                <td>${bean.fiveRightPerformance}单=${bean.fiveRightPerformance*500}元</td>
                <td>(前5层右边总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】5层内左总</strong></font></td>
                <td>${bean.fiveLeftTimePerformance}单=${bean.fiveLeftTimePerformance*500}元</td>
                <td>(【${startTime}至${endTime}】前5层左边总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】5层内右总</strong></font></td>
                <td>${bean.fiveRightTimePerformance}单=${bean.fiveRightTimePerformance*500}元</td>
                <td>(【${startTime}至${endTime}】前5层右边总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>总业绩</strong></font></td>
                <td>${bean.sgxt.zaq+bean.sgxt.zbq}单=${(bean.sgxt.zaq+bean.sgxt.zbq)*500}元</td>
                <td>(总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>总业绩-左区</strong></font></td>
                <td>${bean.sgxt.zaq}单=${bean.sgxt.zaq*500}元</td>
                <td>(左区总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>总业绩-右区</strong></font></td>
                <td>${bean.sgxt.zbq}单=${bean.sgxt.zbq*500}元</td>
                <td>(右区总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】总业绩</strong></font></td>
                <td  bgcolor='<c:if test="${bean.allTimePerformance*500>=620000}">green</c:if><c:if test="${bean.allTimePerformance*500<620000}">red</c:if>' >${bean.allTimePerformance}单=${bean.allTimePerformance*500}元</td>
                <td>(此处数据为${user},在【${startTime}至${endTime}】的总业绩)</td>
              </tr>
               <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】总业绩左区</strong></font></td>
                <td >${bean.allTimeLeftPerformance}单=${bean.allTimeLeftPerformance*500}元</td>
                <td>(此处数据为${user},在【${startTime}至${endTime}】的左区总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>【${startTime}至${endTime}】总业绩右区</strong></font></td>
                <td >${bean.allTimeRightPerformance}单=${bean.allTimeRightPerformance*500}元</td>
                <td>(此处数据为${user},在【${startTime}至${endTime}】的右区总业绩)</td>
              </tr>
              <tr bgcolor="#7bb5de"> 
                <td width="350" align="center" height="23" bgcolor="#D9E6FF"><font face="宋体"><strong>是否5层全满</strong></font></td>
                <td bgcolor='<c:if test="${bean.isFiveFull==true}">green</c:if><c:if test="${bean.isFiveFull==false}">red</c:if>'><c:if test="${bean.isFiveFull==true}">是</c:if><c:if test="${bean.isFiveFull==false}">否</c:if></td>
                <td></td>
              </tr>
            </table>
</c:if>
</div> 
<div>
<c:if test="${not empty bean}">
<div id="myup" style="background-color: white; border: solid 1px black; width: 100%; height: 50px">
该用户的上级为:<a href="userper?user=${bean.up.username}&status=1">${bean.up.username}(${bean.up.sjb})</a>
</div>
</c:if>
</div>
<div id="sample">
  <div id="myDiagram" style="background-color: white; border: solid 1px black; width: 100%; height: 600px"></div>
</div>

<center>
<div id="bg"></div>
<div class="box" style="display:none">
    <h2>正在执行查询，请不要关闭界面！需要时间1-2分钟左右！</h2>
</div>
</body> 
</html>
 <script type="text/javascript">
		$('#startTime').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
		$('#endTime').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>
<script id="code">
  function init() {
    var $ = go.GraphObject.make; 
    myDiagram =
      $(go.Diagram, "myDiagram",  
        {
          allowCopy: false,
          layout:  // create a TreeLayout for the family tree
            $(go.TreeLayout,
              { angle: 90, nodeSpacing: 5 })
        });
    var bluegrad = $(go.Brush, "Linear", { 0: "rgb(60, 204, 254)", 1: "rgb(70, 172, 254)" });
    var pinkgrad = $(go.Brush, "Linear", { 0: "rgb(255, 192, 203)", 1: "rgb(255, 142, 203)" });
    // Set up a Part as a legend, and place it directly on the diagram
    myDiagram.add(
      $(go.Part, "Table",
        { position: new go.Point(10, 10), selectable: false }
      ));
    // get tooltip text from the object's data
    function tooltipTextConverter(person) {
      var str = "";
      str += "Born: " + person.birthYear;
      if (person.deathYear !== undefined) str += "\nDied: " + person.deathYear;
      if (person.reign !== undefined) str += "\nReign: " + person.reign;
      return str;
    }
    // define tooltips for nodes
    var tooltiptemplate =
      $(go.Adornment, "Auto",
        $(go.Shape, "Rectangle",
          { fill: "whitesmoke", stroke: "black" }),
        $(go.TextBlock,
          { font: "bold 8pt Helvetica, bold Arial, sans-serif",
            wrap: go.TextBlock.WrapFit,
            margin: 5 },
          new go.Binding("text", "", tooltipTextConverter))
      );
    // define Converters to be used for Bindings
    function genderBrushConverter(gender) {
      if (gender === "M") return bluegrad;
      if (gender === "F") return pinkgrad;
      return "orange";
    }
    // replace the default Node template in the nodeTemplateMap
    myDiagram.nodeTemplate =
      $(go.Node, "Auto",
        { deletable: false, toolTip: tooltiptemplate },
        new go.Binding("text", "name"),
        $(go.Shape, "Rectangle",
          { fill: "orange",
            stroke: "black",
            stretch: go.GraphObject.Fill,
            alignment: go.Spot.Center },
          new go.Binding("fill", "gender", genderBrushConverter)),
        $(go.Panel, "Vertical",
          $(go.TextBlock,
            { font: "bold 8pt Helvetica, bold Arial, sans-serif",
              alignment: go.Spot.Center,
              margin: 6 },
            new go.Binding("text", "name")),
          $(go.TextBlock,
            new go.Binding("text", "kanjiName"))
        )
      );
    // define the Link template
    myDiagram.linkTemplate =
      $(go.Link,  // the whole link panel
        { routing: go.Link.Orthogonal, corner: 5, selectable: false },
        $(go.Shape));  // the default black link shape
    // here's the family data
     ${bean.performance.htmlScript}
  }
</script>
<script type="text/javascript">
$(function () {
    $(".showbtn").click(function () {
        $("#bg").css({
            display: "block", height: $(document).height()
        });
        var $box = $('.box');
        $box.css({
            //设置弹出层距离左边的位置
            left: ($("body").width() - $box.width()) / 2 - 20 + "px",
            //设置弹出层距离上面的位置
            top: ($(window).height() - $box.height()) / 2 + $(window).scrollTop() + "px",
            display: "block"
        });
    });
    //点击关闭按钮的时候，遮罩层关闭
    //$(".close").click(function () {
    //    $("#bg,.box").css("display", "none");
    //});
});
</script>