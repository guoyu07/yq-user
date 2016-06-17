<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:if test="${erroCodeNum==1}"><script language=javascript>alert('还没有到结算的日期（每星期二22点后）！');history.go(-1);</script></c:if>
<c:if test="${erroCodeNum==2000}"><script language=javascript>alert('游戏业务结算成功！');history.go(-1);</script></c:if>
<html><head><title>Untitled Document</title>
<style>
.box{position:absolute;width:600px;left:50%;height:auto;z-index:100;background-color:#fff;border:1px #ddd solid;padding:1px;}
.box h2{height:25px;font-size:14px;background-color:#aaa;position:relative;padding-left:10px;line-height:25px;color:#fff;}
.box h2 a{position:absolute;right:5px;font-size:12px;color:#fff;}
.box .list{padding:10px;}
.box .list li{height:24px;line-height:24px;}
.box .list li span{margin:0 5px 0 0;font-family:"宋体";font-size:12px;font-weight:400;color:#ddd;}
.showbtn {font:bold 24px '微软雅黑';}
#bg{background-color:#666;position:absolute;z-index:99;left:0;top:0;display:none;width:100%;height:100%;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
</style>
<script src="/scripts/jquery.js"></script>
</head><body>
<br />
<br />
<br />
<br />
<br />
<center>
<p class="showbtn"><a onClick="return confirm('提示：您确定了吗？')" href='doubleareacount?status=1'>执行双区计算</a></p>
<br />
<br />
<br />
<br />
<br />
<div id="bg"></div>
<div class="box" style="display:none">
    <h2>正在执行计算。。。请不要关闭界面！</h2>
</div>
</body></html>

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