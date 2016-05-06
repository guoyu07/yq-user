// JavaScript Document
function OpNav(obj){
	var ul=obj.parentNode.getElementsByTagName('ul')
	var inul=obj.getElementsByTagName('ul')
	var state=inul.item(0).className
	if(state=="block"){
		setstate="none";
	}else{
		setstate="block";
	}
	for(i=0;i<ul.length;i++){
		ul.item(i).className="none";
	}
	inul.item(0).className="block";
}




//根据点击的导航，在右边内容页，显示导航标题
function writeTitle(tit){
	if(tit!=""){
		document.getElementById("mTitle").innerHTML=tit
	}
	else{
		document.getElementById("mTitle").innerHTML="Main" 
	}
}
//显示隐藏左侧
function leftOption(){
	var leftwidth=document.getElementById("leftnav").style.display;
	if(leftwidth==""){
		document.getElementById("leftnav").style.display="none";
		document.getElementById("rightcontent").style.width="100%";

	}else{
		document.getElementById("leftnav").style.display="";
		document.getElementById("rightcontent").style.width="";

	}
}