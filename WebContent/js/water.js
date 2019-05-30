
setTimeout("getAllWater()","500");

function getAllWater(){
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/water.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			showinfo(data,"water");
			showtable(data);
		}  
	}); 
}

function showtable(data){
	$("#waterbt").empty();
	$("#waterlist").empty();
	var strbt="<tr class='tit'><td>站点</td><td>实时水位</td><td>警戒水位</td></tr>";
	var str="";
	for(var i=0;i<data.length;i++){
		str +="<tr><td><a href='javascript:void(0)' onclick='showPoint("+data[i].longtitude+","+data[i].latitude+");'>"+data[i].name+"</a></td><td>"+data[i].shuiwei+"</td><td>"+data[i].alertz+"</td></tr>";
	}
	$("#waterbt").append(strbt);
	$("#waterlist").append(str);
}

