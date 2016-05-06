<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Family Tree (Japanese)</title>
<meta name="description" content="A family tree diagram showing Japanese royalty." />
<meta charset="UTF-8">
<script src="/scripts/go.js"></script>
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
    var nodeDataArray = [
  { key:"123", name:"Osahito", gender:"M", fullTitle:"Emperor Kōmei", kanjiName:"統仁 孝明天皇", posthumousName:"Komei", birthYear:"1831", deathYear:"1867" },
    { key:"1234", parent:"123", name:"Matsuhito", gender:"M", fullTitle:"Emperor Meiji", kanjiName:"睦仁 明治天皇", posthumousName:"Meiji", birthYear:"1852", deathYear:"1912" },
      { key:"12345", parent:"1234", name:"Toshiko", gender:"F", fullTitle:"Princess Yasu-no-Miya Toshiko", birthYear:"1896", deathYear:"1978", statusChange:"In 1947, lost imperial family status due to American abrogation of Japanese nobility" },
        { key:"123456", parent:"1234", name:"Higashikuni Morihiro", gender:"M", fullTitle:"Prince Higashikuni Morihiro", kanjiName:"東久邇宮 盛厚王", birthYear:"1916", deathYear:"1969", statusChange:"In 1947, lost imperial family status due to American abrogation of Japanese nobility" },
          { key:"78", parent:"12345", name:"See spouse for descendants"},
        { key:"781", parent:"12345", name:"Moromasa", gender:"M", fullTitle:"Prince Moromasa", kanjiName:"師正王", birthYear:"1917", deathYear:"1923" },
        { key:"783", parent:"123456", name:"Akitsune", gender:"M", fullTitle:"Prince Akitsune", kanjiName:"彰常王", birthYear:"1920", deathYear:"2006", statusChange:"In 1947, lost imperial family status due to American abrogation of Japanese nobility" }
    ];
    // create the model for the family tree
    myDiagram.model = new go.TreeModel(nodeDataArray);
  }
</script>
</head>
<body onload="init()">
<div id="sample">
  <div id="myDiagram" style="background-color: white; border: solid 1px black; width: 100%; height: 600px"></div>
</div>
</body>
</html>