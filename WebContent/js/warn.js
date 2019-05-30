setTimeout("warnInfoW()","500");

function getWwarn(){
	if(document.getElementById("Wwarn").checked){
		warnInfoW();
	}else{
		getAllWater();
	}
}
function getRwarn(){
	if(document.getElementById("Rwarn").checked){
		warnInfoR();
	}else{
		getAllRain();
	}
}

function warnInfoW(){
	var obj1 =[];
	
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/water.json",//请求路径  
		dataType: "json",//数据格式  
		async:false,//同步
		success: function(data){ 
			for (var i = 0; i < data.length; i++) {
				if(data[i].shuiwei>data[i].alertz){
					var warn={
							name:data[i].name,
							longtitude:data[i].longtitude,
							latitude:data[i].latitude,
							con:"水位超过警戒值"+(data[i].shuiwei-data[i].alertz).toFixed(2)+"(m)"
							};
					obj1.push(warn);
				}
			}
		}  
	}); 
	
	showinfo(obj1,"warn");
	showtableWarnW(obj1);
	
}

function warnInfoR(){
	var obj2 =[];
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/rain.json",//请求路径  
		dataType: "json",//数据格式 
		async:false,//同步
		success: function(data){ 
			for (var i = 0; i < data.length; i++) {
				var warn=new Object();
				if(data[i].yuliang>10){
					warn.name=data[i].name;
					warn.longtitude=data[i].longtitude;
					warn.latitude=data[i].latitude;
					warn.con="暴雨预警";
					obj2.push(warn);
				}
			}
		}  
	}); 
	showinfo(obj2,"warn");
	showtableWarnR(obj2);
}

function showtableWarnW(data){
	$("#waterlist").empty();
	$("#waterbt").empty();
	var strbt="<tr class='tit'><td>站点</td><td>预警信息</td></tr>";
	var str="";
	for(var i=0;i<data.length;i++){
		str +="<tr><td>"+data[i].name+"</td><td>"+data[i].con+"</td></tr>";
	}
	$("#waterlist").append(str);
	$("#waterbt").append(strbt);
}
function showtableWarnR(data){
	$("#rainbt").empty();
	$("#rainlist").empty();
	var strbt="<tr class='tit'><td>站点</td><td>预警信息</td></tr>";
	var str="";
	for(var i=0;i<data.length;i++){
		str +="<tr><td>"+data[i].name+"</td><td>"+data[i].con+"</td></tr>";
	}
	$("#rainlist").append(str);
	$("#rainbt").append(strbt);
}