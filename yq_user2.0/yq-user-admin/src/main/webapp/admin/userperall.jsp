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
<div id="sample">
  <div id="myDiagram" style="background-color: white; border: solid 1px black; width: 100%; height: 100%"></div>
</div>

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
     ${bean.htmlScript}
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