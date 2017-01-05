//金币id
var GOLDID = 26;
// 钻石id
var DIAMONDID = 27;
// 绑定钻石id
var BDDIAMONDID = 868;
// 勋章id
var BADGEID = 28;

// 金币数
var GOLDNUM = 50000;
// 钻石数
var DIAMONDNUM = 500;
// 绑定钻石数
var BDDIAMONDNUM = 1000;
// 勋章数
var BADGENUM = 100;

function confirms(ids,num){
	var msg = "奖励含有最大值为：\n\t";
	for ( var i = 0; i < ids.length; i++) {
		if(ids[i] == GOLDID){
			if(num[i] >= GOLDNUM){
				msg = msg + fmoney(num[i],0) + " 金币ID:26\n\t";
			}
		} else if(ids[i] == DIAMONDID){
			if(num[i] >= DIAMONDNUM){
				msg = msg + fmoney(num[i],0) + " 钻石ID:27\n\t";
			}
		} else if(ids[i] == BDDIAMONDID){
			if(num[i] >= BDDIAMONDNUM){
				msg = msg + fmoney(num[i],0) + " 绑定钻石ID:868\n\t";
			}
		} else if(ids[i] == BADGEID){
			if(num[i] >= BADGENUM){
				msg = msg + fmoney(num[i],0) + " 勋章ID:28\n\t";
			}
		}
		
	}
	if(msg != "奖励含有最大值为：\n\t"){
		return confirm(msg);
	}
	return true;
}

function readExcel1(filePath){
	var tempStr = "<table width='1000' border='0' cellpadding='0' cellspacing='1' class='sortable' id='mytable'>";
	var oXL = new ActiveXObject("Excel.Application"); 
	var oWB = oXL.Workbooks.open(filePath);
	oWB.worksheets(1).select();
	var oSheet = oWB.ActiveSheet;
	var row=null;
	var msg = "奖励含有最大值为：\n\t";
	// 金币总数
	var GOLDCOUNT = 0;
	// 钻石总数
	var DIAMONDCOUNT = 0;
	// 绑定钻石总数
	var BDDIAMONDCOUNT = 0;
	// 勋章总数
	var BADGECOUNT = 0;
	// 是否提示
	var ISSHOW = false;
	// 是否超过钻石限制
	var ISTHEREDIAMOND = false;
	// 是否超过绑定钻石限制
	var ISTHEREBDDIAMOND = false;
	// 是否超过勋章限制
	var ISTHEREBADGE = false;
	// 金币最大值
	var GOLDMAX = 0;
	// 钻石最大值
	var DIAMONDMAX = 0;
	// 绑定钻石最大值
	var BDDIAMONDMAX = 0;
	// 勋章最大值
	var BADGEMAX = 0;
	
	if(row == null){row = oSheet.usedrange.rows.count;}else if(isNaN(row)){row = oSheet.usedrange.rows.count;}
	
	try{
   		for(var i=2;i<=row;i++){
   			if(oSheet.Cells(i,2).value == GOLDID){
   				if(oSheet.Cells(i,3).value >= GOLDNUM){
   					if(GOLDMAX < oSheet.Cells(i,3).value){
   						GOLDMAX = oSheet.Cells(i,3).value
   					}
   				}
   				GOLDCOUNT = GOLDCOUNT + oSheet.Cells(i,3).value;
   			} else if(oSheet.Cells(i,2).value == DIAMONDID){
   				if(oSheet.Cells(i,3).value >= DIAMONDNUM){
   					if(DIAMONDMAX < oSheet.Cells(i,3).value){
   						DIAMONDMAX = oSheet.Cells(i,3).value
   					}
   				}
   				DIAMONDCOUNT = DIAMONDCOUNT + oSheet.Cells(i,3).value;
   			} else if(oSheet.Cells(i,2).value == BDDIAMONDID){
   				if(oSheet.Cells(i,3).value >= BDDIAMONDNUM){
   					if(BDDIAMONDMAX < oSheet.Cells(i,3).value){
   						BDDIAMONDMAX = oSheet.Cells(i,3).value
   					}
   				}
   				BDDIAMONDCOUNT = BDDIAMONDCOUNT + oSheet.Cells(i,3).value;
   			} else if(oSheet.Cells(i,2).value == BADGEID){
   				if(oSheet.Cells(i,3).value >= BADGENUM){
   					if(BADGEMAX < oSheet.Cells(i,3).value){
   						BADGEMAX = oSheet.Cells(i,3).value
   					}
   				}
   				BADGECOUNT = BADGECOUNT + oSheet.Cells(i,3).value;
   			}
		 	continue;
   		}
   		oXL.Quit();
   		if(GOLDMAX > 0){
			msg = msg + fmoney(GOLDMAX,0) + " 金币ID:26\n\t";
			ISSHOW = true;
		}
		if(DIAMONDMAX > 0){
			msg = msg + fmoney(DIAMONDMAX,0) + " 钻石ID:27\n\t";
			ISSHOW = true;
		}
		if(BDDIAMONDMAX > 0){
			msg = msg + fmoney(BDDIAMONDMAX,0) + " 绑定钻石ID:868\n\t";
			ISSHOW = true;
		}
		if(BADGEMAX > 0){
			msg = msg + fmoney(BADGEMAX,0) + " 勋章ID:28\n\t";
			ISSHOW = true;
		}
		if(ISSHOW){
			msg = msg + "\n货币总额为：\n\t" + fmoney(GOLDCOUNT,0) + " 勋章\n\t" + fmoney(DIAMONDCOUNT,0) + " 勋章\n\t" + fmoney(BDDIAMONDCOUNT,0) + " 勋章\n\t" + fmoney(BADGECOUNT,0) + " 勋章\n\t";
			return confirm(msg);
		}
	}catch(e){
		alert("文件内容错误！");
		oXL.Quit();
	}
}

function fmoney(s, n)  
{  
   n = n > 0 && n <= 20 ? n : 0;  
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
   var l = s.split(".")[0].split("").reverse(),  
   r = s.split(".")[1];  
   t = "";  
   for(i = 0; i < l.length; i++ )  
   {  
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
   }  
   return t.split("").reverse().join("");  
}   
