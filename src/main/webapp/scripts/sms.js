function setCookie(name, value, time) {
	var strsec = getsec(time);
	var exp = new Date();
	exp.setTime(exp.getTime() + strsec * 1);
	document.cookie = name + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}

function getsec(str) {
	var str1 = str.substring(1, str.length) * 1;
	var str2 = str.substring(0, 1);
	if (str2 == "s") {
		return str1 * 1000;
	} else if (str2 == "h") {
		return str1 * 60 * 60 * 1000;
	} else if (str2 == "d") {
		return str1 * 24 * 60 * 60 * 1000;
	}
}

function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}

function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires="
				+ exp.toGMTString();
}

var cookiesName = "secondsremained";
var initWait = 60;
function settime(o) {
	var wait = getCookie(cookiesName);
	if (!wait) {
		wait = initWait;
		setCookie(cookiesName, wait, "h1");
	}
	if (wait == 0) {
		o.removeAttr("disabled");
		o.val("获取验证码");
		delCookie(cookiesName);
	} else {
		o.attr("disabled", "disabled");
		o.val(wait + "秒后可重发");
		wait--;
		setCookie(cookiesName, wait, "h1");
		setTimeout(function() {
			settime(o)
		}, 1000)
	}
}

function btnStatus(o){
	if(!o){
		return;
	}
	var wait = getCookie(cookiesName);
	//alert("wait==="+wait);
	if(wait!=null&&wait>0){
		o.attr("disabled", "disabled");
		o.val(wait + "秒后可重发");
		wait--;
		setCookie(cookiesName, wait, "h1");
		setTimeout(function() {
			settime(o)
		}, 1000);
	}
}
