<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<% 
t = Now()
y = Year(t)
mo = Month(t)
d = Day(t)
h = Hour(t)
m = Minute(t)
s = Second(t)
sm = right("0" & m,2)
sm = cdbl(left(sm,1) & "9")

%>
<!--<span id="RemainD">&nbsp;</span>Ìì<span id="RemainH">&nbsp;</span>Ê±--><p align="center"><span id="RemainM">&nbsp;</span>Minute<span id="RemainS">&nbsp;</span>Second
<script type="text/javascript">
	var startTime = new Date();
	startTime.setFullYear(<%= y %>, <%= mo - 1 %>, <%= d %>);
	startTime.setHours(<%= h %>);
	startTime.setMinutes(<%= sm %>);
	startTime.setSeconds(59);
	startTime.setMilliseconds(999);
	var EndTime=startTime.getTime();
	function GetRTime(){
		var NowTime = new Date();
		var nMS = EndTime - NowTime.getTime();
		var nD = Math.floor(nMS/(1000 * 60 * 60 * 24));
		var nH = Math.floor(nMS/(1000*60*60)) % 24;
		var nM = Math.floor(nMS/(1000*60)) % 60;
		var nS = Math.floor(nMS/1000) % 60;
		if (nMS < 0){
			window.location.href="xtepkj.asp";
			//window.location.reload();
			$("#dao").hide();
			$("#daoend").show();
		}else{
		   $("#dao").show();
		   $("#daoend").hide();
		   //$("#RemainD").text(nD);
		   //$("#RemainH").text(nH);
		   $("#RemainM").text(nM);
		   $("#RemainS").text(nS); 
		}
	}
	
	$(document).ready(function () {
		var timer_rt = window.setInterval("GetRTime()", 1000);
	});
</script></p>