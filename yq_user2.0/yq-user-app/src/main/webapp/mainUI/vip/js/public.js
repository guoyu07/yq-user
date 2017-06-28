function $$(ele){return document.getElementById(ele)};
var ele=$$('A-coin-list').getElementsByTagName('a');
if($('#scroll').length){
    $('#scroll').height(793-63-175+'px')
}
function ajax(action,url,obj,callback,jsonp){
       $.ajax({
            type:action,
            url:url,
            data:obj,
           success:function(data){
                 callback(data)
            }

        });
}


function getUserProperty(){
    ajax('get','/vip/getUserProperty',null,function(data){
                console.log(data)
                if(data.rc=='nologin'){
                    location.href="/mainUI/vip/index.html";
                    return ;
                }
                
                if(data.rc=="noPermission"){
                    location.href="https://vip.zgyce.com/index.jsp";
                    return ;
                }
                for(key in data){
                   if(key == 'vipuser'){
                     $$('p-1').innerHTML=data[key].moneypot;
                     $$('p-2').innerHTML=data[key].czbye;
                     $$('p-3').innerHTML=data[key].czbljczs;
                     $$('p-4').innerHTML=data[key].yyczb;
                     $$('p-5').innerHTML=data[key].bybdb;
                   }
                }
                if($('#user').length){
                   $('#user').html(data.vipuser.user)
                }
                
                if($('#yibi').length){
                    $('#yibi').html(data.vipuser.yb)
                }
                
                if($('#sy').length){
                  $('#sy').html(data.vipuser.sybdb)
                }
                
                if($('#Roll-user').length){
                   $('#Roll-user').val(data.vipuser.user)
                }
                 
                if($('#b-user').length){
                    $$('b-user').value=data.vipuser.user;
                }
                if($('#op').length){
                    $$('op').innerHTML=data.vipuser.czbye;
                }
                if($('#oa').length){
                    $$('oa').innerHTML=data.vipuser.bybdb;
                }
                $$('username').innerHTML='用户名:'+data.vipuser.user;
                
    })
  }
getUserProperty()


$$('Log-out').onclick=function(){
        ajax('get','/vip/loginout',null,function(data){
            if(data.erroCodeNum==2000){
                location.href="index.html"
            }
       })
}

var countdown=60;
function settime(val){
    if (countdown == 0) { 
        val.removeAttribute("disabled");    
        val.value="发送验证码"; 
        countdown = 60; 
        clearTimeout(time)
        return ;
    }else{ 
        val.setAttribute("disabled", true); 
        val.value="重新发送(" + countdown + ")"; 
        countdown--; 
    } 
    var time=setTimeout(function() { 
        settime(val) 
    },1000) 
} 
